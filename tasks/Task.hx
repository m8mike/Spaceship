package tasks;

import gui.TextGUI;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.Assets;

class Task {
	public var description:String;
	private var itemText:TextField;
	private var progressText:TextGUI;
	
	public function new(desc:String) {
		description = desc;
	}
	
	public function draw(parent:Sprite) {
		var textSize = 30;
		var mytf = new TextFormat(Assets.getFont("assets/SLUGFESTNF.TTF").fontName,
			textSize, 0x000000, null, null, null, null, null, TextFormatAlign.CENTER);
		itemText = new TextField();
		itemText.text = description;
		itemText.x = 0;
		itemText.y = Main.superStage.stageHeight / 2;
		itemText.visible = true;
		itemText.selectable = false;
		itemText.setTextFormat(mytf);
		itemText.defaultTextFormat = mytf;
		itemText.width = Main.superStage.stageWidth;
		itemText.height = 100;
		itemText.multiline = true;
		itemText.wordWrap = true;
		parent.addChild(itemText);
	}
	
	public function setProgressText(text:TextGUI) {
		progressText = text;
	}
	
	public function update() {
		
	}
	
	public function onRestart() {
		
	}
}