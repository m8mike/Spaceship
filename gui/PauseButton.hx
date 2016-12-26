package gui;

import openfl.display.Sprite;
import openfl.display.Stage;
import openfl.geom.Point;
import openfl.events.Event;
import openfl.events.MouseEvent;
import screens.PauseScreen;

class PauseButton extends Sprite {
    public var paused = false;
    public var parentLayer:Sprite;
    public var pauseScreen:PauseScreen;

	public function new (parentLayer:Sprite) {
		this.parentLayer = parentLayer;
		pauseScreen = new PauseScreen(parentLayer, this);
		super();
		draw(0x000000);
		x = Main.superStage.stageWidth / 2;
		y = 10;
		parentLayer.addChild(this);
		addEventListener(MouseEvent.MOUSE_DOWN, togglePause);
	}
	
	public function draw(color:UInt) {
		graphics.clear();
		graphics.beginFill(color);
		graphics.drawRect(-15, 0, 10, 20);
		graphics.drawRect(5, 0, 10, 20);
		graphics.endFill();
	}
	
	public function togglePause(e:Event = null) {
		if (paused) {
			unpause();
		} else {
			pause();
		}
	}
	
	public function pause() {
		if (!paused) {
			paused = true;
			Main.superStage.removeEventListener(Event.ENTER_FRAME, Gameplay.update);
			visible = false;
			pauseScreen.open();
			removeEventListener(MouseEvent.MOUSE_DOWN, togglePause);
		}
	}
	
	public function unpause() {
		if (paused) {
			paused = false;
			Main.superStage.addEventListener(Event.ENTER_FRAME, Gameplay.update);
			visible = true;
			addEventListener(MouseEvent.MOUSE_DOWN, togglePause);
			pauseScreen.close();
		}
	}
	
	public function checkPause(p:Point):Bool {
		if (p.x > Main.superStage.stageWidth / 2 - 70 && p.x < Main.superStage.stageWidth / 2 + 70 && p.y < 80) {
			return true;
		}
		return false;
	}
}