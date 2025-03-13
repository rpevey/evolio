#This script performs differential expression analysis on the Liu et. al. TDP-43 in FTD/FTD-ALS dataset and my TDP in AD datasets using DESeq2.

library(ggplot2)
library(dplyr)
library(edgeR)
library(limma)
library(Glimma)
# library(RColorBrewer)
# library(matrixStats)
library(viridis)
library(biomaRt)
library(org.Hs.eg.db)
library(DESeq2)
library(treemap)
library(vsn)
library(Glimma)
library(plotly)
library(outliers)
library(shiny)
library(pheatmap)
library(tidyverse)
library(EnhancedVolcano)


###DESeq DE analysis

###Import read count matrix for TDP in AD

dat <- read.delim(paste0('C:/Users/ryanp/Documents/ASU/Projects/TDP43_AD/Data/RNAseq/facsRNAseq/data/','htseqOut/merged.tsv'), header = TRUE, sep="\t", check.names = FALSE)
dat[1:4,1:4]

#Remove degraded, ND-TDPlow and run 9 samples based on EDA results from dat, and Samples 33 and 34 because they had CMT disease.
naughtyList <- c('1_AD_TDP_14_22_01','10_MCI_21_12_02','12_ND_09_34_02','18_ND_08_90_03','30_ND_10_63_05','36_ND_99_54_06','42_ND_20_57_07','49_AD_TDP_19_45_09','50_AD_TDP_19_45_09','51_MCI_07_52_09','52_MCI_07_52_09','53_ND_10_26_09','6_ND_01_46_01','9_MCI_21_12_02', '33_MCI_14_45_06', '34_MCI_14_45_06')
colnames(dat)
length(colnames(dat))
length(naughtyList)
grep(naughtyList[16], colnames(dat))
dat <- dat[,-c(1,3,9,11,22,25,26,28,34,40,41,42,43,44,51,54)]
length(colnames(dat))
grep(naughtyList[15], colnames(dat))
#Remove special tagged rows, the last five, from the tail of dat.
length(dat[,1])
tail(dat)[,1:3]
dat <- dat[1:(length(dat[,1])-5),]
tail(dat)[,1:3]
length(dat[,1])

#Import sample metadata.
metadata <- read.delim(paste0('C:/Users/ryanp/Documents/ASU/Projects/TDP43_AD/Data/RNAseq/facsRNAseq/data/','BNI TDP43 data for Ryan.csv'), header=TRUE, sep=",")
head(metadata)

#Remove degraded, ND-TDPlow and run 9 samples based on EDA results from metadata.
metadata$Jensen.ID
metadata$PeveyID
grep(naughtyList[15], metadata$Jensen.ID)
metadata <- metadata[-c(1,3,21,24,25,27,37,39,40,41),]
#reorder metadata to match counts matrix (dat).
metadata <- metadata[c(1:7,9:17,8,19:24,18,25:30,32:36,31,37,38),]
all(colnames(dat) == metadata$Jensen.ID)
# colnames(dat) == metadata$Jensen.ID

#Metadata RandomSample, sex, race/ethnicity, ApoE, ThalPhase, Braak and Run variables as factors
metadata$DX <- factor(metadata$DX, levels = c('ND','MCI','AD-TDP'))
levels(metadata$DX) <- c('ND','MCI','ADTDP')
metadata$Sex <- as.factor(metadata$Sex)
levels(metadata$Sex) <- c('Male','Female')
metadata$tdpStatus <- factor(metadata$tdpStatus, levels = c('TDPhigh','TDPlow'))
metadata$Run <- as.factor(metadata$Run)
#Remove all of one of the sexes
# metadata <- metadata[metadata$Sex=='Female',]
# dat <- dat[,metadata$Jensen.ID]
#Collapse MCI and AD groups

#Create sample information table
coldata <- metadata[,c('DX','tdpStatus','Sex','Run','Sorted.nuclei','PMI','Case')]
coldata$Case <- as.factor(coldata$Case)
coldata$group <- factor(paste0(coldata$DX,'.', coldata$tdpStatus),
                        levels = c('ND.TDPhigh','MCI.TDPhigh', 'MCI.TDPlow', 'ADTDP.TDPhigh', 'ADTDP.TDPlow'))
levels(coldata$group)
coldata$merge <- ifelse(coldata$group %in% c('MCI.TDPhigh', 'ADTDP.TDPhigh'), 'DX.TDPhigh', ifelse(coldata$group %in% c('MCI.TDPlow', 'ADTDP.TDPlow'), 'DX.TDPlow', 'ND.TDPhigh'))
coldata$merge <- factor(coldata$merge, levels = c('ND.TDPhigh', 'DX.TDPhigh', 'DX.TDPlow'))
# coldata$merge
rownames(coldata) <- metadata$PeveyID
colnames(dat) <- metadata$PeveyID

#Extract AD-TDPlow samples
str(dat)
dat <- dat[,c(which(coldata$group == 'ADTDP.TDPlow'))]
head(dat)


###Import read count matrix for FTD

ftd <- read.delim(paste0('C:/Users/ryanp/Documents/ASU/Projects/TDP43_AD/Data/RNAseq/LeeAnalysis/data/','htseqOut/merged.tsv'), header = TRUE, sep="\t", check.names = FALSE)
ftd[1:4,1:4]

#Remove unsorted samples from ftd.
naughtyList <- c('SRR8571943','SRR8571946')
colnames(ftd)
length(colnames(ftd))
length(naughtyList)
grep(naughtyList[1], colnames(ftd))
ftd <- ftd[,-c(7,10)]
length(colnames(ftd))
grep(naughtyList[1], colnames(ftd))
#Remove special tagged rows, the last five, from the tail of ftd.
length(ftd[,1])
tail(ftd)[,1:3]
ftd <- ftd[1:(length(ftd[,1])-5),]
tail(ftd)[,1:3]
length(ftd[,1])

#Import sample metadata.
metaftd <- read.delim(paste0('C:/Users/ryanp/Documents/ASU/Projects/TDP43_AD/Data/RNAseq/LeeAnalysis/data/',"SraRunTable.txt"), header=TRUE, sep="\t")
head(metaftd)

#Remove unsorted samples..
colnames(metaftd)[1] <- 'SampleID'
metaftd$SampleID
grep(naughtyList[1], metaftd$SampleID)
metaftd <- metaftd[-c(7,10),]
#reorder metadata to match counts matrix (ftd).
all(colnames(ftd) == metaftd$Run)
# colnames(ftd) == metaftd$SampleID

#Metadata diagnosis, gender, genotype.variation variables as factors
metaftd$diagnosis <- factor(metaftd$diagnosis, levels = c('FTD','FTD-ALS'))
metaftd$gender <- factor(metaftd$gender, levels = c('female','male'))
# levels(metaftd$gender) <- c('male','female')
metaftd$genotype.variation <- factor(metaftd$genotype.variation, levels = c('TDP-43 positive', 'TDP-43 negative'))
levels(metaftd$genotype.variation) = c('TDPhigh','TDPlow')
colnames(metaftd)[7] <- 'tdpStatus'

#Create sample information table
colftd <- metaftd[,c('diagnosis','tdpStatus','gender','SampleID','AvgSpotLen')]
colnames(colftd)[1] <- 'DX'
colftd$DX <- 'FTD'
colftd$group <- factor(paste0(colftd$DX,'.', colftd$tdpStatus),
                        levels = c('FTD.TDPhigh','FTD.TDPlow'))
levels(colftd$group)
rownames(colftd) <- metaftd$SampleID
colnames(ftd) #<- metadata$SampleID
all(rownames(colftd) == colnames(ftd))

#Extract AD-TDPlow samples
str(ftd)
ftd <- ftd[,c(which(colftd$tdpStatus == 'TDPlow'))]
head(ftd)


###Create merged dataset
dat <- cbind(dat,ftd)
head(dat)

#Create merged metadata and coldata
colnames(metaftd) <- c('RandomSample', 'AvgSpotLen', 'cell_type', 'DX', 'sex', 'tissue', 'tdpStatus')
metadata <- rbind(metadata[which(coldata$group == 'ADTDP.TDPlow'),c(1,2,14)], metaftd[which(colftd$tdpStatus == 'TDPlow'),c(1,4,7)])

coldata <- rbind(coldata[which(coldata$group == 'ADTDP.TDPlow'),c(1,2,8)], colftd[which(colftd$tdpStatus == 'TDPlow'),c(1,2,6)])
coldata$DX <- factor(coldata$DX, levels = c('ADTDP', 'FTD'))
levels(coldata$DX)

###
#Create DESeqDataSet object
dds <- DESeqDataSetFromMatrix(countData = dat,
                              colData = coldata,
                              design = ~ group)
# design = ~ SampleID + group)
# design = ~ SampleID + tdpStatus)
# design = ~ gender + SampleID + group)
# design = ~ tdpStatus + diagnosis)

dds

#Pre-filter low count genes
#Smallest group size is samples.
smallestGroupSize <- 7
keep <- rowSums(counts(dds) >= 10) >= smallestGroupSize
dds <- dds[keep,]

#Confirm factor levels
dds$DX
dds$tdpStatus
dds$group

#Differential expression analysis
dds <- DESeq(dds)
# dds <- DESeq(dds, test = 'LRT', reduced = ~ Sex)
#Remove nonconverged genes
dds <- dds[which(mcols(dds)$betaConv),]
boxplot(log2(counts(dds, normalized = TRUE)+1), axes = FALSE, ylab = 'log2 counts')
axis(1, labels = FALSE, at = c(seq(1,40,1)))
axis(2, labels = TRUE)
text(x = seq_along(colnames(dds)), y = -1.5, labels = colnames(dds), 
     srt = 45,    #rotate
     adj = 1,    #justify
     xpd = TRUE, #print outside of plot area
     cex = 0.75)  #smaller font size

#Plot dispersion estimates
plotDispEsts(dds)

#Use biomaRt to replace Ensembl ID with Gene name.
# searchDatasets(mart = ensembl, pattern = "hsapiens")
# ensembl <- useEnsembl(biomart = "genes", dataset = "hsapiens_gene_ensembl")
IDs <- rownames(dds)
head(IDs)
# geneID <- getBM(attributes=c('ensembl_gene_id','external_gene_name','gene_biotype','description','chromosome_name'), filters = 'ensembl_gene_id', values = IDs, mart =ensembl)
#If biomart server is down, load the following rds file of geneID.
# saveRDS(geneID, 'C:/Users/ryanp/Documents/ASU/Projects/TDP43_AD/Data/RNAseq/facsRNAseq/bin/geneID_DE_AD-FTD.rds')
geneID <- readRDS('C:/Users/ryanp/Documents/ASU/Projects/TDP43_AD/Data/RNAseq/facsRNAseq/bin/geneID_DE_AD-FTD.rds')
head(geneID)
colnames(geneID)[1:2] <- c('ensemblID', 'geneID')
#check that IDs and geneID match each other
all(IDs == geneID$ensemblID)
length(which(IDs!=geneID$ensemblID))
length(IDs)
length(geneID$ensemblID)
tail(IDs)
tail(geneID$ensemblID)

#Match geneID to IDs for missing values
geneID <- geneID[match(IDs, geneID$ensemblID),]
all(IDs == geneID$ensemblID)
length(IDs)
length(geneID$geneID)
tail(IDs)
tail(geneID$ensemblID)
#all() will return NA if some of the values in the vector are NA.
all(IDs == geneID$ensemblID)
length(which(IDs!=geneID$ensemblID))
all(IDs == geneID$ensemblID, na.rm = TRUE)
#Spot check random IDs and ensemblIDs for sanity check
rndm <- round(runif(5, min = 0, max = length(IDs)), digits = 0)
IDs[rndm]
geneID$ensemblID[rndm]
geneID$geneID[rndm]

#Add geneID to dds metadata
# geneID <- geneID$geneID
mcols(dds) <- cbind(mcols(dds), geneID[,2:5])
# saveRDS(dds, 'C:/Users/ryanp/Documents/ASU/Projects/TDP43_AD/Data/RNAseq/facsRNAseq/bin/dds_DE_AD-FTD.rds')
# dds <- readRDS('C:/Users/ryanp/Documents/ASU/Projects/TDP43_AD/Data/RNAseq/facsRNAseq/bin/dds_DE_AD-FTD.rds')

#Build results table
levels(dds$group)
#Set contrast groups, reference level should be listed last.
contrast <- c('group', 'ADTDP.TDPlow', 'FTD.TDPlow')

res <- results(dds,
               contrast = contrast,
               alpha = 0.1,
               pAdjustMethod = 'BH')
res
summary(res)

#How many adjusted p-values are less than 0.1?
sum(res$padj < 0.1, na.rm=TRUE)
table(res$padj < 0.1)
#Create significant results table ordered by fold change
res10 <- res[which(res$padj < 0.1),]
res10 <- res10[order(-res10$log2FoldChange),]
#How many adjusted p-values are less than 0.05?
sum(res$padj < 0.05, na.rm=TRUE)
table(res$padj < 0.05)

#How many up-regulated (FDR < 0.1)
length(which(res10$log2FoldChange > 0))
#How many down-regulated (FDR < 0.1)
length(which(res10$log2FoldChange < 0))

bar <- data.frame(direction = c('up','down'), genes = c(length(which(res10$log2FoldChange > 0)),length(which(res10$log2FoldChange < 0))))
bar

#Log fold change shrinkage for visualization and ranking
plotMA(res, ylim=c(-3,3))
resultsNames(dds)
resLFC <- lfcShrink(dds, contrast = contrast, type = 'ashr')
resLFC
plotMA(resLFC, ylim=c(-3,3))

#Add geneID variables
res <- cbind(res,geneID[,2:5])
head(res)

#Write out results table
#Order results table by smallest p-value
res <- res[,c(7,1:6,8:10)]
colnames(res)[7] <- 'FDR'
all(rownames(res) == rownames(dds))
# rownames(res) <- rownames(dds)
res <- res[order(res$FDR),]
res
# write.csv(as.data.frame(res), file=paste0('C:/Users/ryanp/Documents/ASU/Projects/TDP43_AD/Data/RNAseq/facsRNAseq/results/DE/Tier1/DE/','ADTDP.TDPlow','_','FTD.TDPlow','_allGenes_DEresults.csv'), row.names = TRUE)

#Create treemap of gene biotypes for all genes
biotype <- data.frame(table(mcols(dds)$gene_biotype))
biotype$Var1 <- gsub('_',' ',biotype$Var1)
biotype <- biotype[order(biotype$Freq, decreasing = TRUE),]
# png(filename='C:/Users/Ryan Pevey/Documents/ASU/Projects/TDP43_AD/Data/RNAseq/facsRNAseq/results/DE/Tier1/figs/tree.png',width=800, height=1295)
treemap(biotype,
        index = 'Var1', 
        vSize = 'Freq', 
        type = 'index',
        palette = viridis(length(biotype$Var1)),
        aspRatio = 1/1.618,
        title = '',
        inflate.labels = TRUE,
        lowerbound.cex.labels = 0
)
# dev.off()

#Create treemap of gene biotypes for significant results genes
res$gene_biotype <- as.factor(res$gene_biotype)
levels(res$gene_biotype)
biotype <- data.frame(table(res$gene_biotype))
biotype$Var1 <- gsub('_',' ',biotype$Var1)
biotype <- biotype[order(biotype$Freq, decreasing = TRUE),]
# png(filename='C:/Users/Ryan Pevey/Documents/ASU/Projects/TDP43_AD/Data/RNAseq/facsRNAseq/results/Tier1/figs/tree.png',width=800, height=1295)
treemap(biotype,
        index = 'Var1', 
        vSize = 'Freq', 
        type = 'index',
        palette = viridis(length(biotype$Var1)),
        aspRatio = 1/1.618,
        title = '',
        inflate.labels = TRUE,
        lowerbound.cex.labels = 0
)
# dev.off()


###
#VST for visualization and ranking
vsd <- vst(dds, blind = FALSE)
# head(assay(vsd), 3)

ntd <- normTransform(dds)
meanSdPlot(assay(ntd))
meanSdPlot(assay(vsd))

#Data Quality assessment by sample clustering and visualization
ann_colors = viridis(5, begin = 0, end = 1, direction = 1)
ann_colors = list(DX = c(FTD=ann_colors[2], ADTDP=ann_colors[1]),
                  tdpStatus = c(TDPhigh=ann_colors[4], TDPlow=ann_colors[5]))
df <- as.data.frame(colData(dds)[,c('DX','tdpStatus')])

# select <- order(rowMeans(counts(dds, normalized = TRUE)),
#                 decreasing = TRUE)[1:10]
# vsd <- vsd[,c(which(vsd$group=='ND.TDPhigh'),which(vsd$group=='ADTDP.TDPlow'))]
# pheatmap(assay(vsd)[select,],
#          cluster_rows = TRUE,
#          show_rownames = TRUE,
#          cluster_cols = FALSE,
#          annotation_col = df,
#          annotation_colors = ann_colors,
#          labels_row = mcols(vsd)$geneID,
#          color = viridis(n=256, begin = 0, end = 1, direction = -1))

vsd <- vsd[,c(which(vsd$group==contrast[2]),which(vsd$group==contrast[3]))]
# select <- assay(vsd)[head(order(res$FDR),100),]
#Up-regulated genes
geneNum <- 40
selectUp <- assay(vsd)[rownames(res10),][1:geneNum,]
selectUpNames <- rownames(res10)[1:geneNum]
selectUpNames <- which(rownames(dds)%in%selectUpNames)
zUp <- (selectUp - rowMeans(selectUp))/sd(selectUp) #z-score
pheatmap(zUp,
         cluster_rows = TRUE,
         show_rownames = TRUE,
         cluster_cols = FALSE,
         annotation_col = df,
         annotation_colors = ann_colors,
         labels_row = mcols(vsd)$geneID[selectUpNames],
         color = viridis(n=256, begin = 0, end = 1, direction = -1))

#Down-regulated genes
geneNum <- 40
selectDown <- assay(vsd)[rownames(res10),][(length(res10[,1])-geneNum):length(res10[,1]),]
selectDownNames <- rownames(res10)[(length(res10[,1])-geneNum):length(res10[,1])]
selectDownNames <- which(rownames(dds)%in%selectDownNames)
zDown <- (selectDown - rowMeans(selectDown))/sd(selectDown) #z-score
pheatmap(zDown,
         cluster_rows = TRUE,
         show_rownames = TRUE,
         cluster_cols = FALSE,
         annotation_col = df,
         annotation_colors = ann_colors,
         labels_row = mcols(vsd)$geneID[selectDownNames],
         color = viridis(n=256, begin = 0, end = 1, direction = -1))

#Up and Down-regulated genes
selectUpDownNames <- c(selectUpNames,selectDownNames)
zUpDown <- rbind(zUp, zDown) #z-score
setwd('C:/Users/ryanp/Documents/ASU/Projects/TDP43_AD/Data/RNAseq/facsRNAseq/results/DE/Tier1/figs/')
tiff(filename= paste0('ADTDP.TDPlow','_','FTD.TDPlow','_upDownHeatmap.tiff'),width=1200, height=1000)
pheatmap(zUpDown,
         fontsize = 14,
         cluster_rows = TRUE,
         show_rownames = TRUE,
         cluster_cols = FALSE,
         annotation_col = df,
         annotation_colors = ann_colors,
         gaps_col = c(9),
         labels_row = mcols(vsd)$geneID[selectUpDownNames],
         labels_col = "",
         show_colnames = F,
         color = viridis(n=256, begin = 0, end = 1, direction = -1))
dev.off()
