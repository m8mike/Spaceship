package screens;

import openfl.display.Sprite;
import gui.MenuButton;

class MainScreen extends Screen {
	private var levelSelect:LevelSelectScreen;

	public function new(parentLayer:Sprite) {
		super(parentLayer);
		levelSelect = new LevelSelectScreen(parentLayer);
		levelSelect.close();
		addButton("Play", openSelectLevel.bind(), levelSelect);
		addButton("Credits", openCredits.bind(), levelSelect);
	}
	
	public function openSelectLevel() {
		
	}
	
	public function openCredits() {
		
	}
}