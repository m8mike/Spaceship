package tasks;

import items.*;

class HitNItems extends Task {
	private var progress:Int = 0;
	private var goal:Int;
	private var inOneRace = false;
	private var itemStr = "";
	public var typeOfItems:Class<Asteroid>;
	public var completed = false;
	
	public function new(numItems:Int, typeOfItems:Class<Asteroid>, inOneRace = false) {
		this.inOneRace = inOneRace;
		this.typeOfItems = typeOfItems;
		switch (typeOfItems) {
			case Shield:
				itemStr = "Shields";
			case Fuel:
				itemStr = "Fuel boosts";
			case SpeedUp:
				itemStr = "Speed boosts";
			case JumpBoost:
				itemStr = "Jump boosts";
			case FallBoost:
				itemStr = "Fall boosts";
		}
		var desc = "Hit " + numItems + " " + itemStr;
		if (inOneRace) {
			desc += " in one race";
		}
		super(desc);
		goal = numItems;
	}
	
	public function hit() {
		if (completed) {
			return;
		}
		trace(++progress + "/" + goal + " " + itemStr);
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