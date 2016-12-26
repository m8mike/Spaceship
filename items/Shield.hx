package items;

import haxe.ds.Vector;
import openfl.display.CapsStyle;
import openfl.display.JointStyle;
import openfl.display.LineScaleMode;
import openfl.display.Sprite;
import items.*;

class Shield extends Asteroid {
	
	public function new (spaceship) {
		super(spaceship);
		speed = random(0, 2);
		draw();
	}
	
	override public function draw():Void {
		size = 30;
		graphics.lineStyle(10, 0xffffff);
		graphics.beginFill(0x00f7ff, 200/255);
		graphics.drawEllipse(0, 0, size, size);
		graphics.endFill();
	}
	
	override public function hit() {
		spaceship.shield.visible = true;
		remove();
	}
}