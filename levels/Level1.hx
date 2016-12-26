package levels;

import openfl.display.Sprite;
import openfl.display.Stage;
import openfl.events.Event;
import items.*;
import spaceships.*;
import levels.*;

class Level1 extends Sprite {
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
			ast = new Asteroid(spaceship);
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