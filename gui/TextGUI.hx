package gui;

import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.Assets;

class TextGUI {
	private var itemText:TextField;
	private var defaultTF:TextFormat;
	private var size:Int;
	
	public function new(parent:Sprite, x:Float, y:Float, size:Int = 30) {
		this.size = size;
		defaultTF = new TextFormat(Assets.getFont("assets/SLUGFESTNF.TTF").fontName, size, 0x000000);
		itemText = new TextField();
		itemText.text = "";
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
	
	public function setPosition(x:Float, y:Float, w:Float, h:Float) {
		itemText.x = x;
		itemText.y = y;
		itemText.width = w;
		itemText.height = h;
	}
	
	public function setTextColor(color:UInt) {
		defaultTF = new TextFormat(Assets.getFont("assets/SLUGFESTNF.TTF").fontName, size, color);
		itemText.setTextFormat(defaultTF);
		itemText.defaultTextFormat = defaultTF;
	}
	
	public function setText(text:String) {
		itemText.text = text;
	}
	
	public function remove() {
		itemText.parent.removeChild(itemText);
	}
}