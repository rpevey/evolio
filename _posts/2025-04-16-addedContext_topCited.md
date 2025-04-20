---
title: "Source Material: The most cited papers ever"
author: "Ryan Pevey"
date: "25-04-20"
output: 
  md_document:
    variant: gfm  # GitHub-Flavored Markdown (compatible with Jekyll)
    toc: false
    preserve_yaml: true
layout: single  # This tells Jekyll to use its default theme
always_allow_html: true # Ensures widgets and interactive elements render
categories: [addedContext]
tags: [data-viz, reanalysis, science-media]
---

<style>
iframe {
  width: 100%;
}
&#10;@media (max-width: 768px) {
  .side-by-side-container {
    flex-direction: column;
  }
&#10;  .left-panel, .right-panel {
    width: 100%;
  }
}
</style>

by Ryan Pevey

*Added Context* is a recurring series where I revisit headlines, stats,
and science news stories that could use a little more nuance; adding a
fresh visualization or a bit of extra context to make the numbers easier
to explore. Think of it as a friendly data companion to the headlines.

## What are the top cited scientific papers of all time?

Nature recently published a list of the [most cited scientific papers
all time](https://www.nature.com/articles/d41586-025-01124-w) and it’s
making the rounds on social media. An impressive roundup of highly
influential work, based on [the Web of
Science](https://www.webofscience.com/wos/) citation data. Its actually
a follow up to a previous version of [the list that they made back in
2014](https://www.nature.com/news/the-top-100-papers-1.16224), when they
created a beautiful infographic to accompany it, offering readers an
immediate, visual sense of the trends behind the numbers.

Looking at the list, there’s some real bangers on here if you’ve
published basically anything in biology. Even if you haven’t cited some
of these you’re probably familiar with the works.

<figure style="background-color: #ffffff; padding: 1rem; border-radius: 6px;">
<img src="https://media.nature.com/lw767/magazine-assets/d41586-025-01124-w/d41586-025-01124-w_50860318.jpg?as=webp" alt="Top 10 most cited papers of all time according to the Web of Science database." width="700">
</figure>
<p style="font-size: 0.8rem; text-align: center;">
<em><strong>Fig. 1:</strong> Nature’s new Top 10 cited papers of all
time (2025) according to the Web of Science database.</em>
</p>

## Most cited papers of the 21st century

They also published a list of the most cited papers of this century so
far. The previous list was dominated by biology technique papers and
they’re still there. Those papers are joined by machine learning and
psychology. This time around though, we only got a table. So let’s fix
that. I’ve followed some of the stylistic choices of their other plot
above, with some minor tweaks for my own eye. Overall, the trend seems
to match expectations in the figure but I think this highlights how much
variability there is between the datasets. Especially where the machine
learning and AI focused papers seem to have higher variability in the
range of documented citations.

<figure style="background-color: #ffffff; padding: 1rem; border-radius: 6px;">
<img src="/assets/2025-04-16-addedContext_topCited_files/horizontalBars.png" alt="Citation ranges for top 25 most cited papers of the 21st century." width="700">
</figure>
<p style="font-size: 0.8rem; text-align: center;">
<em><strong>Fig. 2:</strong> Citation ranges for top 25 most cited
papers of the 21st century.</em>
</p>

We can also use their data to see what the differences are between the
five different databases they used for this analysis. The dashed
diagonal line is where the papers rank in each database would match
their median rank across all five databases. Ironically if you look at
the raw number of citations, Google scholar consistently records the
highest number of citations across the board, especially for machine
learning and AI papers. However, when looking at these papers that seems
to translate in lower rankings for each paper as the majority of yellow
triangles are below the dashed line. Scopus rankings are the opposite,
mostly above the dashed line. I don’t know exactly what to read into
that? Maybe, the shear number of Google scholar citations are less
biased. Maybe the Scopus database, as arguably the most academic
focused, is more siloed or focused on methods papers than the others. Or
maybe Scopus is just picking up higher quality papers better than the
other four databases.

<div class="plotly html-widget html-fill-item" id="htmlwidget-1201102bbd6da953f879" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-1201102bbd6da953f879">{"x":{"data":[{"x":[0.5,0.5,1.5,1.5,0.5,null,2.5,2.5,3.5,3.5,2.5,null,4.5,4.5,5.5,5.5,4.5,null,6.5,6.5,7.5,7.5,6.5,null,8.5,8.5,9.5,9.5,8.5,null,10.5,10.5,11.5,11.5,10.5,null,12.5,12.5,13.5,13.5,12.5,null,14.5,14.5,15.5,15.5,14.5,null,16.5,16.5,17.5,17.5,16.5,null,18.5,18.5,19.5,19.5,18.5,null,20.5,20.5,21.5,21.5,20.5,null,22.5,22.5,23.5,23.5,22.5,null,24.5,24.5,25.5,25.5,24.5],"y":[null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null],"text":"","type":"scatter","mode":"lines","line":{"width":1.8897637795275593,"color":"transparent","dash":"solid"},"fill":"toself","fillcolor":"rgba(250,250,250,1)","hoveron":"fills","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","name":"NA","legendgroup":null,"frame":null},{"x":[0.40000000000000002,25.600000000000001],"y":[-0.40000000000000002,-25.600000000000001],"text":"","type":"scatter","mode":"lines","line":{"width":0.75590551181102372,"color":"rgba(0,0,0,1)","dash":"dash"},"hoveron":"points","showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","name":"NA","legendgroup":null,"frame":null},{"x":[1.114802571386099,1.9502300321124495,3.0598795779049395,3.9102160691283645,5.1608957468532024,5.8344738888554275,7.1974381758831445,8.1066865610890098,8.8360478409565992,10.177048517577351,10.811991199757903,11.887331207748502,13.040611689444631,14.00699777128175,14.985303298197687,15.847579743154347,16.954237596970053,18.101561149116606,19.145488444063812,19.954733976908027,20.937007645331324,21.958022393379359,22.848206772655249,23.943425671011209,24.876342317275704],"y":[-1.0345581589266657,-1.775138466246426,-3.1370260016992688,-3.7412696497514846,-7.0387804232537743,-5.3167495701462029,null,-23.954317964427172,-6.1800437096506355,-8.9190799199044708,-13.656600878946483,-8.1782264085486531,-13.326694799773396,-11.326932499930262,null,-11.96887967120856,-14.712810809165239,-9.6241701472550627,-15.749178403243423,-18.862532220222057,-20.133581295236944,-16.840126385167242,-20.975945392437279,-27.041869641840456,-22.836700329184531],"text":["Overall Rank (median): 1<br>Dimensions dataset rank: 1<br>Deep Residual Learning for Image Recognition (2016)","Overall Rank (median): 2<br>Dimensions dataset rank: 2<br>Analysis of Relative Gene Expression Data Using Real-Time Quantitative PCR and the 2-ddCT Method (2001)","Overall Rank (median): 3<br>Dimensions dataset rank: 3<br>Using thematic analysis in psychology (2006)","Overall Rank (median): 4<br>Dimensions dataset rank: 4<br>Diagnostic and Statistical Manual of Mental Disorders, DSM-5 (2013)","Overall Rank (median): 5<br>Dimensions dataset rank: 7<br>A short history of SHELX (2007)","Overall Rank (median): 6<br>Dimensions dataset rank: 5<br>Random Forests (2001)","Overall Rank (median): 7<br>Dimensions dataset rank: NA<br>Attention is all you need (2017)","Overall Rank (median): 8<br>Dimensions dataset rank: 24<br>ImageNet classification with deep convolutional neural networks (2012)","Overall Rank (median): 9<br>Dimensions dataset rank: 6<br>Global Cancer Statistics 2020: GLOBOCAN Estimates of Incidence and Mortality Worldwide for 36 Cancers in 185 Countries (2021)","Overall Rank (median): 10<br>Dimensions dataset rank: 9<br>Global cancer statistics 2018: GLOBOCAN estimates of incidence and mortality worldwide for 36 cancers in 185 countries (2018)","Overall Rank (median): 11<br>Dimensions dataset rank: 14<br>Preferred Reporting Items for Systematic Reviews and Meta-Analyses: The PRISMA Statement (2009)","Overall Rank (median): 12<br>Dimensions dataset rank: 8<br>U-Net: Convolutional Networks for Biomedical Image Segmentation (2015)","Overall Rank (median): 13<br>Dimensions dataset rank: 13<br>Electric Field Effect in Atomically Thin Carbon Films (2004)","Overall Rank (median): 14<br>Dimensions dataset rank: 11<br>Fitting Linear Mixed-Effects Models Using lme4 (2015)","Overall Rank (median): 15<br>Dimensions dataset rank: NA<br>Scikit-learn: Machine learning in Python (2011)","Overall Rank (median): 16<br>Dimensions dataset rank: 12<br>Deep learning (2015)","Overall Rank (median): 17<br>Dimensions dataset rank: 15<br>Common Method Biases in Behavioral Research: A Critical Review of the Literature and Recommended Remedies (2003)","Overall Rank (median): 18<br>Dimensions dataset rank: 10<br>Moderated estimation of fold change and dispersion for RNA-seq data with DESeq2 (2014)","Overall Rank (median): 19<br>Dimensions dataset rank: 16<br>Hallmarks of Cancer: The Next Generation (2011)","Overall Rank (median): 20<br>Dimensions dataset rank: 19<br>Measuring inconsistency in meta-analyses (2003)","Overall Rank (median): 21<br>Dimensions dataset rank: 20<br>NIH Image to ImageJ: 25 years of image analysis (2012)","Overall Rank (median): 22<br>Dimensions dataset rank: 17<br>Fiji: an open-source platform for biological-image analysis (2012)","Overall Rank (median): 23<br>Dimensions dataset rank: 21<br>The PRISMA 2020 statement: an updated guideline for reporting systematic reviews (2021)","Overall Rank (median): 24<br>Dimensions dataset rank: 27<br>ImageNet: A Large-Scale Hierarchical Image Database (2017)","Overall Rank (median): 25<br>Dimensions dataset rank: 23<br>G*Power 3: A flexible statistical power analysis program for the social, behavioral, and biomedical sciences (2007)"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(68,1,84,1)","opacity":1,"size":9.4488188976377963,"symbol":"circle","line":{"width":0.37795275590551186,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"Dimensions","legendgroup":"Dimensions","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[0.99412080477923159,1.9484051879495383,2.9378085272386669,3.8361226716078818,4.8993899963796137,6.1989110737107698,6.9768830931745471,8.1887659311294563,9.144335065595806,9.8218691746704287,11.114375940151513,11.954179971013218,13.047241224721073,13.821617688052356,14.885263417474926,16.127484352700414,17.033287698216736,17.995176380127667,19.059435138944536,20.173307511210442,21.190544988121836,22.082166754920035,22.928715004399418,23.839178008399905,25.185468029417098],"y":[-1.068343817256391,-1.6231342483311892,-2.6640922598540784,null,-4.7210365297272805,-4.313031159155071,-7.2540094571188094,-6.1291274085640906,-8.0901843663305044,-8.8377295266836882,-17.017534829117359,-11.262602791376413,-13.364456532150507,-14.382350350357592,-10.29554898366332,-12.276501802355051,-14.665021656826138,-16.126618372835217,-17.846968006156384,-21.760016004554927,-23.60327734835446,-28.086557880230249,-25.206377739459278,-19.846299521811307,-25.994006058759986],"text":["Overall Rank (median): 1<br>Scopus dataset rank: 1<br>Deep Residual Learning for Image Recognition (2016)","Overall Rank (median): 2<br>Scopus dataset rank: 2<br>Analysis of Relative Gene Expression Data Using Real-Time Quantitative PCR and the 2-ddCT Method (2001)","Overall Rank (median): 3<br>Scopus dataset rank: 3<br>Using thematic analysis in psychology (2006)","Overall Rank (median): 4<br>Scopus dataset rank: NA<br>Diagnostic and Statistical Manual of Mental Disorders, DSM-5 (2013)","Overall Rank (median): 5<br>Scopus dataset rank: 5<br>A short history of SHELX (2007)","Overall Rank (median): 6<br>Scopus dataset rank: 4<br>Random Forests (2001)","Overall Rank (median): 7<br>Scopus dataset rank: 7<br>Attention is all you need (2017)","Overall Rank (median): 8<br>Scopus dataset rank: 6<br>ImageNet classification with deep convolutional neural networks (2012)","Overall Rank (median): 9<br>Scopus dataset rank: 8<br>Global Cancer Statistics 2020: GLOBOCAN Estimates of Incidence and Mortality Worldwide for 36 Cancers in 185 Countries (2021)","Overall Rank (median): 10<br>Scopus dataset rank: 9<br>Global cancer statistics 2018: GLOBOCAN estimates of incidence and mortality worldwide for 36 cancers in 185 countries (2018)","Overall Rank (median): 11<br>Scopus dataset rank: 17<br>Preferred Reporting Items for Systematic Reviews and Meta-Analyses: The PRISMA Statement (2009)","Overall Rank (median): 12<br>Scopus dataset rank: 11<br>U-Net: Convolutional Networks for Biomedical Image Segmentation (2015)","Overall Rank (median): 13<br>Scopus dataset rank: 13<br>Electric Field Effect in Atomically Thin Carbon Films (2004)","Overall Rank (median): 14<br>Scopus dataset rank: 14<br>Fitting Linear Mixed-Effects Models Using lme4 (2015)","Overall Rank (median): 15<br>Scopus dataset rank: 10<br>Scikit-learn: Machine learning in Python (2011)","Overall Rank (median): 16<br>Scopus dataset rank: 12<br>Deep learning (2015)","Overall Rank (median): 17<br>Scopus dataset rank: 15<br>Common Method Biases in Behavioral Research: A Critical Review of the Literature and Recommended Remedies (2003)","Overall Rank (median): 18<br>Scopus dataset rank: 16<br>Moderated estimation of fold change and dispersion for RNA-seq data with DESeq2 (2014)","Overall Rank (median): 19<br>Scopus dataset rank: 18<br>Hallmarks of Cancer: The Next Generation (2011)","Overall Rank (median): 20<br>Scopus dataset rank: 22<br>Measuring inconsistency in meta-analyses (2003)","Overall Rank (median): 21<br>Scopus dataset rank: 24<br>NIH Image to ImageJ: 25 years of image analysis (2012)","Overall Rank (median): 22<br>Scopus dataset rank: 28<br>Fiji: an open-source platform for biological-image analysis (2012)","Overall Rank (median): 23<br>Scopus dataset rank: 25<br>The PRISMA 2020 statement: an updated guideline for reporting systematic reviews (2021)","Overall Rank (median): 24<br>Scopus dataset rank: 20<br>ImageNet: A Large-Scale Hierarchical Image Database (2017)","Overall Rank (median): 25<br>Scopus dataset rank: 26<br>G*Power 3: A flexible statistical power analysis program for the social, behavioral, and biomedical sciences (2007)"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(59,82,139,1)","opacity":1,"size":9.4488188976377963,"symbol":"square","line":{"width":0.37795275590551186,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"Scopus","legendgroup":"Scopus","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[0.83564150426536798,1.8489586181007325,3.1310063952580096,3.9053443443030118,4.8539400804787878,5.8958322345279157,6.9376513577066365,7.9465279560536146,9.146017586812377,10.028380479384214,11.065319750923663,11.972061679791659,12.829830602090805,13.98744878359139,14.829844426363707,16.07702573025599,16.93421664983034,17.950930444523692,18.880971109122036,20.078733543865383,20.951993074454368,21.826763364858927,23.043382809031755,24.112864902429283,25.032277071475981],"y":[-2.155792335420847,-2.9169236483052372,-3.6568341840058567,-5.9450020670890806,-7.8882845113053914,-7.0708475815132257,-24.717428124696017,-16.032256264425815,-9.7690442649647586,-11.636156096681953,-10.710699443332851,-15.130906429700554,-20.330118793621658,-16.845667913928629,-20.737981614656746,-18.270644694380461,-19.361557181738316,-13.280061637423932,-22.310582249052821,-30.128212339058518,-29.00565717741847,-24.069075041264295,-40.622186973877248,-30.929443836025893,-36.383559058979152],"text":["Overall Rank (median): 1<br>OpenAlex dataset rank: 2<br>Deep Residual Learning for Image Recognition (2016)","Overall Rank (median): 2<br>OpenAlex dataset rank: 3<br>Analysis of Relative Gene Expression Data Using Real-Time Quantitative PCR and the 2-ddCT Method (2001)","Overall Rank (median): 3<br>OpenAlex dataset rank: 4<br>Using thematic analysis in psychology (2006)","Overall Rank (median): 4<br>OpenAlex dataset rank: 6<br>Diagnostic and Statistical Manual of Mental Disorders, DSM-5 (2013)","Overall Rank (median): 5<br>OpenAlex dataset rank: 8<br>A short history of SHELX (2007)","Overall Rank (median): 6<br>OpenAlex dataset rank: 7<br>Random Forests (2001)","Overall Rank (median): 7<br>OpenAlex dataset rank: 25<br>Attention is all you need (2017)","Overall Rank (median): 8<br>OpenAlex dataset rank: 16<br>ImageNet classification with deep convolutional neural networks (2012)","Overall Rank (median): 9<br>OpenAlex dataset rank: 10<br>Global Cancer Statistics 2020: GLOBOCAN Estimates of Incidence and Mortality Worldwide for 36 Cancers in 185 Countries (2021)","Overall Rank (median): 10<br>OpenAlex dataset rank: 12<br>Global cancer statistics 2018: GLOBOCAN estimates of incidence and mortality worldwide for 36 cancers in 185 countries (2018)","Overall Rank (median): 11<br>OpenAlex dataset rank: 11<br>Preferred Reporting Items for Systematic Reviews and Meta-Analyses: The PRISMA Statement (2009)","Overall Rank (median): 12<br>OpenAlex dataset rank: 15<br>U-Net: Convolutional Networks for Biomedical Image Segmentation (2015)","Overall Rank (median): 13<br>OpenAlex dataset rank: 20<br>Electric Field Effect in Atomically Thin Carbon Films (2004)","Overall Rank (median): 14<br>OpenAlex dataset rank: 17<br>Fitting Linear Mixed-Effects Models Using lme4 (2015)","Overall Rank (median): 15<br>OpenAlex dataset rank: 21<br>Scikit-learn: Machine learning in Python (2011)","Overall Rank (median): 16<br>OpenAlex dataset rank: 18<br>Deep learning (2015)","Overall Rank (median): 17<br>OpenAlex dataset rank: 19<br>Common Method Biases in Behavioral Research: A Critical Review of the Literature and Recommended Remedies (2003)","Overall Rank (median): 18<br>OpenAlex dataset rank: 13<br>Moderated estimation of fold change and dispersion for RNA-seq data with DESeq2 (2014)","Overall Rank (median): 19<br>OpenAlex dataset rank: 22<br>Hallmarks of Cancer: The Next Generation (2011)","Overall Rank (median): 20<br>OpenAlex dataset rank: 30<br>Measuring inconsistency in meta-analyses (2003)","Overall Rank (median): 21<br>OpenAlex dataset rank: 29<br>NIH Image to ImageJ: 25 years of image analysis (2012)","Overall Rank (median): 22<br>OpenAlex dataset rank: 24<br>Fiji: an open-source platform for biological-image analysis (2012)","Overall Rank (median): 23<br>OpenAlex dataset rank: 41<br>The PRISMA 2020 statement: an updated guideline for reporting systematic reviews (2021)","Overall Rank (median): 24<br>OpenAlex dataset rank: 31<br>ImageNet: A Large-Scale Hierarchical Image Database (2017)","Overall Rank (median): 25<br>OpenAlex dataset rank: 36<br>G*Power 3: A flexible statistical power analysis program for the social, behavioral, and biomedical sciences (2007)"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(33,144,140,1)","opacity":1,"size":9.4488188976377963,"symbol":"diamond","line":{"width":0.37795275590551186,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"OpenAlex","legendgroup":"OpenAlex","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[0.81555830128490925,1.838107428047806,2.9497311898507177,4.0083416687324647,5.0962385404855013,6.0699483606964346,7.1611997208558025,7.801462711021304,8.8656333617866032,10.102744519151747,11.00432960037142,11.889607197791339,12.898486087657512,13.978579336497933,15.170463513024151,15.859044850524516,16.867215058021248,18.171091917250305,19.061607345566152,20.064539446961135,20.909760813042521,22.131149979773909,22.885053404327483,24.032440015114844,25.064290586486457],"y":[-2.9635785108432176,-1.0193352665752173,-4.0883323619142171,-9.8403913322836161,-7.0798988133668903,-52.714727662131189,-7.6171773811802268,-5.0193309344351293,-6.3011862106621264,null,-1.9926195034757257,-9.3433332532644275,-10.885578540898859,-12.899614978954196,-16.653356051072478,null,-13.897084687650203,-17.646681356988847,-14.825425345078111,-23.749085298739374,-20.371434938721357,-22.138759892433882,-26.7815015360713,-26.186230282858013,-16.377201780304311],"text":["Overall Rank (median): 1<br>WoS dataset rank: 3<br>Deep Residual Learning for Image Recognition (2016)","Overall Rank (median): 2<br>WoS dataset rank: 1<br>Analysis of Relative Gene Expression Data Using Real-Time Quantitative PCR and the 2-ddCT Method (2001)","Overall Rank (median): 3<br>WoS dataset rank: 4<br>Using thematic analysis in psychology (2006)","Overall Rank (median): 4<br>WoS dataset rank: 10<br>Diagnostic and Statistical Manual of Mental Disorders, DSM-5 (2013)","Overall Rank (median): 5<br>WoS dataset rank: 7<br>A short history of SHELX (2007)","Overall Rank (median): 6<br>WoS dataset rank: 53<br>Random Forests (2001)","Overall Rank (median): 7<br>WoS dataset rank: 8<br>Attention is all you need (2017)","Overall Rank (median): 8<br>WoS dataset rank: 5<br>ImageNet classification with deep convolutional neural networks (2012)","Overall Rank (median): 9<br>WoS dataset rank: 6<br>Global Cancer Statistics 2020: GLOBOCAN Estimates of Incidence and Mortality Worldwide for 36 Cancers in 185 Countries (2021)","Overall Rank (median): 10<br>WoS dataset rank: NA<br>Global cancer statistics 2018: GLOBOCAN estimates of incidence and mortality worldwide for 36 cancers in 185 countries (2018)","Overall Rank (median): 11<br>WoS dataset rank: 2<br>Preferred Reporting Items for Systematic Reviews and Meta-Analyses: The PRISMA Statement (2009)","Overall Rank (median): 12<br>WoS dataset rank: 9<br>U-Net: Convolutional Networks for Biomedical Image Segmentation (2015)","Overall Rank (median): 13<br>WoS dataset rank: 11<br>Electric Field Effect in Atomically Thin Carbon Films (2004)","Overall Rank (median): 14<br>WoS dataset rank: 13<br>Fitting Linear Mixed-Effects Models Using lme4 (2015)","Overall Rank (median): 15<br>WoS dataset rank: 17<br>Scikit-learn: Machine learning in Python (2011)","Overall Rank (median): 16<br>WoS dataset rank: NA<br>Deep learning (2015)","Overall Rank (median): 17<br>WoS dataset rank: 14<br>Common Method Biases in Behavioral Research: A Critical Review of the Literature and Recommended Remedies (2003)","Overall Rank (median): 18<br>WoS dataset rank: 18<br>Moderated estimation of fold change and dispersion for RNA-seq data with DESeq2 (2014)","Overall Rank (median): 19<br>WoS dataset rank: 15<br>Hallmarks of Cancer: The Next Generation (2011)","Overall Rank (median): 20<br>WoS dataset rank: 24<br>Measuring inconsistency in meta-analyses (2003)","Overall Rank (median): 21<br>WoS dataset rank: 20<br>NIH Image to ImageJ: 25 years of image analysis (2012)","Overall Rank (median): 22<br>WoS dataset rank: 22<br>Fiji: an open-source platform for biological-image analysis (2012)","Overall Rank (median): 23<br>WoS dataset rank: 27<br>The PRISMA 2020 statement: an updated guideline for reporting systematic reviews (2021)","Overall Rank (median): 24<br>WoS dataset rank: 26<br>ImageNet: A Large-Scale Hierarchical Image Database (2017)","Overall Rank (median): 25<br>WoS dataset rank: 16<br>G*Power 3: A flexible statistical power analysis program for the social, behavioral, and biomedical sciences (2007)"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(93,200,99,1)","opacity":1,"size":9.4488188976377963,"symbol":"triangle-up","line":{"width":0.37795275590551186,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"WoS","legendgroup":"WoS","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null},{"x":[0.92131532663479443,1.898443012405187,2.9735337793827057,3.8030409309081734,5.0930475448258221,6.0221163663081825,7.0754135704599319,8.107101630885154,8.8985018160194151,9.9941754832863801,11.160657296329736,12.162346329074353,13.096217224933207,14.087334049958736,14.912504835333674,16.120011144876479,16.939088325761258,18.127838117722423,18.915780281554909,19.904676327109335,21.097108117118477,22.081215278990566,23.056392678152768,23.860931600816549,24.821264061890542],"y":[-2.0089267496019603,-4.8287976086139679,-2.7272860437631605,-0.77530524227768183,-14.362680562399328,-7.1557414088398215,-6.0988430678844452,-8.160860359296203,-14.848915145546197,-15.706621962413191,-10.022490673325956,-13.10918406676501,-23.849369628913699,-17.710943168029189,-11.719851631112396,-17.184055851772428,-19.165341630578041,-26.727201480045913,-21.390333367697895,-37.667587709426883,-32.357331890612841,-33.144598455354569,-23.204076961614192,-22.309482080303134,-28.372447128593922],"text":["Overall Rank (median): 1<br>Google Scholar dataset rank: 2<br>Deep Residual Learning for Image Recognition (2016)","Overall Rank (median): 2<br>Google Scholar dataset rank: 5<br>Analysis of Relative Gene Expression Data Using Real-Time Quantitative PCR and the 2-ddCT Method (2001)","Overall Rank (median): 3<br>Google Scholar dataset rank: 3<br>Using thematic analysis in psychology (2006)","Overall Rank (median): 4<br>Google Scholar dataset rank: 1<br>Diagnostic and Statistical Manual of Mental Disorders, DSM-5 (2013)","Overall Rank (median): 5<br>Google Scholar dataset rank: 14<br>A short history of SHELX (2007)","Overall Rank (median): 6<br>Google Scholar dataset rank: 7<br>Random Forests (2001)","Overall Rank (median): 7<br>Google Scholar dataset rank: 6<br>Attention is all you need (2017)","Overall Rank (median): 8<br>Google Scholar dataset rank: 8<br>ImageNet classification with deep convolutional neural networks (2012)","Overall Rank (median): 9<br>Google Scholar dataset rank: 15<br>Global Cancer Statistics 2020: GLOBOCAN Estimates of Incidence and Mortality Worldwide for 36 Cancers in 185 Countries (2021)","Overall Rank (median): 10<br>Google Scholar dataset rank: 16<br>Global cancer statistics 2018: GLOBOCAN estimates of incidence and mortality worldwide for 36 cancers in 185 countries (2018)","Overall Rank (median): 11<br>Google Scholar dataset rank: 10<br>Preferred Reporting Items for Systematic Reviews and Meta-Analyses: The PRISMA Statement (2009)","Overall Rank (median): 12<br>Google Scholar dataset rank: 13<br>U-Net: Convolutional Networks for Biomedical Image Segmentation (2015)","Overall Rank (median): 13<br>Google Scholar dataset rank: 24<br>Electric Field Effect in Atomically Thin Carbon Films (2004)","Overall Rank (median): 14<br>Google Scholar dataset rank: 18<br>Fitting Linear Mixed-Effects Models Using lme4 (2015)","Overall Rank (median): 15<br>Google Scholar dataset rank: 12<br>Scikit-learn: Machine learning in Python (2011)","Overall Rank (median): 16<br>Google Scholar dataset rank: 17<br>Deep learning (2015)","Overall Rank (median): 17<br>Google Scholar dataset rank: 19<br>Common Method Biases in Behavioral Research: A Critical Review of the Literature and Recommended Remedies (2003)","Overall Rank (median): 18<br>Google Scholar dataset rank: 27<br>Moderated estimation of fold change and dispersion for RNA-seq data with DESeq2 (2014)","Overall Rank (median): 19<br>Google Scholar dataset rank: 21<br>Hallmarks of Cancer: The Next Generation (2011)","Overall Rank (median): 20<br>Google Scholar dataset rank: 38<br>Measuring inconsistency in meta-analyses (2003)","Overall Rank (median): 21<br>Google Scholar dataset rank: 32<br>NIH Image to ImageJ: 25 years of image analysis (2012)","Overall Rank (median): 22<br>Google Scholar dataset rank: 33<br>Fiji: an open-source platform for biological-image analysis (2012)","Overall Rank (median): 23<br>Google Scholar dataset rank: 23<br>The PRISMA 2020 statement: an updated guideline for reporting systematic reviews (2021)","Overall Rank (median): 24<br>Google Scholar dataset rank: 22<br>ImageNet: A Large-Scale Hierarchical Image Database (2017)","Overall Rank (median): 25<br>Google Scholar dataset rank: 28<br>G*Power 3: A flexible statistical power analysis program for the social, behavioral, and biomedical sciences (2007)"],"type":"scatter","mode":"markers","marker":{"autocolorscale":false,"color":"rgba(253,231,37,1)","opacity":1,"size":9.4488188976377963,"symbol":"triangle-down","line":{"width":0.37795275590551186,"color":"rgba(0,0,0,1)"}},"hoveron":"points","name":"Google Scholar","legendgroup":"Google Scholar","showlegend":true,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":46.286425902864259,"r":7.9701120797011216,"b":41.710253217102533,"l":40.647571606475722},"font":{"color":"rgba(0,0,0,1)","family":"","size":15.940224159402243},"title":{"text":"<b> Ranks of Top 25 papers across all five datasets <\/b>","font":{"color":"rgba(0,0,0,1)","family":"","size":19.128268991282692},"x":0,"xref":"paper"},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[0.40000000000000002,25.600000000000001],"tickmode":"array","ticktext":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25"],"tickvals":[1,2,3,4,5,6,7,7.9999999999999991,9,10,11,12,13,14.000000000000002,15,16,17,18,19,20,21,22,23,24,25],"categoryorder":"array","categoryarray":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25"],"nticks":null,"ticks":"","tickcolor":null,"ticklen":3.9850560398505608,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":10.62681610626816},"tickangle":-0,"showline":true,"linecolor":"rgba(0,0,0,1)","linewidth":0.66417600664176002,"showgrid":false,"gridcolor":null,"gridwidth":0,"zeroline":false,"anchor":"y","title":{"text":"Paper (by median rank)","font":{"color":"rgba(0,0,0,1)","family":"","size":15.940224159402243}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-57.850000000000001,4.8499999999999996],"tickmode":"array","ticktext":["1","5","10","15","20","25","30","35","40","45","50","55"],"tickvals":[-1,-5,-10,-15,-20,-25,-30,-35,-40,-45,-50,-55],"categoryorder":"array","categoryarray":["1","5","10","15","20","25","30","35","40","45","50","55"],"nticks":null,"ticks":"","tickcolor":null,"ticklen":3.9850560398505608,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":12.7521793275218},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":false,"gridcolor":null,"gridwidth":0,"zeroline":false,"anchor":"x","title":{"text":"Rank in individual dataset","font":{"color":"rgba(0,0,0,1)","family":"","size":15.940224159402243}},"hoverformat":".2f"},"shapes":[{"type":"rect","x0":0.5,"x1":1.5,"y0":0,"y1":-60,"xref":"x","yref":"y","fillcolor":"rgba(220,220,220,0.3)","line":{"width":0},"layer":"below"},{"type":"rect","x0":2.5,"x1":3.5,"y0":0,"y1":-60,"xref":"x","yref":"y","fillcolor":"rgba(220,220,220,0.3)","line":{"width":0},"layer":"below"},{"type":"rect","x0":4.5,"x1":5.5,"y0":0,"y1":-60,"xref":"x","yref":"y","fillcolor":"rgba(220,220,220,0.3)","line":{"width":0},"layer":"below"},{"type":"rect","x0":6.5,"x1":7.5,"y0":0,"y1":-60,"xref":"x","yref":"y","fillcolor":"rgba(220,220,220,0.3)","line":{"width":0},"layer":"below"},{"type":"rect","x0":8.5,"x1":9.5,"y0":0,"y1":-60,"xref":"x","yref":"y","fillcolor":"rgba(220,220,220,0.3)","line":{"width":0},"layer":"below"},{"type":"rect","x0":10.5,"x1":11.5,"y0":0,"y1":-60,"xref":"x","yref":"y","fillcolor":"rgba(220,220,220,0.3)","line":{"width":0},"layer":"below"},{"type":"rect","x0":12.5,"x1":13.5,"y0":0,"y1":-60,"xref":"x","yref":"y","fillcolor":"rgba(220,220,220,0.3)","line":{"width":0},"layer":"below"},{"type":"rect","x0":14.5,"x1":15.5,"y0":0,"y1":-60,"xref":"x","yref":"y","fillcolor":"rgba(220,220,220,0.3)","line":{"width":0},"layer":"below"},{"type":"rect","x0":16.5,"x1":17.5,"y0":0,"y1":-60,"xref":"x","yref":"y","fillcolor":"rgba(220,220,220,0.3)","line":{"width":0},"layer":"below"},{"type":"rect","x0":18.5,"x1":19.5,"y0":0,"y1":-60,"xref":"x","yref":"y","fillcolor":"rgba(220,220,220,0.3)","line":{"width":0},"layer":"below"},{"type":"rect","x0":20.5,"x1":21.5,"y0":0,"y1":-60,"xref":"x","yref":"y","fillcolor":"rgba(220,220,220,0.3)","line":{"width":0},"layer":"below"},{"type":"rect","x0":22.5,"x1":23.5,"y0":0,"y1":-60,"xref":"x","yref":"y","fillcolor":"rgba(220,220,220,0.3)","line":{"width":0},"layer":"below"},{"type":"rect","x0":24.5,"x1":25.5,"y0":0,"y1":-60,"xref":"x","yref":"y","fillcolor":"rgba(220,220,220,0.3)","line":{"width":0},"layer":"below"}],"showlegend":true,"legend":{"bgcolor":"rgba(255,255,255,0.8)","bordercolor":"black","borderwidth":1,"font":{"color":"rgba(0,0,0,1)","family":"","size":12.7521793275218},"title":{"text":"","font":{"color":null,"family":null,"size":0}},"x":0.40000000000000002,"y":0.34999999999999998,"xanchor":"left","yanchor":"top"},"hovermode":"closest","barmode":"relative","autosize":true,"aspectratio":{"x":8,"y":11}},"config":{"doubleClick":"reset","modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false},"source":"A","attrs":{"898c67b66054":{"xmin":{},"xmax":{},"ymin":{},"ymax":{},"type":"scatter"},"898c242a7c8":{"intercept":{},"slope":{}},"898c670024d0":{"x":{},"y":{},"fill":{},"shape":{},"text":{}}},"cur_data":"898c67b66054","visdat":{"898c67b66054":["function (y) ","x"],"898c242a7c8":["function (y) ","x"],"898c670024d0":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.20000000000000001,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>
<iframe src="/assets/2025-04-16-addedContext_topCited_files/invertScat.html" width="100%" height="1100" style="background-color: #ffffff; padding: 1rem; border_radius: 8px;">
</iframe>
<p style="font-size: 0.8rem; text-align: center;">
<em><strong>Fig. 3:</strong> Rankings for the top 25 most cited papers
of the 21st century across all five databases.</em>
</p>

Here’s the table showing the data that went into creating figure 2, in
case you were curious.

<p style="font-size: 0.8rem; text-align: center;">
<strong>Table 1:</strong> The highest and lowest recorded number of
citations across all five datasets for each paper.
</p>
<div style="background: #f0f0f0; padding: 1em; border-radius: 8px; max-width: 700px; margin: 2em auto;">
<table class="table table-striped table-hover table-condensed" style="font-size: 13px; color: black; margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:right;">
Rank (median)
</th>
<th style="text-align:left;">
Citation
</th>
<th style="text-align:right;">
Times cited (lowest)
</th>
<th style="text-align:right;">
Times cited (highest)
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
1
</td>
<td style="text-align:left;width: 30em; border-left:1px solid;border-right:1px solid;">
Deep Residual Learning for Image Recognition (2016)
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
103756
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
254074
</td>
</tr>
<tr>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
2
</td>
<td style="text-align:left;width: 30em; border-left:1px solid;border-right:1px solid;">
Analysis of Relative Gene Expression Data Using Real-Time Quantitative
PCR and the 2-ddCT Method (2001)
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
149953
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
185480
</td>
</tr>
<tr>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
3
</td>
<td style="text-align:left;width: 30em; border-left:1px solid;border-right:1px solid;">
Using thematic analysis in psychology (2006)
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
100327
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
230391
</td>
</tr>
<tr>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
4
</td>
<td style="text-align:left;width: 30em; border-left:1px solid;border-right:1px solid;">
Diagnostic and Statistical Manual of Mental Disorders, DSM-5 (2013)
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
98312
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
367800
</td>
</tr>
<tr>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
5
</td>
<td style="text-align:left;width: 30em; border-left:1px solid;border-right:1px solid;">
A short history of SHELX (2007)
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
76523
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
99470
</td>
</tr>
<tr>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
6
</td>
<td style="text-align:left;width: 30em; border-left:1px solid;border-right:1px solid;">
Random Forests (2001)
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
31809
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
146508
</td>
</tr>
<tr>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
7
</td>
<td style="text-align:left;width: 30em; border-left:1px solid;border-right:1px solid;">
Attention is all you need (2017)
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
56201
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
150832
</td>
</tr>
<tr>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
8
</td>
<td style="text-align:left;width: 30em; border-left:1px solid;border-right:1px solid;">
ImageNet classification with deep convolutional neural networks (2012)
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
46860
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
137997
</td>
</tr>
<tr>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
9
</td>
<td style="text-align:left;width: 30em; border-left:1px solid;border-right:1px solid;">
Global Cancer Statistics 2020: GLOBOCAN Estimates of Incidence and
Mortality Worldwide for 36 Cancers in 185 Countries (2021)
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
75634
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
99390
</td>
</tr>
<tr>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
10
</td>
<td style="text-align:left;width: 30em; border-left:1px solid;border-right:1px solid;">
Global cancer statistics 2018: GLOBOCAN estimates of incidence and
mortality worldwide for 36 cancers in 185 countries (2018)
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
66844
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
93433
</td>
</tr>
<tr>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
11
</td>
<td style="text-align:left;width: 30em; border-left:1px solid;border-right:1px solid;">
Preferred Reporting Items for Systematic Reviews and Meta-Analyses: The
PRISMA Statement (2009)
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
53349
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
138534
</td>
</tr>
<tr>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
12
</td>
<td style="text-align:left;width: 30em; border-left:1px solid;border-right:1px solid;">
U-Net: Convolutional Networks for Biomedical Image Segmentation (2015)
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
64905
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
100673
</td>
</tr>
<tr>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
13
</td>
<td style="text-align:left;width: 30em; border-left:1px solid;border-right:1px solid;">
Electric Field Effect in Atomically Thin Carbon Films (2004)
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
59364
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
79165
</td>
</tr>
<tr>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
14
</td>
<td style="text-align:left;width: 30em; border-left:1px solid;border-right:1px solid;">
Fitting Linear Mixed-Effects Models Using lme4 (2015)
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
58535
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
86931
</td>
</tr>
<tr>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
15
</td>
<td style="text-align:left;width: 30em; border-left:1px solid;border-right:1px solid;">
Scikit-learn: Machine learning in Python (2011)
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
54602
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
105225
</td>
</tr>
<tr>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
16
</td>
<td style="text-align:left;width: 30em; border-left:1px solid;border-right:1px solid;">
Deep learning (2015)
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
54602
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
90674
</td>
</tr>
<tr>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
17
</td>
<td style="text-align:left;width: 30em; border-left:1px solid;border-right:1px solid;">
Common Method Biases in Behavioral Research: A Critical Review of the
Literature and Recommended Remedies (2003)
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
56616
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
84589
</td>
</tr>
<tr>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
18
</td>
<td style="text-align:left;width: 30em; border-left:1px solid;border-right:1px solid;">
Moderated estimation of fold change and dispersion for RNA-seq data with
DESeq2 (2014)
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
54480
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
84589
</td>
</tr>
<tr>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
19
</td>
<td style="text-align:left;width: 30em; border-left:1px solid;border-right:1px solid;">
Hallmarks of Cancer: The Next Generation (2011)
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
51841
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
80093
</td>
</tr>
<tr>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
20
</td>
<td style="text-align:left;width: 30em; border-left:1px solid;border-right:1px solid;">
Measuring inconsistency in meta-analyses (2003)
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
43410
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
57246
</td>
</tr>
<tr>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
21
</td>
<td style="text-align:left;width: 30em; border-left:1px solid;border-right:1px solid;">
NIH Image to ImageJ: 25 years of image analysis (2012)
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
47048
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
63516
</td>
</tr>
<tr>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
22
</td>
<td style="text-align:left;width: 30em; border-left:1px solid;border-right:1px solid;">
Fiji: an open-source platform for biological-image analysis (2012)
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
43315
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
61640
</td>
</tr>
<tr>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
23
</td>
<td style="text-align:left;width: 30em; border-left:1px solid;border-right:1px solid;">
The PRISMA 2020 statement: an updated guideline for reporting systematic
reviews (2021)
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
42387
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
79476
</td>
</tr>
<tr>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
24
</td>
<td style="text-align:left;width: 30em; border-left:1px solid;border-right:1px solid;">
ImageNet: A Large-Scale Hierarchical Image Database (2017)
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
42886
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
79921
</td>
</tr>
<tr>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
25
</td>
<td style="text-align:left;width: 30em; border-left:1px solid;border-right:1px solid;">
G\*Power 3: A flexible statistical power analysis program for the
social, behavioral, and biomedical sciences (2007)
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
44803
</td>
<td style="text-align:right;width: 4em; border-left:1px solid;border-right:1px solid;">
73578
</td>
</tr>
</tbody>
</table>
</div>

### Further Reading & References

- Original publication: Pearson, H., Ledford, H., Hutson, M., Van
  Noorden, R. (2025) Exclusive: the most-cited papers of the
  twenty-first century. *Nature* **640**, 588, [doi:
  10.1038/d41586-025-01125-9](https://doi.org/10.1038/d41586-025-01125-9)
- Van Noorden, R. (2025) These are the most-cited research papers of all
  time. *Nature* **640**, 591, [doi:
  10.1038/d41586-025-01124-w](https://doi.org/10.1038/d41586-025-01124-w)
- Van Noorden, R., Maher, B., Nuzzo, R. (2014) The top 100 papers.
  *Nature* **514**, 550, [doi:
  10.1038/514550a](https://www.nature.com/news/the-top-100-papers-1.16224)
- [Web of Science](https://www.webofscience.com/wos/)

### Scripts

You can find my github profile here:
<a href="https://github.com/rpevey">My GitHub profile</a>.

Open data fuels open science.

------------------------------------------------------------------------

### Stay Connected

If you’re a student, researcher, or just a science enthusiast, I’d love
to hear your thoughts. Reach out or follow along via RSS for more deep
dives into brain research, data storytelling, and big data reanalysis.
