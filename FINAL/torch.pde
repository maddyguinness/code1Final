PImage imgE;
PImage note;

class Spotlight {
  boolean objectFound= false;

  Spotlight() {
    //timer = new Timer(10);
    note = loadImage("Note.png");
  }

  void display() {
    if (objectFound == false && computerOn == false) {
      imgE= loadImage("spotlight mask.png");
      pushMatrix();
      scale(4);
      float imgX= constrain(mouseX, 250, 500);
      float imgY= constrain(mouseY, 100, 250);

      image(imgE, imgX-width/2, imgY-height/2);
      popMatrix();
      fill(255);
      text("Huh,it's dark in here... Where's the light switch?", 200, 50);
      println(mouseX, mouseY);
    }


    if (mouseY > 105 && mouseY<125 
      && mouseX >335 && mouseX<350 & computerOn == false) {
      fill(255);
      text("Oh here it is!", 230, 75);

      if (mousePressed == true) {
        objectFound= true;
      }
    }

    if (objectFound==true && computerOn == false) {
      //body
      if (mouseY>385 && mouseY< 555 && mouseX> 215 && mouseX<315) {
        fill(200);
        text("Looks like someone beat me to it", 60, 330);
        text("I need to get those files on the computer now", 70, 345);
      }
    }
  }
}