package items;

import openfl.display.Sprite;
import openfl.display.CapsStyle;
import openfl.display.JointStyle;
import openfl.display.LineScaleMode;

class AsteroidIII extends Asteroid {
	private var rotationSpeed = 0.0;
	private var timeDelay = 5;
	private var scaleDelta = 0.01;
	private var glow = new Sprite();
	private var glowScale = 1.0;
	
	public function new (spaceship, xSpeed) {
		super(spaceship, xSpeed);
		rotationSpeed = random( -6, 6);
	}
	
	public function changeColor():Void {
		fillColor = 0x009BFF;
	}
	
	override public function draw():Void {
		changeColor();
		super.draw();
		drawGlow();
		addChild(glow);
	}
	
	private function drawGlow() {
		glow.graphics.clear();
		glow.graphics.lineStyle(10, strokeColor, 1, LineScaleMode.NORMAL, CapsStyle.ROUND, JointStyle.ROUND, 10);
		glow.graphics.moveTo(size, 0);
		for (i in 0...7) {
			glow.graphics.lineTo(size * glowScale * Math.cos(i * 60 / 180 * Math.PI), 
								 size * glowScale * Math.sin(i * 60 / 180 * Math.PI));
		}
		glow.graphics.endFill();
	}
	
	override public function update():Void {
		rotation += rotationSpeed;
		if (glowScale > 1.3) {
			scaleDelta = -0.01;
		} else if (glowScale < 0.7) {
			scaleDelta = 0.01;
		}
		glowScale += scaleDelta;
		drawGlow();
		super.update();
	}
}