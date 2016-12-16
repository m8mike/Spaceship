package spaceships;

import openfl.display.CapsStyle;
import openfl.display.JointStyle;
import openfl.display.LineScaleMode;
import openfl.display.Sprite;
import openfl.geom.Point;


class SpaceshipV extends Spaceship {
	private var direction = 5;
	private var toggled = false;
	
	public function new (x, y) {
		super(x, y);
		redraw();
	}
	
	override public function update() {
		rotation = Math.atan2(speed.y, 10) * 180 / Math.PI;
		if (pressed) {
			if (!toggled && fuel > 0) {
				toggled = true;
				direction = -direction;
				redraw();
			}
			if (fuel > 0) {
				fuel -= 0.6;
				addSmoke();
				if (speed.y * direction < 0) {
					speed.y += gravity * direction;
				}
			}
		} else {
			toggled = false;
			speed.y += gravity * direction;
		}
		updateSmoke();
		y += speed.y;
		if (y > parent.stage.stageHeight) {
			direction = -5;
			speed.y = -3;
		} else if (y < 0) {
			direction = 5;
			speed.y = 3;
		}
		decreaseSpeed();
		if (speed.y > 10) {
			speed.y = 10;
		} else if (speed.y < -10) {
			speed.y = -10;
		}
	}
	
	private function redraw() {
		var stroke = 0x000000;
		graphics.clear();
		if (direction > 0) {
			graphics.beginFill(0xCC00FF);
			stroke = 0xffff00;
		} else {
			graphics.beginFill(0xFFFF00);
		}
		graphics.lineStyle(10, stroke, 1, LineScaleMode.NORMAL, CapsStyle.ROUND, JointStyle.ROUND, 10);
		graphics.moveTo(0, 0);
		graphics.lineTo(-50, -20);
		graphics.lineTo(-50, 20);
		graphics.lineTo(0, 0);
		graphics.endFill();
	}
}