package screens;

import gui.PauseButton;
import openfl.display.Sprite;

class PauseScreen extends Screen {
	
	public function new(parentLayer:Sprite, pauseButton:PauseButton) {
		super(parentLayer);
		close();
		addButton("Resume", pauseButton.unpause.bind());
		addButton("Quit", quit.bind(), Main.mainScreen);
	}
	
	private function resume() {
		
	}
	
	public function setWhite() {
		for (button in buttons) {
			button.setWhite();
		}
	}
	
	public function setBlack() {
		for (button in buttons) {
			button.setBlack();
		}
	}
	
	private function quit() {
		Gameplay.level.remove();
	}
}