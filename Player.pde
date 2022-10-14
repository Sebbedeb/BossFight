class Player
{
  public int playerHealth;
  public int playerAC;
  private int playerChanceToHit;
  private int playerDamage;
  
  Player(int playerHealth ,int playerAC , int playerChanceToHit , int playerDamage)
  {
    this.playerHealth=playerHealth;
    this.playerAC=playerAC;
    this.playerChanceToHit=playerChanceToHit;
    this.playerDamage=playerDamage;
  }
  
  private void lossScreen()
  {
  if(player1.playerHealth<=0)
  {
    lose();
  }
  }
  
  private void lose()
  {
    {
    background(0);
    stroke(4);
    textFont(f, 50);
    fill(0, 255, 255);
    text("You Lose!", (width/2)-50, height/2);
  }
}
  
  public int getPlayerAC()
  {
    return playerAC;
  }
  
  public void playerHit()
  {
    stroke(4);
    textFont(f,80);
    fill(255,255,0);
    text("HIT!",width/2,height/2);
    counter=0;
  }


  public int playerAttack()
  {

    int damage=0;
    int rolled=rollD20+playerChanceToHit;
    if (rolled>boss1.bossAC && rollD20!=20)
    {
      println("Nice, you rolled "+rolled+".");
      damage=rollD6+playerDamage;
      playerHit();
      boss1.bossHealth=boss1.bossHealth-damage;
      println("Good strike! You dealt "+damage+" damage. The boss has "+boss1.bossHealth+" life left");
      return damage;
    } else if (rollD20==20)
    {
      println("CRIT!");
      damage=((rollD6)*2)+playerDamage;
      playerHit();
      boss1.bossHealth=boss1.bossHealth-damage;
      println("You strike the boss with a fury never before seen! You dealt "+damage+" damage. The boss has "+boss1.bossHealth+" life left.");
      return damage;
    } else
    {
      println("Arw, you missed! You rolled "+rolled+".");
      rollD20=0;
      rolled=0;
    }
    return damage;
  }
}
