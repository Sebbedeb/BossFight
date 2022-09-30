private int rollD20;
private int rollD6;
private int rollD4;
public int counter;
public PFont f;
public boolean yourTurn;
Boss boss1;
Player player1;


void setup()
{
  counter=0;
  f = createFont("Arial", 16, true);
  size(800, 800);
  background(175);
  player1 = new Player(50, 10, 1, 1);
  boss1 = new Boss(30, 8, 1, 1);
  boss1.display(width/2, height/2, 200);
  yourTurn=true;

  afterHit();
}

void draw()
{
  afterHit();
  counter++;
  rollD20=int (random(1, 21));
  rollD6=int (random(1, 7));
  rollD4=int (random(1, 5));
  boss1.winScreen();
  player1.lossScreen();
}

void mousePressed()
{
  if (yourTurn)
  {
    counter=0;
    player1.playerAttack();
    yourTurn=false;
    println("The boss readies an attack");
  } 
  else
  {

    counter=0;
    boss1.bossAttack();
    yourTurn=true;
    println("It is again your turn to strike");
  }
}

  void win()
  {
    background(175);
    stroke(4);
    textFont(f, 100);
    fill(0, 255, 0);
    text("YOU WIN!", (width/2)-50, height/2);
  }

  void afterHit()
  {
    if (counter>=60)
    {
      background(175);
      boss1.display(width/2, height/2, 200);
    }
  }
