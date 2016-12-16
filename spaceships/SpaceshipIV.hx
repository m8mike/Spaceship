package spaceships;

import openfl.display.CapsStyle;
import openfl.display.JointStyle;
import openfl.display.LineScaleMode;
import openfl.display.Sprite;
import openfl.geom.Point;


class SpaceshipIV extends Spaceship {
	private var direction = 5;
	private var toggled = false;
	
	public function new (x, y) {
		super(x, y);
	}
	
	override public function update() {
		rotation = Math.atan2(speed.y, 10) * 180 / Math.PI;
		if (pressed) {
			if (!toggled) {
				toggled = true;
				direction = -direction;
				redraw();
			}
			if (fuel > 0) {
				speed.y = 0;
				fuel -= 0.6;
				addSmoke();
			}
		} else {
			toggled = false;
			speed.y += gravity * direction;
		}
		updateSmoke();
		y += speed.y;
		if (y > parent.stage.stageHeight) {
			y = 0;
		} else if (y < 0) {
			y = parent.stage.stageHeight;
		}
		decreaseSpeed();
		if (speed.y > 10) {
			speed.y = 10;
		} else if (speed.y < -10) {
			speed.y = -10;
		}
	}
	
	private function redraw() {
		graphics.clear();
		if (direction > 0) {
			graphics.beginFill(0xFF9900);
		} else {
			graphics.beginFill(0x9200DB);
		}
		graphics.lineStyle(10, 0xFFFFFF, 1, LineScaleMode.NORMAL, CapsStyle.ROUND, JointStyle.ROUND, 10);
		graphics.moveTo(0, 0);
		graphics.lineTo(-50, -20);
		graphics.lineTo(-50, 20);
		graphics.lineTo(0, 0);
		graphics.endFill();
	}
}