package;

import items.*;
import spaceships.*;
import openfl.geom.Point;
import openfl.display.Sprite;

class AsteroidManager {
	public var asteroids = [];
	private var parent:Sprite;

	public function new(parent:Sprite) {
		this.parent = parent;
	}
	
	private function random(min, max) {
		return Math.random() * (max - min) + min;
	}
	
	public function addRandomItem() {
		var ast:Asteroid = Gameplay.level.addRandomItem();
		if (ast != null) {
			asteroids.push(ast);
			parent.addChild(ast);
		}
	}
	
	public function update() {
		if (asteroids.length < 100) {
			if (random(0, 10) > 9.2) {
				addRandomItem();
			}
		}
		for (ast in asteroids) {
			var asteroid:Asteroid = cast(ast, Asteroid);
			var spaceship = Gameplay.level.spaceship;
			asteroid.update();
			var shipCenter = new Point(spaceship.x-40, spaceship.y);
			var astCenter = new Point(asteroid.x, asteroid.y);
			if (Point.distance(shipCenter, astCenter) < asteroid.size + 10 && asteroid.parent != null) {
				asteroid.registerHit();
				asteroid.hit();
			}
		}
	}
	
	public function remove(asteroid:Asteroid) {
		if (asteroids.indexOf(asteroid) != -1) {
			asteroids.splice(asteroids.indexOf(asteroid), 1);
		}
	}
	
	public function clear() {
		while (asteroids.length > 0) {
			asteroids[0].remove();
		}
		asteroids = [];
	}
}