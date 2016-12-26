package;

import gui.*;
import levels.*;
import spaceships.*;
import openfl.display.Sprite;
import openfl.display.Stage;
import openfl.events.Event;
import openfl.geom.Point;
import tasks.TaskManager;

class Gameplay {
	public static var level:Level1;
	public static var pauseButton:PauseButton;
	public static var asteroidManager:AsteroidManager;
	public static var taskManager:TaskManager;
    public var parent:Sprite;
	public var controls:Controls;
	
	public function new(parent:Sprite) {
		this.parent = parent;
		taskManager = new TaskManager();
	}
	
	public function startLevel(levelId:Int) {
		switch (levelId) {
			case 1:
				level = new Level1(parent);
			case 2:
				level = new Level2(parent);
			case 3:
				level = new Level3(parent);
			case 4:
				level = new Level4(parent);
			case 5:
				level = new Level5(parent);
			case 6:
				level = new Level6(parent);
			default:
				trace("there is no game!!! " + levelId);
				return;
		}
		asteroidManager = new AsteroidManager(level);
		controls = new Controls();
		pauseButton = new PauseButton(parent);
		if (levelId == 4) {
			pauseButton.pauseScreen.setTextColor(0xFFFFFF);
		} else {
			pauseButton.pauseScreen.setTextColor(0x000000);
		}
		if (levelId == 6) {
			pauseButton.draw(0x000000);
		} else {
			pauseButton.draw(0xFFFFFF);
		}
		Main.superStage.addEventListener(Event.ENTER_FRAME, update);
	}
	
	public static function update(e:Event) {
		level.update();
		taskManager.update();
	}
	
	public static function restartGame() {
		level.restart();
	}
}