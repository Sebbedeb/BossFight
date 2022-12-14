class Boss
{
  int bossChanceToHit;
  int bossDamage;
  int bossX;
  int bossY;
  int bossHealth;
  int bossAC;
  
  
  Boss(int bossHealth, int bossAC, int bossChanceToHit, int bossDamage)
  {
    this.bossHealth=bossHealth;
    this.bossAC=bossAC;
    this.bossChanceToHit=bossChanceToHit;
    this.bossDamage=bossDamage;
  }
  
  public void winScreen()
  {
  if(bossHealth<=0)
  {
    win();
  }
  }
  
  public void bossTurn()
  {
    //turnToBoss();
    bossAttack();
    //turnToPlayer();
  }


  public int getBossAC()
  {
    return bossAC;
  }
  
  private void bossAttack()
  {
    player1.getPlayerAC();
    int rolled=rollD20+bossChanceToHit;
    if (rolled>player1.playerAC && rollD20!=20)
    {
      println("The boss rolled a "+rolled+".");
      int damage = rollD4+bossDamage;
      player1.playerHealth=player1.playerHealth-damage;
      println("Oof, the boss did "+damage+" damage. You have "+player1.playerHealth+" life left");
      rolled=0;
      damage=0;
    } else if (rollD20==20)
    {
      println("OH NO, THE MONSTER GOT A CRIT!");
      int damage = (rollD4*2)+bossDamage;
      player1.playerHealth=player1.playerHealth-damage;
      println("You feel the full strength of the beast, as it deals "+damage+" damage. You have "+player1.playerHealth+" life left.");
      rolled=0;
      damage=0;
    } else
    {
      println("Phew, you managed to dodge!");
      rollD20=0;
      rolled=0;
    }
  }

  public void display(int bossX, int bossY, int size)
  {
    fill(255, 0, 0);
    stroke(0);
    line((bossX), bossY, (bossX+size), bossY-size);
    line((bossX), bossY, (bossX-size), bossY-size);
    line(bossX, bossY+size*0.5, bossX+size/2, bossY+size*1.25);
    line(bossX, bossY+size*0.5, bossX-size/2, bossY+size*1.25);
    ellipse(bossX, bossY, size, size*2);
    ellipse(bossX, height-bossY-size, size/2, size/2);
  }
}
