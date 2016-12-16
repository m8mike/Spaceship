package;

import screens.MainScreen;
import openfl.display.Sprite;
import openfl.display.Stage;
import levels.*;

class Main extends Sprite {
	public static var game:Gameplay;
	public static var superStage:Stage;
	public static var mainScreen:MainScreen;
	public static var gameLayer:Sprite;
	public static var guiLayer:Sprite;
	public static var menuLayer:Sprite;
	
	public function new () {
		super();
		gameLayer = new Sprite();
		guiLayer = new Sprite();
		menuLayer = new Sprite();
		superStage = stage;
		game = new Gameplay(gameLayer);
		mainScreen = new MainScreen(menuLayer);
		addChild(gameLayer);
		addChild(guiLayer);
		addChild(menuLayer);
	}
}