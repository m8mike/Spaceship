package items;

class ShieldIII extends Shield {
	private var scaleDelta = 0.01;
	
	public function new (spaceship) {
		super(spaceship);
	}
	
	override public function update() {
		super.update();
		if (scaleX > 1.3) {
			scaleDelta = -0.01;
		} else if (scaleX < 0.7) {
			scaleDelta = 0.01;
		}
		scaleX += this.scaleDelta;
		scaleY = scaleX;
	}
}