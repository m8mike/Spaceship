package items;

import haxe.ds.Vector;
import openfl.display.CapsStyle;
import openfl.display.JointStyle;
import openfl.display.LineScaleMode;
import openfl.display.Sprite;


class JumpBoostIII extends JumpBoost {
    public var scaleDelta = 0.01;
	
	public function new (spaceship) {
		super(spaceship);
	}
	
	override public function update() {
		if (scaleX > 1.3) {
			scaleDelta = -0.01;
		} else if (scaleX < 0.7) {
			scaleDelta = 0.01;
		}
		scaleX += scaleDelta;
		scaleY = scaleX;
		super.update();
	}
}