Particle [] bob;
void setup()
{
  size(500, 500);
  bob=new Particle [300];
  for (int i=0; i<6; i++) {
    bob[i]=new OddballParticle();
  }

  bob[0]=new OddballParticle();
  for (int i=6; i<bob.length; i++) {
    bob[i]=new Particle();
  }
}
void draw()
{
  background (255, 255, 255);
  for (int i=0; i<bob.length; i++) {
    bob[i].show();
    bob[i].move();
  }
}

void mousePressed()
{
  for (int i=0; i<6; i++) {
    bob[i]=new OddballParticle ();
  }

  bob[0]=new OddballParticle();
  for (int i=6; i<bob.length; i++) {
    bob[i]=new Particle();
  }
  for (int i=0; i<bob.length; i++) {
    bob[i].y=250;
    bob[i].x=250;
  }
}

class Particle
{
  double x, y, mySpeed, myAngle;
  color c;
  int k;
  Particle()
  {
    k=((int)(Math.random()*6))*2;
    x= 250;
    y=250;
    myAngle=Math.random()*2*Math.PI;
    mySpeed=Math.random()*10;
  }


  void move() {
    x += Math.cos(myAngle) * mySpeed;
    y += Math.sin(myAngle) * mySpeed;
  }
  void show() {
    noStroke();
    fill(0, 0, 0);
    circle((int)x, (int)y, 30);
    fill(255, 255, 255);
    text(k, (int)x-3, (int)y+3);
  }
}

class OddballParticle extends Particle  //inherits from Particle
{
  OddballParticle()
  {
    x=y=250;
    k=(((int)(Math.random()*6))*2)+1;
    mySpeed=Math.random()*4+2;
  }


  void show() {
    noStroke();
    fill(255, 0, 0);
    circle((int)x, (int)y, 30);
    fill(255, 255, 255);
    text(k, (int)x-3, (int)y+3);
  }


  void move() {
    x += Math.cos(myAngle) * mySpeed;
    y += Math.sin(myAngle) * mySpeed;
    if (x>500 || x<0 ||y>500 || y<0) {
      x = 250;
      y = 250;
    }
  }
}
