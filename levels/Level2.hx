package levels;

import openfl.display.Sprite;
import openfl.display.Stage;
import items.*;
import spaceships.*;
import levels.*;

class Level2 extends Level1 {
	
	public function new (parentLayer:Sprite) {
		super(parentLayer);
	}
	
	override public function addSpaceship() {
		spaceship = new SpaceshipII(100, 200);
	}
	
	override public function addBackground():Void {
		graphics.beginFill(0x5900FF);
		graphics.drawRect(0, 0, Main.superStage.stageWidth, Main.superStage.stageHeight);
		graphics.endFill();
	}
	
	override public function addRandomItem():Asteroid {
		var ast:Asteroid = null;
		var ran = random(0, 10);
		if (ran > 8) {
			ast = new AsteroidII(spaceship);
		} else if (ran > 7) {
			ast = new Fuel(spaceship);
		} else if (ran > 6) {
			ast = new Shield(spaceship);
		} else if (ran > 5.5) {
			ast = new JumpBoost(spaceship);
		} else if (ran > 5) {
			ast = new FallBoost(spaceship);
		} else {
			ast = new SpeedUp(spaceship);
		}
		return ast;
	}
}