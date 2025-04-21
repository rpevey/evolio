---
title: "Source Material: The most cited papers ever"
author: "Ryan Pevey"
date: "25-04-21"
output: 
  md_document:
    variant: gfm  # GitHub-Flavored Markdown (compatible with Jekyll)
    toc: false
    preserve_yaml: true
layout: single  # This tells Jekyll to use its default theme
always_allow_html: true # Ensures widgets and interactive elements render
categories: [addedContext]
tags: [data viz, reanalysis, science media, scientific publication, research trends]
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
above, with some minor tweaks for my own eye. The blue bar represents
the highest and lowest recorded number of citations within the five
datasets. Overall, the trend seems to match expectations in the figure
but I think this highlights how much variability there is between the
datasets. Especially where the machine learning and AI focused papers
seem to have higher variability in the range of documented citations.

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
other four databases. A honorable mention is also that the Web of
Science dataset seems to dislike the Random forests paper to a hilarious
degree.

<figure style="background-color: #ffffff; padding: 1rem; border-radius: 6px;">
<iframe src="/assets/2025-04-16-addedContext_topCited_files/invertScat.html" width="100%" height="1100" style="border: none; border_radius: 8px;">
</iframe>
</figure>
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
