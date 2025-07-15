---
title: "Let's Make Some Brainbow Art: An artistic experiment in procedural neurons."
author: "Ryan Pevey"
date: "2025-07-09"
last_modified_at: "2025-07-09"
output: 
  md_document:
    variant: gfm  # GitHub-Flavored Markdown (compatible with Jekyll)
    toc: false
    preserve_yaml: true
layout: single  # This tells Jekyll to use its default theme
header:
  overlay_image: /assets/2025-05-13-brainbowArt/brainbowArt_bannerRedbubble.png
  overlay_filter: 0.6 # optional darkening overlay, 0.0 to 1.0
  actions:
    - label: "View Code on GitHub"
      url: "https://github.com/rpevey/YOUR_REPO/blob/main/PATH_TO_NOTEBOOK.ipynb"
always_allow_html: true # Ensures widgets and interactive elements render
categories: [freeRange]
tags: [data viz, data visualization, accessibility, color palettes, color blindness, viridis, r, python, science communication, brainbow, generative art, procedural graphics, python, neuroscience, neuronal model, p5js, matplotlib, cortex, neocortex]
excerpt: "Inspired by the iconic Brainbow technique in neuroscience, this post dives into generative art using simplified neuron models in Python. Explore how a bit of code and a splash of viridis can recreate the vibrant complexity of the brain, no microscope required."
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

<style>
#neuron-widget {
  background-color: #111;
  color: white;
  border: 2px solid #444;
  border-radius: 8px;
  padding: 20px;
  margin: 2rem auto;
  max-width: 700px;
  box-shadow: 0 0 10px rgba(255, 255, 255, 0.1);
}

#controls {
  margin-bottom: 20px;
  font-family: monospace;
}

#controls p {
  margin: 0;
  font-size: 0.9rem;
}

#neuron-canvas canvas {
  display: block;
  margin: 0 auto;
}

#slider-container {
  display: flex;
  flex-wrap: wrap;
  gap: 1rem;
  justify-content: space-between;
}

.slider-group {
  width: 48%; /* or 50% minus padding/margin */
}

</style>


by Ryan Pevey

> **TL;DR**: I used Python to generate synthetic neurons inspired by the Brainbow technique. This post explores how simple modeling and iteration can create visually compelling, anatomically inspired neuronal art. Includes an interactive widget and gallery.

### Let's make some art!!!

I want to make something clear up front. I am not somebody who considers themselves *artistic*, but I do really enjoy making things visually appealing within the context of data and science communication. On top of that, I'm in the mood to make something that just kinda looks cool. So, if you're not familiar with it, *Brainbow* is an iconic and classic fluorescent imaging technique in neuroscience that uses Cre/*lox* recombination to create stochastic expression of three or more fluorescent transgenes in a population of your target cells [Livet, 2007](https://doi.org/10.1038/nature06293). This stochastic integration of multiple fluorescent transgenes means that each adjacent neuron expresses a different permutation of each of the fluorescent tags thereby distinguishing itself from it's neighbors and producing a visually stunning field of view in the resulting micrographs. In short, it’s a valuable scientific tool as well as a visual masterpiece.

<figure id="fig1" style="background-color: #ffffff; padding: 1rem 1rem 0rem 1rem; border-radius: 6px;">
<img src="/assets/2025-05-13-brainbowArt/livet_2007_fig4.jpeg" alt="Multi-panel illustration of Brainbow expression showing how multiple recombination events in tandem transgene copies produce diverse color labeling in neurons, with examples from oculomotor axons and dentate gyrus tissue in transgenic mice." width="1700"/>
<figcaption style="font-size: 0.6rem; color: black; text-align: center; padding-top: 0rem;">
**Fig. 1**: Reprinted Fig. 4 from [Livet, 2007](https://doi.org/10.1038/nature06293). This figure demonstrates how *Brainbow* constructs enable diverse neuronal labeling through independent recombination of multiple tandem transgene copies, resulting in a spectrum of fluorescent expression. Example panels show multicolor labeling in oculomotor axons and dentate gyrus neurons, as well as how recombination can reduce transgene copy number or enforce mutually exclusive expression. Panel c. is what I'm aiming for, except for excitatory neurons in the neocortical plate.
</figcaption>
</figure>

<figure id="fig2" style="background-color: #ffffff; padding: 1rem 1rem 0rem 1rem; border-radius: 6px;">
<img src="/assets/2025-05-13-brainbowArt/Leiwe_2024_Fig1.jpeg" alt="Fluorescent image of layer 2/3 neurons in the mouse somatosensory cortex labeled with seven-color Brainbow based method, Tetbow, showing distinct neuronal labeling." width="1700"/>
<figcaption style="font-size: 0.6rem; color: black; text-align: center; padding-top: 0rem;">
**Fig. 2**: Reprinted Fig. 1d from <a href="https://doi.org/10.1038/s41467-024-49455-y" target="_blank">Leiwe, 2024</a>. This figure shows layer 2/3 neurons in the mouse somatosensory cortex labeled using seven-color Brainbow based method, Tetbow, delivered by in utero electroporation. Fluorescent XFP signals were linearly unmixed and imaged in a 3D z-stack at postnatal day 28, revealing distinct color labeling of individual neurons.
</figcaption>
</figure>

These *Brainbow* images inspired me to try to recreate them visually for some digital art so I got to work trying to figure out a good way to do this. At first, I was going to create this using specialized neuronal modeling software, either by downloading annotated neuron anatomy models, or using research grade simplified models. I've toyed around with [NEURON](https://neuron.yale.edu/neuron/) published by Yale University, [Hines, 1997](https://doi.org/10.1162/neco.1997.9.6.1179) before, so my initial impulse was to use that but that was years ago so I wanted to see what else was out there. I also tried a few other options (non-exhaustively): navis, NeuroM (Blue Brain Project), Treem, and Vedo for procedural generation control. Ultimately, and no offense meant to any of these fine packages, I realized that I was really just interested in making something visually interesting so I just ended up coding it in python with matplotlib. Those were all a fun aside and there's some cool software out there nowadays, but there's also something to be said for hard coding things yourself and building in an efficient pipeline with just the feature set that you need to get the job done. Anyway, let's see how I did!

<figure id="fig3" style="background-color: #ffffff; padding: 1rem 1rem 0rem 1rem; border-radius: 6px;">
<img src="/assets/2025-05-13-brainbowArt/brainbowEdgeToEdge.png" alt="A field of of digital neurons generated procedurally in python, individually colorized in a way that mimics the Brainbow transgenic staining method." width="1700"/>
<figcaption style="font-size: 0.6rem; color: black; text-align: center; padding-top: 0rem;">
**Fig. 3**: A synthetic cortical field of *Brainbow*-inspired neurons, procedurally generated in Python. Each cell is uniquely colored to mimic the striking stochastic expression seen in fluorescent *Brainbow* labeling.
</figcaption>
</figure>

I gotta say, I'm pretty happy with this! True, it's easy to nitpick this from a neuroanatomy standpoint. But for such a lightweight modeling of a generalized excitatory neuron anatomy, it's produced a pretty solid cortical plate! It's totally catching the vibe that I'm looking for. There's a dense Layer 5/6 with large pyramidal neurons, a more diffuse Layer 2/3 with smaller pyramidal neurons, all of the apical dendrites are meeting up in layer 1 and there's even a granule layer with more flattened anatomy. I'm pretty chuffed!

### Let's see how I got to this point.

I started off creating a function for basic neuronal anatomy for one neuron at a time. It creates a teardrop shaped soma, then grows an apical dendrite upwards for 100 step units from there with some random noise side to side and branches off in a series of terminal tufts out of the top 10% of dendrite. After that I generate a series of basal dendrites from the soma and an axon directly from the bottom of the soma. The color is assigned randomly in <u>HSV color space</u>[^1] and then plotted with matplotlib. I tweaked all of the parameters in the function until I got something that I was happy with. When I plot ten of them in the same plane evenly spaced from each other you can see the variability that I can get out of one function. Then I tweaked some of the parameters for better visibility when plotted in a dense field.

<style>
.gallery-grid {
  display: grid;
  grid-template-columns: repeat(2, 2fr);  /* Force 2 columns */
  gap: 1rem;
  margin-top: 2rem;
}

.gallery-grid img {
  width: 100%;
  height: auto; /* Keep aspect ratio */
  max-height: 300px;    /* Optional: cap tall images */
  object-fit: contain; /* Prevent stretching/cropping */
  border-radius: 6px;
  display: block;
}
</style>

<div class="gallery-grid">
  <a href="/assets/2025-05-13-brainbowArt/output_6_0.png"
    title="A single synthetic neuron">
      <img src="/assets/2025-05-13-brainbowArt/output_6_0.png"
           alt="One neuron generated with a simplified anatomical structure.">
  </a>

  <a href="/assets/2025-05-13-brainbowArt/output_7_0.png"
    title="Ten synthetic neurons">
      <img src="/assets/2025-05-13-brainbowArt/output_7_0.png"
           alt="An array of ten neurons, evenly spaced in the field of view, generated with the same code.">
  </a>

  <a href="/assets/2025-05-13-brainbowArt/output_9_0.png"
    title="100 synthetic neurons">
      <img src="/assets/2025-05-13-brainbowArt/output_9_0.png"
           alt="An array of 100 neurons, randomly placed in the field of view.">
  </a>

  <a href="/assets/2025-05-13-brainbowArt/output_20_0.png"
    title="100 synthetic neurons">
      <img src="/assets/2025-05-13-brainbowArt/output_20_0.png"
           alt="An array of 100 neurons, modified for better visibility and randomly placed in the field of view.">
  </a>
</div>

<p style="font-size: 0.6rem; text-align: center;">
**Image 1**: A synthetic neuron procedurally generated in Python. Each iteration is uniquely colored to mimic the striking stochastic expression seen in fluorescent *Brainbow* labeling. **Image 2**: An array of ten neurons, evenly spaced in the field of view, generated with the same code. **Image 3**: An array of 100 neurons placed randomly with a uniform distribution on the horizontal plane in the field of view. **Image 4**: An array of 100 neurons modified for better visibility and placed randomly with a uniform distribution on the horizontal and vertical axes to create a band of soma across the field of view.
</p>

After that I created a parameterized version of the function so that I could create different populations of neurons on the fly and place them within defined bands within the field of view. To get a sense for the parameterized variables in the function take at look that the <u>widget that I created below</u>[^2]. Try out changing the parameters and see what kind of basic morphologies that you can create. Again, it's easy to nitpick the anatomy, but I'm just going for a general <u>gestalt</u>[^3] here, so that when I plot a few hundred of them at once with various tweaked parameters it looks about right, like a Monet. Can you create an L5/6 deep layer neuron, or an L2/3 superficial layer neuron? The L4 granule cell layer neurons are the biggest stretch, I cranked the apical dendrite length all the way down and made the tufts and basal dendrites extra "branchy", but I think it's close enough in the aggregate.


<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.9.0/p5.min.js"></script>
<script src="/assets/2025-05-13-brainbowArt/neuronArt.js"></script>

<div id="neuron-widget">
  <div id="slider-container"></div>
  <div id="controls"></div>
  <div id="neuron-canvas"></div>
</div>

<figure id="fig3" style="background-color: #ffffff; padding: 1rem 1rem 0rem 1rem; border-radius: 6px;">
<img src="/assets/2025-05-13-brainbowArt/brainbowEdgeToEdge.png" alt="A field of of digital neurons generated procedurally in python, individually colorized in a way that mimics the Brainbow transgenic staining method." width="1700"/>
<figcaption style="font-size: 0.6rem; color: black; text-align: center; padding-top: 0rem;">
**Fig. 3 again**: A synthetic cortical field of *Brainbow*-inspired neurons, procedurally generated in Python. Each cell is uniquely colored to mimic the striking stochastic expression seen in fluorescent *Brainbow* labeling.
</figcaption>
</figure>

### How about a viridis version?

If you've read some of my other posts, you might know how big of a fan I am of the viridis color palette. So it's pretty on-brand for me to make a viridis version of these images. Accessibility looks great on it!

<figure id="fig4" style="background-color: #ffffff; padding: 1rem 1rem 0rem 1rem; border-radius: 6px;">
<img src="/assets/2025-05-13-brainbowArt/brainbowEdgeToEdgeViridis.png" alt="A field of of digital neurons generated procedurally in python, individually colorized with the colorblind friendly color palette, viridis." width="1700"/>
<figcaption style="font-size: 0.6rem; color: black; text-align: center; padding-top: 0rem;">
**Fig. 4**: A procedurally generated cortical field of digital neurons, each uniquely colorized using the Viridis palette, a perceptually uniform colorblind-friendly palette. The result is an artificial neural mosaic that's more visually accessible than your average rainbow-washed microscopy.
</figcaption>
</figure>

### Prints, Pixels & Possibly T-Shirts
Every so often, a visualization comes out looking a little too good to keep to myself. If you think so too and want to bring a little scientific art into your life, I've set up a Redbubble store where selected pieces are available. Visit my [Redbubble shop](https://www.redbubble.com/people/evolio/shop). You can also browse the full gallery of curious creations [here](https://www.evolio.org/gallery/).

### What I might add for the future
This was a pretty fun side project and I might do more of this in the future. I might, if I decide to revisit this make some more additions. Some extra things that I could add:
- Color generation using the 4-channel fluorescent staining to more faithfully recreate the brainbow staining pattern.
- More accurate neuronal anatomy by adding more customization of function used to procedurally generate these.
- Go all out by adding in the dozens of types of inhibitory neurons and interneurons!!!

<h3 id="references">
Further Reading & References
</h3>

- Original publication: Livet, J., Weissman, T., Kang, H. et al. Transgenic strategies for combinatorial expression of fluorescent proteins in the nervous system. Nature 450, 56–62 (2007). [10.1038/nature06293](https://doi.org/10.1038/nature06293)
- Leiwe, M.N., Fujimoto, S., Baba, T. et al. Automated neuronal reconstruction with super-multicolour Tetbow labelling and threshold-based clustering of colour hues. Nat Commun 15, 5279 (2024). [10.1038/s41467-024-49455-y](https://doi.org/10.1038/s41467-024-49455-y)
- [The NEURON simulation environment](https://neuron.yale.edu/neuron/)
- Hines ML, Carnevale NT. (1997). The NEURON simulation environment. Neural computation, 9(6), 1179-1209. doi:[https://doi.org/10.1162/neco.1997.9.6.1179](10.1162/neco.1997.9.6.1179)
- My gallery of images on evolio: [evolio Gallery](https://www.evolio.org/gallery/)
- [Color spaces and HSV](https://www.mathworks.com/help/images/understanding-color-spaces-and-color-space-conversion.html)

### Scripts

You can find my github profile here:
<a href="https://github.com/rpevey">My GitHub profile</a>.

Open data fuels open science.

------------------------------------------------------------------------

### Stay Connected

If you’re a student, researcher, or just a science enthusiast, I’d love
to hear your thoughts. If you are a fan of inhibitory neurons or glial cells, what are
your thoughts? Reach out or follow along via RSS for more deep dives
into brain research, data storytelling, and big data reanalysis.

[^1]: HSV (Hue, Saturation, Value) color space is one of several different color spaces that you can use in visualization and imaging. It was ideal for this application because the Hue is denoted by a single number representing an angle around the color wheel between 0 and 1. 0 is red, and as you increas to 1 you progress through the visibile spectrum through orange, yellow, green, blue, violet and magenta, then back around to red at 1. I set saturation at 0.9 and value at 0.6 to more closely match the colors in *Brainbow* staining, then converted hsv to rgb using the colorsys package.

[^2]: The code is recreated in javascript, p5.js to be specific, for computational efficiency for the webpage, but it generates a neuron the same way was the original python code.

[^3]: **Gestalt** is a German word meaning "form," "shape," or "configuration." In psychology and related fields, it refers to a pattern or structure that is perceived as a unified whole, possessing qualities that cannot be understood merely by analyzing its individual components



<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "BlogPosting",
  "headline": "Brainbow Art: Procedurally Generated Neurons in Python",
  "alternativeHeadline": "Generating Digital Brainbow Neurons with Python and Viridis",
  "image": "https://www.evolio.org/assets/2025-05-13-brainbowArt/brainbowEdgeToEdge.png",
  "author": {
    "@type": "Person",
    "name": "Ry Guy"
  },
  "publisher": {
    "@type": "Organization",
    "name": "evolio",
    "logo": {
      "@type": "ImageObject",
      "url": "https://www.evolio.org/assets/images/evolio_logo.png"
    }
  },
  "url": "https://www.evolio.org/showcase/brainbowArt/",
  "datePublished": "2025-05-13",
  "dateModified": "2025-07-14",
  "description": "Inspired by the Brainbow technique, this post explores how to procedurally generate neuron art in Python using color palettes like viridis. Includes an interactive widget, gallery, and Redbubble store link.",
  "keywords": "brainbow, generative art, python, neuroscience, digital neurons, viridis, data visualization",
  "mainEntityOfPage": {
    "@type": "WebPage",
    "@id": "https://www.evolio.org/showcase/brainbowArt/"
  }
}
</script>
