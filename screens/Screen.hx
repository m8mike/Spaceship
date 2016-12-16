package screens;

import openfl.display.Sprite;
import openfl.display.Stage;
import gui.MenuButton;

class Screen extends Sprite {
	private var buttons:Array<MenuButton> = [];

	public function new(parentLayer:Sprite) {
		super();
		parentLayer.addChild(this);
	}
	
	public function addButton(text:String, action:Dynamic, nextScreen:Screen = null) {
		if (nextScreen != null) {
			new MenuButton(text, this, buttons, function() { close(); action(); nextScreen.open(); } );
		} else {
			new MenuButton(text, this, buttons, function() { close(); action(); } );
		}
		for (i in buttons) {
			i.calculatePosition();
		}
	}
	
	public function open() {
		visible = true;
	}
	
	public function close() {
		visible = false;
	}
}