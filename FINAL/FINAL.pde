Timer timer;
Spotlight spotlight;

boolean mouseDown= false;
int state= 0;
PImage scene;
PImage body;

PImage desktop;
PImage menu;
PImage mouse;
PImage icons;

float bodyX = 150;
float bodyY = 565;
boolean computerOn = false;
boolean scene3;

int number1= 0;
int number2 = 0;
int number3= 0 ;
int number4 = 0;
int y1= 245;
int y2 = 275;
int y3 = 275;

boolean justPressed = false;
float time = 0;

boolean showImage = true;
int IMG_NUM = 7;
PImage[] ad = new PImage[IMG_NUM];
int nextAd = 0;

PFont f;
String message= "IF YOU ARE READING THIS NOW I MUST BE DEAD.";
String message2= "YOU MUST HAVE THOUGHT YOU WERE SO CLEVER FINDING MY HIDEOUT BUT IT’S TOO LATE.";
String message3="THE FILES WERE DESTROYED THE MOMENT YOU ENTERED THOSE FAKE DIGITS INTO THE COMPUTER,";
String message4= "DIDN’T YOU THINK IT WAS ALL TOO EASY?" ;
String message5= "YOU’LL NEVER GET YOUR DIRTY HANDS ON THESE RESEARCH NOTES.";
String message6= "AS YOU ARE READING THIS THE COMPUTER IS SHUTTING ITSELF DOWN FOREVER";


void setup() {
  size(1000, 650);
  println(mouseX, mouseY);
  timer = new Timer(10);
  spotlight= new Spotlight();

  f = createFont("Minecraft", 16, true);

  menu= loadImage("menuBar copy.jpg");
  desktop = loadImage("desktop copy.jpg");
  mouse= loadImage("mouse.png");
  icons= loadImage("icons copy.png");
  for ( int i = 0; i < ad.length; i++) {
    ad[i] = loadImage("ad"+i+" copy.jpg");
  }
}

void draw() {

  if (time > 0) {
    time--;
  } else {
    time = 0;
    justPressed = false;
  }


  //spotlight.nextLevel();

  switch (state) {
  case 0:
    drawSceneOne();
    break;
  case 1:
    drawCompScreen1();
    break;
  case 2:
    drawCompScreen2();
    break;
  case 3:
    drawCompScreen3();
    break;
  case 4:
    drawCompScreen4();
  default:
  }

  switch (state) {
  case 0:
    if (mouseX <845 && mouseX>810 && mouseY<440 && mouseY >415) {
      if (mousePressed==true && spotlight.objectFound == true) {
        state =1;
      }
    }
  case 1:
    if (mouseX >80 && mouseX<120 && mouseY>540 && mouseY<585 && mousePressed== true) {
      computerOn = true;
      state=0;
    }

  case 2:
    if ( number4 == 1 && number1 == 4 && number2 == 3 && number3==9) {
      if ( mouseX > 440 && mouseX<560 && mouseY > 423 && mouseY<485) {
        if ( mousePressed == true && computerOn == true) {
          state = 2;
        }
      }
    }
  case 3:
    if (mouseX>65 && mouseX< 240 && mouseY< 580 && mouseY>500 && mousePressed==true && state==2) {
      state=3;
    }

  case 4:
    if (mouseX>65 && mouseX< 390 && mouseY< 445 && mouseY>325 && mousePressed==true && state==3) {
      state=4;
    }
  }
  spotlight.display();
}



void drawSceneOne() {

  scene = loadImage("Scene.png");
  pushMatrix();
  scale(1);
  image(scene, -30, -70);
  popMatrix();

  pushMatrix();
  scale(0.48);
  body = loadImage("murderScene.png");
  image(body, bodyX, bodyY);
  popMatrix();
  note = loadImage("Screen Shot .png");

  if (mouseY >75 && mouseY<100 && mouseX >700 && mouseX<740) {
    if (mousePressed == true) {
      pushMatrix();
      scale(0.7);
      image(note, mouseX, mouseY);
      popMatrix();
    }
  }
}


void drawCompScreen1() {

  computerOn = true;
  println(mouseX, mouseY);
  rectMode(CENTER);
  background(0);
  fill(150);
  rect(width/2, height/2, 900, 550);
  fill(255);
  textSize(30);
  text("Please Login", width/2-100, 100);
  text("Security Level One", width/2-130, 140);

  textSize(20);
  text("Ah I should have known, the code must be around here somewhere", 150, 550);

  noStroke();
  rect(100, 560, 40, 40);
  fill(0);
  text("X", 95, 568);

  noStroke();

  triangle(440, y1, 455, y2, 425, y3);
  triangle(540, y1, 555, y2, 525, y3);
  triangle(640, y1, 655, y2, 625, y3);
  triangle(340, y1, 355, y2, 325, y3);

  textSize(50);
  text(number1, 425, 350);
  text(number2, 525, 350);
  text(number3, 625, 350);
  text(number4, 325, 350);

  rect(width/2, 450, 120, 60);
  textSize(20);
  fill(255);
  text("Submit", width/2-37, 456);

  if (justPressed == false) { 
    justPressed = true;
    time = 5;
    if ( mouseX > 325 && mouseX < 355 && mouseY > 250 && mouseY < 278) {
      if (mousePressed) {
        //  if (justPressed == false) { 
        //    justPressed = true;
        //    timer = 20;

        number4++;

        if ( number4==10) {
          number4 = 0;
        }
      }
    }

    if ( mouseX > 425 && mouseX < 455 && mouseY > 250 && mouseY < 278) {
      if (mousePressed) {
        //  if (justPressed == false) { 
        //    justPressed = true;
        //    timer = 20;

        number1++;
        if ( number1 ==10) {
          number1=0;

          justPressed = true;
          time = 20;
        }
      }
    }
    if ( mouseX > 525 && mouseX < 555 && mouseY > 250 && mouseY < 278) {
      if (mousePressed) {
        //  if (justPressed == false) { 
        //    justPressed = true;
        //    timer = 20;

        number2++;
        if ( number2 ==10) {
          number2=0;
        }
      }
    }
    if ( mouseX > 625 && mouseX < 655 && mouseY > 250 && mouseY < 278) {
      if (mousePressed) {


        number3++;
        if ( number3 ==10) {
          number3=0;
        }
      }
    }
  }
}


void drawCompScreen2() {
  for (int i =0; i<9; i++) {
    drawAds();
  }

  if (frameCount % 1 ==0) {

    nextAd++;
  }

  if (nextAd == 7) {
    nextAd = 0;
    //showImage=false;
  }
    f = createFont("Minecraft", 17, true);


    noStroke();
    fill(200, 0, 0);
    rect(150, 550, 170, 80);
    textFont(f);
    fill(255);
    textSize(30);
    text("Force Quit", 70, 555);
  }


void mousePressed() {
  mouseDown=true;
}


void drawAds() {
  if (showImage == true) {
    image(ad[nextAd], random(0, 1000), random(0, 600), 400, 400);
  }
}


void drawCompScreen3() {
  noCursor();

  imageMode(CENTER);
  image(desktop, width/2, height/2);
  image(menu, width/2+190, height-25);
  image(icons, width/2, height/2);

  image(mouse, mouseX, mouseY);
  println(mouseX, mouseY);
}

void drawCompScreen4() {
  background(0);
  f = createFont("Minecraft", 17, true);

  int l=10;
  textFont(f);

  text(message, l, height/2-100);
  text(message2, l, height/2-40);
  text(message3, l, height/2);
  text(message4, l, height/2+40);
  text(message5, l, height/2+80);
  text(message6, l, height/2+120);

  l+=10;

  timer.countDown();
  textSize(30);
  text(timer.getTime(), 900, 600);
}