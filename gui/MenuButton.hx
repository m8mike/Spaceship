package gui;

import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.Assets;
import openfl.events.MouseEvent;

class MenuButton extends Sprite {
	public var itemText:TextField;
	public var onClick:Dynamic;
	private var elements:Array<MenuButton>;
	private var tFormat = new TextFormat(Assets.getFont("assets/SLUGFESTNF.TTF").fontName,
				50, 0x000000, null, null, null, null, null, TextFormatAlign.CENTER);

	public function new(text:String, parent:Sprite, elements:Array<MenuButton>, onClick:Dynamic) {
		super();
		this.onClick = onClick;
		this.elements =  elements;
		itemText = new TextField();
		itemText.text = text;
		itemText.x = 0;
		itemText.y = Main.superStage.stageHeight / 2;
		//itemText.y = parent.stageHeight / 2 - (numElements * 60) / 2 + elements.length * 60;
		itemText.visible = true;
		itemText.selectable = false;
		itemText.setTextFormat(tFormat);
		itemText.defaultTextFormat = tFormat;
		itemText.width = Main.superStage.stageWidth;
		itemText.height = 100;
		itemText.multiline = true;
		itemText.wordWrap = true;
		parent.addChild(itemText);
		itemText.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		itemText.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		elements.push(this);
	}
	
	public function setColor(color) {
		tFormat.color = color;
		itemText.setTextFormat(tFormat);
		itemText.defaultTextFormat = tFormat;
	}
	
	public function setPosition(x:Float, y:Float) {
		itemText.x = x;
		itemText.y = y;
	}
	
	public function calculatePosition() {
		var centerY = Main.superStage.stageHeight / 2;
		var index = elements.indexOf(this);
		var halfHeightMenu = (elements.length * 60) / 2;
		itemText.y = centerY - halfHeightMenu + index * 60;
	}
	
	private function onMouseDown(e:MouseEvent) {
		
	}
	
	private function onMouseUp(e:MouseEvent) {
		onClick();
	}
}