float numCookies = 10000000;
float cps = 0;
int numGrandmas = 0; 
int numAutoclickers = 0;
int numFactories = 0;
int numMines = 0;
int numShipments = 0;
int numLabs = 0;
int numPortals = 0;
int numTimes = 0;
float costAutoclicker;
float costGrandma;
float costFactory;
float costMine; float costShipment; float costLab; float costPortal; float costTime;
final int DISPLAY_DURATION = 1300;
PFont font;
PImage cookie; 
PImage cursor; 
PImage grandma;
PImage factory;
PImage mine;
PImage shipment;
PImage lab;
PImage portal;
PImage time;
boolean cursorCheck = false; 
boolean grandmaCheck = false; 
boolean plusCheck = false;
boolean factoryCheck = false;
boolean mineCheck = false;
boolean shipmentCheck = false;
boolean labCheck = false;
boolean portalCheck = false;
boolean timeCheck = false;
ArrayList <Texts> plusOnes = new ArrayList<Texts>();
ArrayList <Sprite> cursors = new ArrayList<Sprite>();
ArrayList <Sprite> grandmas = new ArrayList<Sprite>();
ArrayList <Sprite> factories = new ArrayList<Sprite>();
ArrayList <Sprite> mines = new ArrayList<Sprite>();
ArrayList <Sprite> shipments = new ArrayList<Sprite>();
ArrayList <Sprite> labs = new ArrayList<Sprite>();
ArrayList <Sprite> portals = new ArrayList<Sprite>();
ArrayList <Sprite> times = new ArrayList<Sprite>();
import processing.sound.*;
SoundFile music;
SoundFile click;


void setup() {
  size(600, 600);
  cookie = loadImage("cookie.png");
  grandma = loadImage("grandma.png");
  cursor = loadImage("cursor.png");
  factory = loadImage("factory.png");
  mine = loadImage("mine.png");
  shipment = loadImage("shipment.png");
  lab = loadImage("alchemy.png");
  portal = loadImage("portal.png");
  time = loadImage("timem.png");
  font = createFont("Courier New", 32);
  costAutoclicker = 15;
  costGrandma = 100; costFactory = 500; costMine = 2000; costShipment = 7000; 
  costLab = 50000; costPortal = 1000000; costTime = 10000000;
  textFont(font);
  click = new SoundFile(this, "click.mp3");
}

void draw() {
  background(155, 126, 94);
  numCookies += cps/frameRate;
  scale(1.0);
  textSize(26);
  fill(38, 32, 27);
  text("Cookies: "+int(numCookies), 40, 40);
  text("CPS: "+(cps), 40, 60);

  textSize(20);
  text("Autoclicker(-"+int(costAutoclicker)+")", 40, 520);
  text("Grandma(-"+int(costGrandma)+")", 40, 540);
  text("Factory(-"+int(costFactory)+")", 40, 560);
  text("Mine(-"+int(costMine)+")", 40, 580);
  text("Shipment(-"+int(costShipment)+")", 300, 520);
  text("Alchemy Lab(-"+int(costLab)+")", 300, 540);
  text("Portal(-"+int(costPortal)+")", 300, 560);
  text("Time Machine(-"+int(costTime)+")", 300, 580);
  text(mouseX+","+mouseY, mouseX, mouseY);



  //text(mouseX+","+mouseY, mouseX, mouseY);
  if (cursorCheck== true) {
    for (Sprite i : cursors) {
      noTint();
      i.draw();
    }
  }

  if (grandmaCheck== true) {
    for (Sprite i : grandmas) {
      noTint();
      i.draw();
    }
  }

  if (factoryCheck == true) {
    for (Sprite i : factories) {
      noTint();
      i.draw();
    }
  }

  if (mineCheck == true) {
    for (Sprite i : mines) {
      noTint();
      i.draw();
    }
  }

  if (shipmentCheck == true) {
    for (Sprite i : shipments) {
      noTint();
      i.draw();
    }
  }

  if (labCheck == true) {
    for (Sprite i : labs) {
      noTint();
      i.draw();
    }
  }

  if (portalCheck == true) {
    for (Sprite i : portals) {
      noTint();
      i.draw();
    }
  }

  if (timeCheck == true) {
    for (Sprite i : times) {
      noTint();
      i.draw();
    }
  }

  if (plusCheck == true) {
    scale(1.0);
    for (Texts i : plusOnes) {

      i.write();
      i.move();
      i.alive = true;

      if (millis() - i.start > 800) {
        i.speed = 1;
      }
      if (millis() - i.start > DISPLAY_DURATION) {
        i.alive = false;
      }
    }
  } else {
    image(cookie, 250, 250, 128, 128);
  }

  if (mousePressed == true) {
    if (mouseX <374 && mouseX > 250 && mouseY > 250 && mouseY < 374) {
      tint(142, 110, 78);
      scale(0.85);
      translate(55.0, 55.0);
    }
  } else {
    noTint(); 
    scale(1.0);
  }
  image(cookie, 250, 250, 128, 128);
}
void mouseClicked() {
  if (mouseX <374 && mouseX > 250 && mouseY > 250 && mouseY < 374) {
    // when cookie is clicked
    numCookies++;
  }

  if (mouseX > 40 && mouseX < 170 && mouseY>505 && mouseY<520) {
    // when "Autoclicker" clicked 
    addCursors();
    //click.play();
    cursorCheck = true;
  }

  if (mouseX > 40 && mouseX < 170 && mouseY>525 && mouseY<540) {
    // when "Grandma" clicked 
    addGrandmas() ;
    grandmaCheck = true;
  }

  if (mouseX > 40 && mouseX < 170 && mouseY>545 && mouseY<560) {
    // when "Factory" clicked 
    addFactories() ;
    factoryCheck = true;
  }

  if (mouseX > 40 && mouseX < 170 && mouseY>565 && mouseY<580) {
    // when "Mine" clicked 
    addMines() ;
    mineCheck = true;
  }

  if (mouseX > 300 && mouseX < 445 && mouseY>505 && mouseY<520) {
    // when "Shipment" clicked 
    addShipments() ;
    shipmentCheck = true;
  }

  if (mouseX > 300 && mouseX < 445 && mouseY > 525 && mouseY < 540) {
    addLabs();
    labCheck = true;
  }

  if (mouseX > 300 && mouseX < 445 && mouseY > 545 && mouseY < 560) {
    addPortals();
    portalCheck = true;
  }

  if (mouseX > 300 && mouseX < 445 && mouseY > 565 && mouseY < 580) {
    addTimes();
    timeCheck = true;
  }
}

void mousePressed() {
  if (mouseX <374 && mouseX > 250 && mouseY > 250 && mouseY < 374) {
    // when cookie is clicked
    plusOnes.add(new Texts("+1", int(random(290, 315)), 310, millis()));
    plusCheck = true;
  }
}

void addCursors() {
  if (numCookies >= costAutoclicker) {
    numCookies-=costAutoclicker;  // take 20 cookies
    costAutoclicker = costAutoclicker * 1.15;
    numAutoclickers++; // add an autoclicker
    cursors.add(new Sprite(cursor, int(random(40, 230)), int(random(120, 195)), 20, 20));
    cps += 0.1;
  }
}

void addGrandmas() {
  if (numCookies >= costGrandma) {
    numCookies-=costGrandma;
    costGrandma = costGrandma * 1.15;
    numGrandmas++;
    grandmas.add(new Sprite(grandma, int(random(380, 550)), int(random(100, 175)), 49, 60));
    cps += 1.0;
  }
}


void addFactories() {
  if (numCookies >= costFactory) {
    numCookies-=costFactory;  
    costFactory = costFactory * 1.15;
    numFactories ++;
    factories.add(new Sprite(factory, int(random(40, 230)), int(random(195,270)), 40, 40));
    cps += 4.0;
  }
}

void addMines() {
  if (numCookies >= costMine) {
    numCookies-=costMine;
    costMine = costMine * 1.15;
    numMines ++;
    mines.add(new Sprite(mine, int(random(380, 550)), int(random(195,270)), 40, 40));
    cps += 12.0;
  }
}

void addShipments() {
  if (numCookies >= costShipment) {
    numCookies-=costShipment;
    costShipment = costShipment * 1.15;
    numShipments ++;
    shipments.add(new Sprite(shipment, int(random(40, 230)), int(random(270,345)), 40, 40));
    cps += 20.0;
  }
}

void addLabs() {
  if (numCookies >= costLab) {
    numCookies-=costLab;
    costLab = costLab * 1.15;
    numLabs ++;
    
    labs.add(new Sprite(lab, int(random(380, 550)), int(random(270,345)), 24, 32));
    cps += 100.0;
  }
}

void addPortals() {
  if (numCookies >= costPortal) {
    numCookies-=costPortal;
    costPortal = costPortal * 1.15;
    numPortals ++;
    portals.add(new Sprite(portal, int(random(40, 230)), int(random(345,420)), 40, 40));
    cps += 1332.0;
  }
}

void addTimes() {
  if (numCookies >= costTime) {
    numCookies-=costTime;
    costTime = costTime * 1.15;
    numTimes ++;
    times.add(new Sprite(time, int(random(370, 560)), int(random(345, 420)), 40, 40));
    cps += 24691.2;
  }
}