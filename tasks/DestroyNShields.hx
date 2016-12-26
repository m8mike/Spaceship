package tasks;

import items.*;

class DestroyNShields extends Task {
	private var progress:Int = 0;
	private var goal:Int;
	private var inOneRace = false;
	public var completed = false;
	
	public function new(shieldsToDestroy:Int, inOneRace = false) {
		this.inOneRace = inOneRace;
		var desc = "Destroy " + shieldsToDestroy + " shields";
		if (inOneRace) {
			desc += " in one race";
		}
		super(desc);
		goal = shieldsToDestroy;
	}
	
	public function hit() {
		if (completed) {
			return;
		}
		trace(++progress + "/" + goal + " Shields destroyed");
		progressText.setText(progress + "/" + goal);
		if (progress >= goal) {
			progressText.setText("completed!");
			trace(description + " completed!");
			completed = true;
		}
	}
	
	override public function onRestart() {
		if (inOneRace) {
			progress = 0;
		}
	}
}