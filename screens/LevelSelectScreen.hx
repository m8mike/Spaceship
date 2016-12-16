package screens;

import openfl.display.Sprite;
import gui.MenuButton;

class LevelSelectScreen extends Screen {

	public function new(parentLayer:Sprite) {
		super(parentLayer);
		addButton("Level1", openLevel.bind(1));
		addButton("Level2", openLevel.bind(2));
		addButton("Level3", openLevel.bind(3));
		addButton("Level4", openLevel.bind(4));
		addButton("Level5", openLevel.bind(5));
		addButton("Level6", openLevel.bind(6));
	}
	
	private function openLevel(id:Int) {
		Main.game.startLevel(id);
	}
}