package levels;

import openfl.display.Sprite;
import openfl.display.Stage;
import items.*;
import spaceships.*;
import levels.*;

class Level3 extends Level1 {
	
	public function new (parentLayer:Sprite) {
		super(parentLayer);
	}
	
	override public function addSpaceship() {
		spaceship = new SpaceshipIII(100, 200);
	}
	
	override public function addBackground():Void {
		graphics.beginFill(0xFF8C00);
		graphics.drawRect(0, 0, Main.superStage.stageWidth, Main.superStage.stageHeight);
		graphics.endFill();
	}
	
	override public function addRandomItem():Asteroid {
		var ast:Asteroid = null;
		var ran = random(0, 10);
		if (ran > 8) {
			ast = new AsteroidIII(spaceship, speedX);
		} else if (ran > 7) {
			ast = new FuelIII(spaceship, speedX);
		} else if (ran > 6) {
			ast = new ShieldIII(spaceship, speedX);
		} else if (ran > 5.5) {
			ast = new JumpBoostIII(spaceship, speedX);
		} else if (ran > 5) {
			ast = new FallBoost(spaceship, speedX);
		} else {
			ast = new SpeedUp(spaceship, speedX);
		}
		return ast;
	}
}