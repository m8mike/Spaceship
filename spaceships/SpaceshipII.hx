package spaceships;

import openfl.display.CapsStyle;
import openfl.display.JointStyle;
import openfl.display.LineScaleMode;
import openfl.display.Sprite;
import openfl.geom.Point;


class SpaceshipII extends Spaceship {
	public var jumped = false;
	
	public function new (x, y) {
		super(x, y);
	}
	
	override public function update() {
		rotation = Math.atan2(speed.y, 10) * 180 / Math.PI;
		if (pressed) {
			if (fuel > 0) {
				if (!jumped) {
					speed.y -= thrust*50;
					jumped = true;
				}
				fuel--;
				addSmoke();
			} else {
				speed.y += gravity;
			}
		} else {
			jumped = false;
			speed.y += gravity * 5;
		}
		updateSmoke();
		y += speed.y;
		if (y > parent.stage.stageHeight || y < 0) {
			restart();
		}
		decreaseSpeed();
	}
}