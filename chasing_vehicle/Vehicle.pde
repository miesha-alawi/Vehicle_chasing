//referenced from 'Nature of Code'
//Daniel Shiffman

class Vehicle {
  PVector acceleration, velocity, position;
  float r, maxspeed, maxforce;
  Vehicle(float x, float y)
  {
    acceleration = new PVector(0,0);
    velocity = new PVector(0, -2);
    position = new PVector(x,y);
    r = 6;
    maxspeed = 8;
    maxforce = 0.2;
  }
  
  void update()
  {
    //update velocity
    velocity.add(acceleration);
    //limit speed
    velocity.limit(maxspeed);
    position.add(velocity);
    //reset acceleration to 0 each cycle
    acceleration.mult(0);
  }
  
  void applyForce(PVector force)
  {
    acceleration.add(force);
  }
  
  //calculates a steering force towards a target
  //steer = desired - velocity
  void seek(PVector target)
  {
    PVector desired = PVector.sub(target, position);
    
    //scale to max speed
    desired.setMag(maxspeed);
    
    //steering = desired - velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce); //limit to max steering force
    
    applyForce(steer);
  }
  
  void draw()
  {
    //draw a triangle rotated in the direction of velocity
    float theta = velocity.heading() + PI / 2;
    fill(127);
    stroke(200);
    strokeWeight(1);
    push();
    translate(position.x,position.y);
    rotate(theta);
    beginShape();
    vertex(0, -r * 2);
    vertex(-r, r *2);
    vertex(r,r*2);
    endShape(CLOSE);
    pop();
  }
}
