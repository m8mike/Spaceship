package items;

import openfl.display.Sprite;
import openfl.display.CapsStyle;
import openfl.display.JointStyle;
import openfl.display.LineScaleMode;

class AsteroidIV extends AsteroidIII {
	private var colorDelta = 1;
	private var colorOffset = 0;
	
	public function new (spaceship) {
		fillColor = 0x33FF00;
		super(spaceship);
	}
	
	override public function changeColor():Void {
		fillColor = 0x33FF00 + colorOffset;
	}
	
	override public function update():Void {
		if (colorOffset > 250) {
			colorDelta = -2;
		} else if (colorOffset < 1) {
			colorDelta = 2;
		}
		colorOffset += colorDelta;
		changeColor();
		graphics.clear();
		graphics.lineStyle(10, strokeColor, 1, LineScaleMode.NORMAL, CapsStyle.ROUND, JointStyle.ROUND, 10);
		graphics.beginFill(fillColor, 200/255);
		graphics.moveTo(size, 0);
		for (i in 0...7) {
			graphics.lineTo(size * Math.cos(i * 60 / 180 * Math.PI), 
							size * Math.sin(i * 60 / 180 * Math.PI));
		}
		graphics.endFill();
		super.update();
	}
}