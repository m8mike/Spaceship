package items;

import openfl.display.Sprite;
import openfl.display.CapsStyle;
import openfl.display.JointStyle;
import openfl.display.LineScaleMode;

class AsteroidII extends Asteroid {
	private var rotationSpeed = 0.0;
	private var red = new Sprite();
	private var cyan = new Sprite();
	private var white = new Sprite();
	private var timeDelay = 5;
	
	public function new (spaceship, xSpeed) {
		super(spaceship, xSpeed);
		rotationSpeed = random( -6, 6);
	}
	
	override public function draw():Void {
		rotation += rotationSpeed;
		size = random(30, 60);
		rotation = random(0, 10);
		red.graphics.lineStyle(10, 0xFF0000, 1, LineScaleMode.NORMAL, CapsStyle.ROUND, JointStyle.ROUND, 10);
		red.graphics.beginFill(0xff0000, 200/255);
		red.graphics.moveTo(size, 0);
		for (i in 0...7) {
			red.graphics.lineTo(size * Math.cos(i * 60 / 180 * Math.PI), 
								size * Math.sin(i * 60 / 180 * Math.PI));
		}
		red.graphics.endFill();
		cyan.graphics.lineStyle(10, 0x00FFFF, 1, LineScaleMode.NORMAL, CapsStyle.ROUND, JointStyle.ROUND, 10);
		cyan.graphics.beginFill(0xff0000, 200/255);
		cyan.graphics.moveTo(size, 0);
		for (i in 0...7) {
			cyan.graphics.lineTo(size * Math.cos(i * 60 / 180 * Math.PI), 
								 size * Math.sin(i * 60 / 180 * Math.PI));
		}
		cyan.graphics.endFill();
		white.graphics.lineStyle(10, 0xFFFFFF, 1, LineScaleMode.NORMAL, CapsStyle.ROUND, JointStyle.ROUND, 10);
		white.graphics.beginFill(0xff0000, 200/255);
		white.graphics.moveTo(size, 0);
		for (i in 0...7) {
			white.graphics.lineTo(size * Math.cos(i * 60 / 180 * Math.PI), 
								  size * Math.sin(i * 60 / 180 * Math.PI));
		}
		white.graphics.endFill();
		addChild(red);
		addChild(cyan);
		addChild(white);
	}
	
	override public function update():Void {
		super.update();
		red.x = white.x + timeDelay / 120 / Math.cos(timeDelay / 180 * Math.PI);
		red.y = white.x + timeDelay / 120 / Math.sin(timeDelay / 180 * Math.PI);
		cyan.x = white.x - timeDelay / 120 / Math.cos(timeDelay / 180 * Math.PI);
		cyan.y = white.x - timeDelay / 120 / Math.sin(timeDelay / 180 * Math.PI);
		timeDelay++;
		timeDelay %= 360;
	}
}