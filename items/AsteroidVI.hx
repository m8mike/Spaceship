package items;

import openfl.display.Sprite;
import openfl.display.CapsStyle;
import openfl.display.JointStyle;
import openfl.display.LineScaleMode;

class AsteroidVI extends AsteroidIII {
	private var colorDelta = 1;
	private var colorOffset = 0;
	
	public function new (spaceship, xSpeed) {
		super(spaceship, xSpeed);
	}
	
	override public function changeColor():Void {
		fillColor = 0x9D00FF;
		strokeColor = 0x00FF00;
	}
}