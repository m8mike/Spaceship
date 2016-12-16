package tasks;

import gui.TextGUI;
import items.*;

class ReachNDistance extends Task {
	private var goal:Int;
	private var currentDist:Int;
	public var completed = false;
	private var inOneRace = false;
	private var distText:TextGUI;
	
	public function new(goalDist:Int, inOneRace = false) {
		this.inOneRace = inOneRace;
		var desc = "Reach " + goalDist + " m";
		super(desc);
		goal = goalDist;
		distText = new TextGUI(Main.guiLayer, Main.superStage.stageWidth - 200, 20);
		currentDist = 0;
	}
	
	override public function update() {
		if (completed) {
			return;
		}
		currentDist++;
		distText.setText(currentDist + "");
		if (currentDist >= goal) {
			trace(description + " completed!");
			completed = true;
		}
	}
	
	override public function onRestart() {
		if (inOneRace) {
			currentDist = 0;
		}
	}
}