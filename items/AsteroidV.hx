package items;

import openfl.display.Sprite;
import openfl.display.CapsStyle;
import openfl.display.JointStyle;
import openfl.display.LineScaleMode;

class AsteroidV extends AsteroidIV {
	
	public function new (spaceship, xSpeed) {
		super(spaceship, xSpeed);
	}
	
	override public function changeColor():Void {
		if (scaleDelta > 0) {
			strokeColor = 0xFFFFFF;
			fillColor = 0x33FF00 + colorOffset;
		} else {
			strokeColor = 0x000000;
			fillColor = 0x373737;
		}
	}
}