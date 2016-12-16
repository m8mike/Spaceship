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
		if (completed) {
			return;
		}
		if (Gameplay.level.spaceship == null) {
			return;
		}
		speedText.setText(Gameplay.level.spaceship.speed.x + "");
		if (Gameplay.level.spaceship.speed.x >= goal) {
			trace(description + " completed!");
			completed = true;
		}
	}
}