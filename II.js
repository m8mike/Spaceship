      strokeJoin(ROUND);
var space = false;
var gravity = 0.1;
var thrust = 0.25;
var spaceship = null;
var asteroids = [];
var xSpeed = 0;
var scaleRatio = 1;
var gui = null;
var timeDelay = 1000;
var restartGame = function() {
    spaceship.y = 200;
    spaceship.ySpeed = 0;
    spaceship.xSpeed = 0;
    spaceship.shielded = false;
    for (var i = 0; i < asteroids.length; i++) {
        asteroids[i].deleted = true;
    }
    asteroids = [];
    gui.fuel = 500;
    gui.distance = 0;
};
var GUI = function() {
    this.fuel = 500;
    this.distance = 0;
    this.best = 0;
};
GUI.prototype.update = function() {
    this.distance1 = Math.ceil(this.distance/10) ;
    this.best = Math.max(this.distance1, this.best);
    //fill(49, 107, 1);
    pushMatrix();
    scale(2);
    pushMatrix();
    translate(-random(0,2), -random(0,1));
    fill(255, 0, 0);
    text("score: " + this.distance1, 10, 10);
    text("best: " + this.best, 230, 10);
    popMatrix();
    pushMatrix();
    translate(random(0,2), random(0,1));
    fill(0, 255, 255);
    text("score: " + this.distance1, 10, 10);
    text("best: " + this.best, 230, 10);
    popMatrix();
    fill(255,255,255);
    text("score: " + this.distance1, 10, 10);
    text("best: " + this.best, 230, 10);
    popMatrix();
};
var Asteroid = function() {
    this.x = random((width+60) / scaleRatio, 1000 / scaleRatio);
    this.y = random(0, 400 / scaleRatio);
    this.speed = random(1, 5) + xSpeed;
    this.size = random(30, 60);
    this.angle = random(0, 180);
    this.rotationSpeed = random(-6, 6);
};
Asteroid.prototype.hit = function() {
    if (spaceship.shielded) {
        spaceship.shielded = false;
        this.deleted = true;
    } else {
        restartGame();
    }
};   
Asteroid.prototype.update = function() {
    if (this.x < -100) {
        this.deleted = true;
    }
    this.x -= this.speed;
    this.draw();
};
Asteroid.prototype.draw = function() {
    this.angle+=this.rotationSpeed;
    pushMatrix();
    translate(this.x, this.y);
    rotate(this.angle);
    fill(255, 0, 0, 200);
    stroke(255, 0, 0);
    pushMatrix();
    translate(random(-10,0)/cos(this.angle), random(-10,0)/sin(this.angle));
    beginShape();
    vertex(this.scaleRatio, 0);
    for (var i = 0; i < 7; i++) {
        vertex(this.size * Math.cos(i * 60 / 180 * Math.PI), 
               this.size * Math.sin(i * 60 / 180 * Math.PI));
    }
    endShape();
    popMatrix();
    stroke(0, 255, 255);
    pushMatrix();
    translate(random(0,10)/cos(this.angle), random(0,10)/sin(this.angle));
    beginShape();
    vertex(this.scaleRatio, 0);
    for (var i = 0; i < 7; i++) {
        vertex(this.size * Math.cos(i * 60 / 180 * Math.PI), 
               this.size * Math.sin(i * 60 / 180 * Math.PI));
    }
    endShape();
    popMatrix();
    stroke(255, 255, 255);
    beginShape();
    vertex(this.scaleRatio, 0);
    for (var i = 0; i < 7; i++) {
        vertex(this.size * Math.cos(i * 60 / 180 * Math.PI), 
               this.size * Math.sin(i * 60 / 180 * Math.PI));
    }
    endShape();
    popMatrix();
};
var SpeedUp = function() {
    this.x = random((width+30) / scaleRatio, 1000 / scaleRatio);
    this.y = random(0, 400 / scaleRatio);
    this.speed = random(1, 3) + xSpeed;
    this.size = 30;
};
SpeedUp.prototype = Object.create(Asteroid.prototype);
SpeedUp.prototype.draw = function() {
    pushMatrix();
    translate(this.x, this.y);
    stroke(255, 255, 0);
    fill(255, 170, 0);
    //ellipse(0, 0, this.size, this.size);
    pushMatrix();
    translate(-timeDelay % 10 - 20, 0);
    triangle(this.size, 0, 0, -this.size/2, 0, this.size/2);
    popMatrix();
    pushMatrix();
    translate(-timeDelay % 10, 0);
    triangle(this.size, 0, 0, -this.size/2, 0, this.size/2);
    popMatrix();
    pushMatrix();
    translate(-timeDelay % 10 + 20, 0);
    triangle(this.size, 0, 0, -this.size/2, 0, this.size/2);
    popMatrix();
    //triangle(this.size, 0, 0, -this.size/2, 0, this.size/2);
    popMatrix();
};
SpeedUp.prototype.hit = function() {
    spaceship.xSpeed += 0.07;
    /*for (var i = 0; i < asteroids.length; i++) {
        asteroids[i].speed += 0.3;
    }*/
};
var Shield = function() {
    this.x = random((width+30) / scaleRatio, 1000 / scaleRatio);
    this.y = random(0, 400 / scaleRatio);
    this.speed = random(1, 3) + xSpeed;
    this.size = 30;
};
Shield.prototype = Object.create(Asteroid.prototype);
Shield.prototype.draw = function() {
    pushMatrix();
    translate(this.x, this.y);
    stroke(255, 255, 255);
    fill(0, 247, 255);
    ellipse(0, 0, this.size, this.size);
    popMatrix();
};
Shield.prototype.hit = function() {
    spaceship.shielded = true;
    this.deleted = true;
};
var JumpBoost = function(x, y) {
    this.x = x?x:random((width+30) / scaleRatio, 1000 / scaleRatio);
    this.y = y?y:random(0, 400 / scaleRatio);
    this.speed = random(1, 3) + xSpeed;
    this.size = 30;
};
JumpBoost.prototype = Object.create(Asteroid.prototype);
JumpBoost.prototype.draw = function() {
    pushMatrix();
    translate(this.x, this.y);   
    stroke(0, 255, 0);
    fill(0, 155, 0);
    //ellipse(0, 0, this.size, this.size);
    pushMatrix();
    translate(0, -timeDelay % 10 - 5);
    triangle(-this.size/2, 0, this.size/2, 0, 0, -this.size);
    popMatrix();
    pushMatrix();
    translate(0, -timeDelay % 10);
    triangle(-this.size/2, 0, this.size/2, 0, 0, -this.size);
    popMatrix();
    pushMatrix();
    translate(0, -timeDelay % 10 + 5);
    triangle(-this.size/2, 0, this.size/2, 0, 0, -this.size);
    popMatrix();
    //triangle(-this.size/2, 0, this.size/2, 0, 0, -this.size);
    popMatrix();
    if (this.x < -10) {
        this.deleted = true;
    }
};
JumpBoost.prototype.hit = function() {
    spaceship.ySpeed = -4;
};
var FallBoost = function() {
    this.x = random((width+30) / scaleRatio, 1000 / scaleRatio);
    this.y = random(0, 400 / scaleRatio);
    this.speed = random(1, 3) + xSpeed;
    this.size = 30;
};
FallBoost.prototype = Object.create(Asteroid.prototype);
FallBoost.prototype.draw = function() {
    pushMatrix();
    translate(this.x, this.y);
    stroke(255, 0, 0);
    fill(201, 0, 0);
    //ellipse(0, 0, this.size, this.size);
    pushMatrix();
    translate(0, -timeDelay % 10 - 5);
    triangle(0, this.size, -this.size/2, 0, this.size/2, 0);
    popMatrix();
    pushMatrix();
    translate(0, -timeDelay % 10);
    triangle(0, this.size, -this.size/2, 0, this.size/2, 0);
    popMatrix();
    pushMatrix();
    translate(0, -timeDelay % 10 + 5);
    triangle(0, this.size, -this.size/2, 0, this.size/2, 0);
    popMatrix();
    //triangle(0, this.size, -this.size/2, 0, this.size/2, 0);
    popMatrix();
    if (this.x < -10) {
        this.deleted = true;
    }
};
FallBoost.prototype.hit = function() {
    spaceship.ySpeed = 3;
};
var Fuel = function() {
    this.x = random((width+30) / scaleRatio, 1000 / scaleRatio);
    this.y = random(0, 400 / scaleRatio);
    this.speed = random(1, 3) + xSpeed;
    this.size = 30;
};
Fuel.prototype = Object.create(Asteroid.prototype);
Fuel.prototype.draw = function() {
    pushMatrix();
    translate(this.x, this.y);
    stroke(41, 0, 117);
    fill(153, 0, 255, 200);
    ellipse(0, 0, this.size, this.size);
    popMatrix();
};
Fuel.prototype.hit = function() {
    gui.fuel += 100;
    if (gui.fuel > 500) {
        gui.fuel = 500;
    }
    this.deleted = true;
};
var Smoke = function(x, y, angle) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    this.size = random(20,40);
};
Smoke.prototype.draw = function() {
    if (this.x < -10) {
        this.deleted = true;
    }
    this.x -= 5 * cos(this.angle);
    this.y -= 5 * sin(this.angle);
    colorMode(HSB);
    noStroke();
    fill(255, 0, gui.fuel/500*255);
    ellipse(this.x, this.y, this.size, this.size);
    colorMode(RGB);
};
var Spaceship = function() {
    this.x = 100;
    this.y = 200;
    this.xSpeed = 0;
    this.ySpeed = 0;
    this.smoke = [];
    this.smokeDelay = 0;
    this.jumped = false;
};
Spaceship.prototype.hit = function() {
    restartGame();
};
Spaceship.prototype.update = function() {
    if (space) {
        if (gui.fuel > 0) {
            if (!this.jumped) {
                this.ySpeed -= thrust*50;
                this.jumped = true;
            }
            gui.fuel--;
            if (this.smokeDelay <= 0) {
                this.smokeDelay = 3;
                this.smoke.push(new Smoke(-cos(this.angle)*50 + this.x, -sin(this.angle)*10 + this.y+random(-10, 10), this.angle));
            }
        }
    } else {
        this.jumped = false;
        this.ySpeed += gravity*5;
    }
    this.smokeDelay--;
    for (var i = 0; i < this.smoke.length; i++) {
        if (this.smoke[i].deleted) {
            this.smoke.splice(i, 1);
        }
    }
    for (var i = 0; i < this.smoke.length; i++) {
        this.smoke[i].draw();
    }
    this.y += this.ySpeed;
    this.draw();
    if (this.y > 400 / scaleRatio || this.y < 0) {
        this.hit();
    }
};
Spaceship.prototype.draw = function() {
    var x = this.x;
    var y = this.y;
    var ys = this.ySpeed;
    pushMatrix();
    translate(x, y);
    this.angle = Math.atan2(ys, 10)*180/Math.PI;//(y - 200) / 200 * 90;
    rotate(this.angle);
    stroke(255, 255, 255);
    fill(255, 0, 94);
    strokeWeight(10);
    stroke(255, 0, 0);
    pushMatrix();
    translate(random(-10,0)*cos(this.angle), random(-10,0)*sin(this.angle));
    triangle(0, 0, -50, -20, -50, 20);
    popMatrix();
    pushMatrix();
    translate(random(0,10)*cos(this.angle), random(0,10)*sin(this.angle));
    stroke(0, 255, 255);
    triangle(0, 0, -50, -20, -50, 20);
    popMatrix();
    stroke(255, 255, 255);
    triangle(0, 0, -50, -20, -50, 20);
    //  ellipse(-40,0,20,20);
    if (this.shielded) {
        fill(255, 255, 255, 100);
        noStroke();
        ellipse(-30,0,80,80);
    }
    popMatrix();
};
gui = new GUI();
spaceship = new Spaceship();
var acceleration = 0.01;
draw = function() {
    timeDelay--;
    gui.distance += 1 + spaceship.xSpeed*40;
    if (timeDelay < 0) {
        timeDelay = 1000;
        asteroids.push(new SpeedUp());
    }
    if (xSpeed > 5) {
        acceleration = -0.01;
    } else if (xSpeed < 0.1) {
        acceleration = 0.01;
    }
    xSpeed += acceleration;
    background(89, 0, 255);
    pushMatrix();
    scaleRatio = 1-xSpeed/10;
    scale(scaleRatio);
    spaceship.update();
    
    if (asteroids.length < 100) {
        if (random(0, 10) > 9.2) {
            var ran = random(0, 10);
            if (ran > 8) {
                asteroids.push(new Asteroid());
            } else if (ran > 7) {
                asteroids.push(new Fuel());
            } else if (ran > 6) {
                asteroids.push(new Shield());
            } else if (ran > 5.5) {
                asteroids.push(new JumpBoost());
            } else if (ran > 5) {
                asteroids.push(new FallBoost());
            } else {
                asteroids.push(new SpeedUp());
            }
        }
    }
    for (var i = 0; i < asteroids.length; i++) {
        if (asteroids[i].deleted) {
            asteroids.splice(i, 1);
        }
    }
    if (spaceship.xSpeed > 0) {
        spaceship.xSpeed -= 0.01;
    }
    for (var i = 0; i < asteroids.length; i++) {
        asteroids[i].speed += spaceship.xSpeed;
        asteroids[i].update();
        if (dist(spaceship.x-40, spaceship.y, asteroids[i].x, asteroids[i].y) < asteroids[i].size + 10) {
            asteroids[i].hit();
        }
    }
    popMatrix(); 
    gui.update();
};
keyPressed = function() {
    if (keyCode === 32) {
        space = true;
    }
};
keyReleased = function() {
    if (keyCode === 32) {
        space = false;
    }
};
mousePressed = function() {
    space = true;
};
mouseReleased = function() {
    space = false;
};
touchStart = function() {
    space = true;
};
touchEnd = function() {
    space = false;
};