int NUMBER_OF_BALLS = 10;

Ball[] b;
int currentScore;

void setup()
{
  size(800, 600); 
  
  currentScore = 0;
  b = new Ball[NUMBER_OF_BALLS];
  
  for (int x = 0; x < b.length; x++)
    b[x] = new Ball(15 * x, random(5, 10));
}

void draw()
{
  background(0);
  
  fill(255);
  textSize(50);
  text(currentScore, width / 2 - textWidth("" + currentScore) / 2, height / 7 - textAscent());
  
  for (int x = 0; x < b.length; x++)
    b[x].Update();
}

void mousePressed()
{
  for (int x = 0; x < b.length; x++)
  {
    if (b[x].BallWasPressed())
      currentScore += 1;
  }
}
