package;

import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;
import openfl.display.Stage;
import openfl.geom.Point;
import gui.*;

class Controls {
	
	public function new() {
		Main.superStage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		Main.superStage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		Main.superStage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		Main.superStage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
	}
	
	private function onMouseDown(e:MouseEvent):Void {
		if (Gameplay.pauseButton.checkPause(new Point(e.localX, e.localY))) {
			Gameplay.pauseButton.pause();
			return;
		}
		Gameplay.level.spaceship.pressed = true;
	}
	
	private function onMouseUp(e:MouseEvent):Void {
		Gameplay.level.spaceship.pressed = false;
	}
	
	private function onKeyDown(e:KeyboardEvent):Void {
		if (e.keyCode == 32) {
			Gameplay.level.spaceship.pressed = true;
		}
	}
	
	private function onKeyUp(e:KeyboardEvent):Void {
		if (e.keyCode == 32) {
			Gameplay.level.spaceship.pressed = false;
		}
	}
}