document.addEventListener("DOMContentLoaded", function(){
	const canvasEl = document.getElementById("mycanvas");
	canvasEl.height = 500; 
	canvasEl.width = 500; 

  const ctx = canvasEl.getContext("2d");
  ctx.fillStyle = "blue";
  ctx.fillRect(50, 50, 500, 500);

  ctx.beginPath();
  ctx.arc(140, 170, 50, 0, 2*Math.PI, true);
  ctx.strokeStyle = "yellow";

  ctx.lineWidth = 40;
  ctx.stroke();
  ctx.fillStyle = "orange";
  ctx.fill();

	ctx.fillStyle = "sand"
	ctx.fillRect(50, 460, 500, 40);

	ctx.beginPath();
	ctx.moveTo(100, 35);
	ctx.lineTo(120, 100);
	ctx.lineWidth = 10;
	ctx.stroke();
});
