package tasks;
import items.*;

class TaskManager {
	private static var tasks:Array<Task> = [];

	public function new() {
		//tasks.push(new HitNItems(10, Shield));
		//tasks.push(new HitNItems(100, SpeedUp));
		tasks.push(new HitNItems(20, Fuel, true));
		tasks.push(new DestroyNShields(20, true));
		tasks.push(new ReachNDistance(10000, false));
		//tasks.push(new ReachNSpeed(10));
	}
	
	public static function hit(item:Asteroid) {
		for (task in tasks) {
			if (Type.getClass(task) == HitNItems) {
				if (Std.is(item, cast(task, HitNItems).typeOfItems )) {
					cast(task, HitNItems).hit();
				}
			}
		}
	}
	
	public function getTask(i:Int):Task {
		return tasks[i];
	}
	
	/*public function getDescriptions():Array<String> {
		var descriptions:Array<String> = [];
		for (task in tasks) {
			descriptions.push(task.description);
		}
		return descriptions;
	}*/
	
	public function update() {
		for (task in tasks) {
			task.update();
		}
	}
	
	public static function breakShield() {
		for (task in tasks) {
			if (Type.getClass(task) == DestroyNShields) {
				cast(task, DestroyNShields).hit();
			}
		}
	}
	
	public static function restart() {
		for (task in tasks) {
			task.onRestart();
		}
	}
}