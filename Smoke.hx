package;

import haxe.ds.Vector;
import openfl.display.CapsStyle;
import openfl.display.JointStyle;
import openfl.display.LineScaleMode;
import openfl.display.Sprite;


class Smoke extends Sprite {
	public var angle = 0.0;
	
	public function new (x, y, angle, color) {
		super();
		this.x = x;
		this.y = y;
		this.angle = angle;
		graphics.beginFill(color);
		var size = Math.random() * 20 + 20;
		graphics.drawEllipse(-size/2, -size/2-50*Math.sin(angle * Math.PI / 180), size, size);
		graphics.endFill();
	}
	
	public function update() {
		if (x < -10) {
			if (parent != null) {
				parent.removeChild(this);
			}
		}
		x -= 5 * Math.cos(angle * Math.PI / 180);
		y -= 5 * Math.sin(angle * Math.PI / 180);
	}
}