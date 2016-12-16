package items;

import haxe.ds.Vector;
import openfl.display.CapsStyle;
import openfl.display.JointStyle;
import openfl.display.LineScaleMode;
import openfl.display.Sprite;
import items.*;

class SpeedUp extends Asteroid {
	
	public function new (spaceship, xSpeed) {
		super(spaceship, xSpeed);
		speed = random(1, 3) + xSpeed;
		draw();
	}
	
	override public function draw():Void {
		size = 30;
		graphics.beginFill(0xFFAA00);
		graphics.lineStyle(10, 0xFFFF00, 1, LineScaleMode.NORMAL, CapsStyle.ROUND, JointStyle.ROUND, 10);
		graphics.moveTo(0, this.size/2);
		graphics.lineTo(this.size, 0);
		graphics.lineTo(0, -this.size/2);
		graphics.lineTo(0, this.size/2);
		graphics.endFill();
	}
	
	override public function hit() {
		spaceship.speed.x += 0.03;
	}
}