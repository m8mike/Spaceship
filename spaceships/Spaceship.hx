package spaceships;

import openfl.display.CapsStyle;
import openfl.display.JointStyle;
import openfl.display.LineScaleMode;
import openfl.display.Sprite;
import openfl.geom.Point;
import tasks.TaskManager;

class Spaceship extends Sprite {
	public var pressed = false;
    public var speed = new Point();
	public var shield = new Sprite();
	private var gravity = 0.1;
	private var thrust = 0.25;
    public var fuel = 500.0;
    private var smoke = [];
    private var smokeDelay = 0;
	
	public function new (x, y) {
		super();
		this.x = x;
		this.y = y;
		graphics.beginFill(0xFF005E);
		graphics.lineStyle(10, 0xFFFFFF, 1, LineScaleMode.NORMAL, CapsStyle.ROUND, JointStyle.ROUND, 10);
		graphics.moveTo(0, 0);
		graphics.lineTo(-50, -20);
		graphics.lineTo(-50, 20);
		graphics.lineTo(0, 0);
		graphics.endFill();
		shield.graphics.beginFill(0xFFFFFF, 100/255);
		shield.graphics.drawEllipse(-70, -40, 80, 80);
		shield.graphics.endFill();
		shield.visible = false;
		addChild(shield);
	}
	
	public function addSmoke() {
		if (smokeDelay <= 0) {
			smokeDelay = 3;
			var grey = Math.floor(fuel / 500 * 255);
			var color = 0x10000 * grey + 0x100 * grey + grey;
			smoke.push(new Smoke(x - 50, y, rotation, color));
			parent.addChildAt(smoke[smoke.length-1], parent.getChildIndex(this));
		}
	}
	
	public function updateSmoke() {
		smokeDelay--;
		for (i in 0...smoke.length) {
			if (smoke[i].parent == null) {
				smoke.splice(i, 1);
				break;
			}
		}
		for (i in smoke) {
			i.update();
		}
	}
	
	public function update() {
		rotation = Math.atan2(speed.y, 10) * 180 / Math.PI;
		if (pressed) {
			if (fuel > 0) {
				fuel--;
				speed.y -= thrust;
				addSmoke();
			} else {
				speed.y += gravity;
			}
		} else {
			speed.y += gravity;
		}
		updateSmoke();
		y += speed.y;
		if (y > parent.stage.stageHeight || y < 0) {
			restart();
		}
		decreaseSpeed();
	}
	
	public function decreaseSpeed() {
		if (speed.x > 0) {
			speed.x -= 0.01;
		} else {
			speed.x = 0;
		}
	}
	
	public function restart() {
		y = 200;
		speed = new Point();
		shield.visible = false;
		fuel = 500;
		Gameplay.restartGame();
		TaskManager.restart();
	};
	
	public function hit() {
		if (shield.visible) {
			shield.visible = false;
			TaskManager.breakShield();
		} else {
			restart();
		}
	}
}