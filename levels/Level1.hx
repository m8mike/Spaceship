package levels;

import openfl.display.Sprite;
import openfl.display.Stage;
import openfl.events.Event;
import items.*;
import spaceships.*;
import levels.*;

class Level1 extends Sprite {
    public var speedX = 0.0;
    public var acceleration = 0.01;
    public var parentLayer:Sprite;
    public var spaceship:Spaceship;
	
	public function new (parentLayer:Sprite) {
		this.parentLayer = parentLayer;
		super();
		addBackground();
		addSpaceship();
		addChild(spaceship);
		parentLayer.addChild(this);
	}
	
	public function remove() {
		Gameplay.asteroidManager.clear();
		parentLayer.removeEventListener(Event.ENTER_FRAME, Gameplay.update);
		parentLayer.removeChild(this);
	}
	
	public function addSpaceship() {
		spaceship = new Spaceship(100, 200);
	}
	
	public function addBackground():Void {
		graphics.beginFill(0x00FFA2);
		graphics.drawRect(0, 0, Main.superStage.stageWidth, Main.superStage.stageHeight);
		graphics.endFill();
	}
	
	public function update():Void {
		spaceship.update();
		if (speedX > 5) {
			acceleration = -0.01;
		} else if (speedX < 0.1) {
			acceleration = 0.01;
		}
		speedX += acceleration;
		Gameplay.asteroidManager.update();
	}
	
	public function restart():Void {
		Gameplay.asteroidManager.clear();
		//gui.distance = 0;
	}
	
	public function random(min, max) {
		return Math.random() * (max - min) + min;
	}
	
	public function addRandomItem():Asteroid {
		var ast:Asteroid = null;
		var ran = random(0, 10);
		if (ran > 8) {
			ast = new Asteroid(spaceship, speedX);
		} else if (ran > 7) {
			ast = new Fuel(spaceship, speedX);
		} else if (ran > 6) {
			ast = new Shield(spaceship, speedX);
		} else if (ran > 5.5) {
			ast = new JumpBoost(spaceship, speedX);
		} else if (ran > 5) {
			ast = new FallBoost(spaceship, speedX);
		} else {
			ast = new SpeedUp(spaceship, speedX);
		}
		return ast;
	}
}