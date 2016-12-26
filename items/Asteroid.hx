package items;

import haxe.ds.Vector;
import openfl.display.CapsStyle;
import openfl.display.JointStyle;
import openfl.display.LineScaleMode;
import openfl.display.Sprite;
import spaceships.*;
import tasks.*;


class Asteroid extends Sprite {
	public var speed = 0.0;
	public var size = 0.0;
	public var spaceship:Spaceship;
	public var fillColor = 0xff0000;
	public var strokeColor = 0xFFFFFF;
	public var hitted = false;
	
	public function random(min, max) {
		return Math.random() * (max - min) + min;
	}
	
	public function new (spaceship) {
		super();
		this.spaceship = spaceship;
		speed = random(0, 4);
		x = random((Main.superStage.stageWidth + 60), 1000);
		y = random(0, Main.superStage.stageHeight);
		draw();
	}
	
	public function remove() {
		if (parent != null) {
			parent.removeChild(this);
		}
		Gameplay.asteroidManager.remove(this);
	}
	
	public function draw():Void {
		size = random(30, 60);
		rotation = random(0, 90);
		graphics.lineStyle(10, strokeColor, 1, LineScaleMode.NORMAL, CapsStyle.ROUND, JointStyle.ROUND, 10);
		graphics.beginFill(fillColor, 200/255);
		graphics.moveTo(size, 0);
		for (i in 0...7) {
			graphics.lineTo(size * Math.cos(i * 60 / 180 * Math.PI), 
							size * Math.sin(i * 60 / 180 * Math.PI));
		}
		graphics.endFill();
	}
	
	public function update() {
		if (x < -10 - size) {
			remove();
		}
		x -= speed + Gameplay.level.spaceship.speed.x;
	}
	
	public function registerHit() {
		if (!hitted) {
			hitted = true;
			TaskManager.hit(this);
		}
	}
	
	public function hit() {
		spaceship.hit();
		remove();
	}
}