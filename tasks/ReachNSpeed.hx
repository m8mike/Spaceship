package tasks;

import gui.TextGUI;
import items.*;

class ReachNSpeed extends Task {
	private var goal:Int;
	public var completed = false;
	private var speedText:TextGUI;
	
	public function new(goalSpeed:Int) {
		var desc = "Reach speed " + goalSpeed;
		super(desc);
		goal = goalSpeed;
		speedText = new TextGUI(Main.guiLayer, Main.superStage.stageWidth - 200, 20);
	}
	
	override public function update() {
		if (Gameplay.level.spaceship == null) {
			return;
		}
		var speed = Math.floor(Gameplay.level.spaceship.speed.x * 100) / 100;
		speedText.setText(speed + "");
		if (completed) {
			return;
		}
		progressText.setText(speed + "/" + goal);
		if (Gameplay.level.spaceship.speed.x >= goal) {
			trace(description + " completed!");
			progressText.setText("completed!");
			completed = true;
		}
	}
}