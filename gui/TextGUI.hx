package gui;

import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.Assets;

class TextGUI {
	public var itemText:TextField;
	private var defaultTF = new TextFormat(Assets.getFont("assets/SLUGFESTNF.TTF").fontName, 30, 0x000000);
	
	public function new(parent:Sprite, x:Float, y:Float) {
		itemText = new TextField();
		itemText.text = "123";
		itemText.x = x;
		itemText.y = y;
		itemText.visible = true;
		itemText.selectable = false;
		itemText.setTextFormat(defaultTF);
		itemText.defaultTextFormat = defaultTF;
		itemText.width = 400;
		itemText.height = 50;
		itemText.multiline = true;
		itemText.wordWrap = true;
		parent.addChild(itemText);
	}
	
	public function setText(text:String) {
		itemText.text = text;
	}
	
	public function remove() {
		itemText.parent.removeChild(itemText);
	}
}