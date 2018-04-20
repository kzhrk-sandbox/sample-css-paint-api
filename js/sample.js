class PaintCircle {
  static get inputProperties() { return ['--circle-color']; }

  paint(ctx, geom, properties) {
    ctx.beginPath();
    ctx.arc(70, 70, 60, 0, 360 * Math.PI / 180, true);
    ctx.fillStyle = properties.get('--circle-color').toString();
    ctx.fill();
  }
}

registerPaint('circle', PaintCircle);