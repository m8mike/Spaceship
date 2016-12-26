package screens;

import gui.PauseButton;
import gui.TextGUI;
import openfl.display.Sprite;
import tasks.Task;

class PauseScreen extends Screen {
	private var taskTextList:Array<TextGUI> = [];
	
	public function new(parentLayer:Sprite, pauseButton:PauseButton) {
		super(parentLayer);
		close();
		addButton("Resume", pauseButton.unpause.bind());
		addButton("Quit", quit.bind(), Main.mainScreen);
		buttons[0].setPosition(0, Main.superStage.stageHeight - 180);
		buttons[1].setPosition(0, Main.superStage.stageHeight - 120);
		addDescriptions();
	}
	
	private function addDescriptions() {
		//var descriptions:Array<String> = Gameplay.taskManager.getDescriptions();
		var offset = 60;
		for (i in 0...3) {
			var text = new TextGUI(this, 0, 0, 30);
			var task = Gameplay.taskManager.getTask(i);
			text.setText(task.description);
			text.setPosition(100, offset + i * 80, Main.superStage.stageWidth, 40);
			var progressText = new TextGUI(this, 0, 0, 25);
			progressText.setPosition(150, offset + i * 80 + 35, Main.superStage.stageWidth - 300, 30);
			task.setProgressText(progressText);
			taskTextList.push(text);
			taskTextList.push(progressText);
		}
	}
	
	private function resume() {
		
	}
	
	public function setTextColor(color:UInt) {
		for (button in buttons) {
			button.setColor(color);
		}
		for (text in taskTextList) {
			text.setTextColor(color);
		}
	}
	
	private function quit() {
		Gameplay.level.remove();
		//textGUI.visible = false
	}
}