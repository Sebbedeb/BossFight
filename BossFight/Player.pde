  public int playerHealth=30;
  public int playerAC=12;
  private int playerChanceToHit=4;
  private int playerDamage=1;
  
  public int getPlayerAC()
  {
    return playerAC;
  }
  
  public void playerHit()
  {
    stroke(4);
    textFont(f,36);
    fill(255,255,0);
    text("HIT!",width/2,height/2);
    counter=0;
  }


  public int playerAttack()
  {

    int damage=0;
    int rolled=rollD20+playerChanceToHit;
    if (rolled>bossAC && rollD20!=20)
    {
      println("Nice, you rolled "+rolled+".");
      damage=rollD6+playerDamage;
      hit();
      bossHealth=bossHealth-damage;
      println("Good strike! You dealt "+damage+" damage. The boss has "+bossHealth+" life left");
      return damage;
    } else if (rollD20==20)
    {
      println("CRIT!");
      damage=((rollD6)*2)+playerDamage;
      hit();
      bossHealth=bossHealth-damage;
      println("You strike the boss with a fury never before seen! You dealt "+damage+" damage. The boss has "+bossHealth+" life left.");
      return damage;
    } else
    {
      println("Arw, you missed! You rolled "+rolled+".");
      rollD20=0;
      rolled=0;
    }
    turnCounter+=1;
    return damage;
  }
