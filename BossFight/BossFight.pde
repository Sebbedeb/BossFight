private int dice;
private int turnCounter;
private int rollD20;
private int rollD6;
private int rollD4;
Boss boss1;
public int counter;
public int bossCounter;
PFont f;

//state 1 - Your turn
void setup()
{
  bossCounter=100;
  counter=0;
  f = createFont("Arial", 16, true);
  size(400, 400);
  background(175);
  boss1 = new Boss(30, 8, 1, 1);
  boss1.display(width/2, height/2, 100);

  afterHit();
}

void draw()
{
  bossCounter++;
  afterHit();
  counter++;
  rollD20=int (random(1, 21));
  rollD6=int (random(1, 7));
  rollD4=int (random(1, 5));
  boss1.winScreen();
}

void mousePressed()
{
  counter=0;
  playerAttack();
}

void win()
{
  background(175);
  stroke(4);
  textFont(f, 50);
  fill(0, 255, 0);
  text("YOU WIN!", (width/2)-50, height/2);
}

  void afterHit()
  {
    if (counter>=60)
    {
      background(175);
      boss1.display(width/2, height/2, 100);
      bossCounter=0;
    }
  }
