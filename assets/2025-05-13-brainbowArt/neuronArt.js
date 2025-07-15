// Placeholder sketch to start porting the neuron generator into p5.js
// This draws a single neuron with randomized shape and color each time you click the button

let neuronColor;

let neuroScale = 1;

let scaleSlider, apicalSlider, tuftSlider, branchSlider;

function setup() {
// Create a wrapper for each slider-label pair
let scaleGroup = createDiv().parent('slider-container').class('slider-group');
let apicalGroup = createDiv().parent('slider-container').class('slider-group'); 
 // Scale slider
  createP("Neuron scale")
	.parent(scaleGroup)
	.style('color', 'white')
	.style('font-family', 'monospace')
	.style('font-size', '14px')
    .style('margin-bottom', '2px');
  scaleSlider = createSlider(0.5, 2.5, 1.0, 0.1);
  //scaleSlider.position(10, 50);
  //scaleSlider.style('width', '200px');
  scaleSlider.parent(scaleGroup)
    .style('width', '100%')
    .style('margin-bottom', '2px')
    .style('display', 'block');

  // Apical dendrite segments
  createP("Apical dendrite length")
	.parent(apicalGroup)
	.style('color', 'white')
	.style('font-family', 'monospace')
	.style('font-size', '14px')
    .style('margin-bottom', '2px');
  apicalSlider = createSlider(20, 250, 100, 10);
  //apicalSlider.position(10, 80);
  //apicalSlider.style('width', '200px');
  apicalSlider.parent(apicalGroup)
    .style('width', '100%')
    .style('margin-bottom', '2px')
    .style('display', 'block');

  // Tuft length
  createP("Tuft length")
	.parent(scaleGroup)
	.style('color', 'white')
	.style('font-family', 'monospace')
	.style('font-size', '14px')
    .style('margin-bottom', '2px');
  tuftSlider = createSlider(5, 60, 15, 1);
  //tuftSlider.position(10, 110);
  //tuftSlider.style('width', '200px');
  tuftSlider.parent(scaleGroup)
    .style('width', '100%')
    .style('margin-bottom', '2px')
    .style('display', 'block');

  // Branching probability
  createP("Branching probability")
	.parent(apicalGroup)
	.style('color', 'white')
	.style('font-family', 'monospace')
	.style('font-size', '14px')
	.style('margin-bottom', '2px');
  branchSlider = createSlider(0, 1.0, 0.7, 0.05);
  //branchSlider.position(10, 140);
  //branchSlider.style('width', '200px');  
  branchSlider.parent(apicalGroup)
    .style('width', '100%')
    .style('margin-bottom', '2px')
    .style('display', 'block');

  // Create the button
  let button = createButton('Generate New Neuron');
  button.mousePressed(() => {
    background(0);
    drawNeuron();
  });
  //button.parent('button-container'); // attach to visible div
  button.parent('controls');

  let canvas = createCanvas(600, 600); // adjust size as needed
  canvas.parent('neuron-canvas');     // attach to the div
  background(0);
  colorMode(HSB, 1.0); // Use normalized [0,1] values for hue, saturation, brightness
  drawNeuron();

  // createButton('Generate Neuron')
    // .position(10, 10)
    // .mousePressed(() => {
      // clear();
      // background(0);
      // drawNeuron();
    // });
}

function drawSoma(xOffset, yOffset) {
  push();
  fill(neuronColor); // Ensure this is set!
  noStroke();        // Optional: remove outline
  beginShape();
  vertex(xOffset, yOffset - 50 * neuroScale); // top point

  quadraticVertex(
    xOffset - 30 * neuroScale, yOffset - 5.0 * neuroScale,
    xOffset, yOffset // bottom
  );

  quadraticVertex(
    xOffset + 30 * neuroScale, yOffset - 5.0 * neuroScale,
    xOffset, yOffset - 50 * neuroScale // back to top
  );
  endShape(CLOSE);
  pop();
}

//function drawDendrite(x, y, angle, segments, stepSize) {
  //push();
  //translate(x, y);
  //rotate(angle);
  //stroke(neuronColor);
  //strokeWeight(1);
  //noFill(); // just in case

  //for (let i = 1; i < x.length; i++) {
    //line(x[i - 1], y[i - 1], x[i], y[i]);
  //}
  //pop();
//}

function drawDendrite(xStart, yStart, angle, segments, stepSize, lateralNoise = 0.3) {
  let points = [];
  let x = 0;
  let y = 0;

  for (let i = 0; i < segments; i++) {
    let dx = random(-lateralNoise, lateralNoise);
    let dy = stepSize + random(-0.15, 0.15); // negative = up

    x += dx;
    y += dy;

    points.push({ x: x, y: y });
  }

  push();
  translate(xStart, yStart);
  rotate(angle);
  stroke(neuronColor);
  strokeWeight(1);
  noFill();

  for (let i = 1; i < points.length; i++) {
    line(points[i - 1].x, points[i - 1].y, points[i].x, points[i].y);
  }
  pop();

  // Return untransformed coordinates relative to (xStart, yStart)
  return points;
}



function drawNeuron() {
  push(); // Save the current drawing state
  translate(width / 2, height / 1.25);
  neuroScale = scaleSlider.value(); // Update global scale
  //neuronColor = color(random(255), random(255), random(255));
  let hue = random(0,1); // between 0 and 1
  let saturation = 0.9;
  let brightness = 0.7;
  neuronColor = color(hue, saturation, brightness); // will now be in HSB

  stroke(neuronColor);
  noFill();

  // Draw Soma
  fill(neuronColor);
  //ellipse(0, 0, 30, 50);
  //console.log("Drawing soma at ", 0, 0);
  drawSoma(0, 0, 20)

  // Apical Dendrite
  let apicalSegments = apicalSlider.value();
  let apicalPoints = drawDendrite(0, -47 * neuroScale, PI, apicalSegments, 2.0);

  // Terminal tufts
  function generateBranch(x0, y0, angleDeg = 30, segments = 15, stepSize = 1.0, lateralNoise = 0.3) {
    let x = [x0];
    let y = [y0];
    let angleRad = radians(angleDeg);

    for (let i = 0; i < segments; i++) {
      let dx = random(-lateralNoise, lateralNoise) + stepSize * sin(angleRad);
      let dy = stepSize * cos(angleRad);
      x.push(x[i] + dx);
      y.push(y[i] - dy);
    }
    return { x, y };
  }
  
    for (let i = apicalPoints.length - 20; i < apicalPoints.length; i++) {
    if (random() < branchSlider.value()) {
      let origin = apicalPoints[i];
      let angle = random(-60, 60);
      let tuftSegments = tuftSlider.value();

      let branch = generateBranch(0, 0, angle, tuftSegments, 2.0 * neuroScale);

      push();
      translate(-origin.x, -origin.y); // convert relative to canvas
      stroke(neuronColor);
      strokeWeight(0.75);
      noFill();
      beginShape();
      for (let j = 0; j < branch.x.length; j++) {
        vertex(branch.x[j], branch.y[j]);
      }
      endShape();
      pop();
    }
  }



  // Basal Dendrites
  for (let i = 0; i < 10; i++) {
    let angle = radians(random(30, -30));
    drawDendrite(0, -25, angle, 50, 1);
  }

  // Axon
  drawDendrite(0, 0, 2*PI, 60, 2.0);
  pop(); // Restore the original drawing state
}
