int NUMBER_OF_BALLS = 10;
int currentScore;
float[] ballSize, ballSpeed;
PVector[] ballPosition, ballDirection;
color[] ballColor;

void setup()
{
  size(800, 600); 
  
  currentScore = 0;
  
  ballSize = new float[NUMBER_OF_BALLS];
  ballSpeed = new float[NUMBER_OF_BALLS];
  ballPosition = new PVector[NUMBER_OF_BALLS];
  ballDirection = new PVector[NUMBER_OF_BALLS];
  ballColor = new color[NUMBER_OF_BALLS];
  
  for (int i = 0; i < NUMBER_OF_BALLS; i++)
  {
    ballSize[i] = 15 * i;
    ballSpeed[i] = random(5, 10);
    ballDirection[i] = new PVector(1, 1);
    setupBall(i);
  }
}

void draw()
{
  background(0);
  
  fill(255);
  textSize(50);
  text(currentScore, width / 2 - textWidth("" + currentScore) / 2, height / 7 - textAscent());
  
  for (int i = 0; i < NUMBER_OF_BALLS; i++)
  {
    updateBall(i);
  }
}

void mousePressed()
{
  for (int i = 0; i < NUMBER_OF_BALLS; i++)
  {
    if (ballWasPressed(i))
      currentScore += 1;
  }
}

void setupBall(int i)
{
  setupPosition(i);
  setupColor(i);
}

void setupPosition(int i)
{
  ballPosition[i] = new PVector(random(25 + ballSize[i] / 2, width - 25 - ballSize[i] / 2), random(25 + ballSize[i] / 2, height - 25 - ballSize[i] / 2));
}

void setupColor(int i)
{
  ballColor[i] = color(random(32, 255), random(32, 255), random(32, 255));
}

void updateBall(int i)
{
  updatePosition(i);
  updateColor(i);
  fill(ballColor[i]);
  ellipse(ballPosition[i].x, ballPosition[i].y, ballSize[i], ballSize[i]);
}

void updatePosition(int i)
{
  // Mudando a direção quando a bola atinge a parede
  ballDirection[i] = new PVector(
    ballPosition[i].x - ballSize[i] / 2 <= 0 || ballPosition[i].x + ballSize[i] / 2 >= width ? ballDirection[i].x * -1 : ballDirection[i].x, 
    ballPosition[i].y - ballSize[i] / 2 <= 0 || ballPosition[i].y + ballSize[i] / 2 >= height ? ballDirection[i].y * -1 : ballDirection[i].y
  );
  
  // Atualizando a posição
  ballPosition[i] = new PVector(
    ballPosition[i].x + ballSpeed[i] * ballDirection[i].x, 
    ballPosition[i].y + ballSpeed[i] * ballDirection[i].y
  );
}

void updateColor(int i) {
  // Não faz nada no momento, mas se você precisar de lógica para mudar a cor, pode colocar aqui.
}

boolean ballWasPressed(int i)
{
  if ((mouseX < ballPosition[i].x - ballSize[i] / 2 || mouseX > ballPosition[i].x + ballSize[i] / 2) || 
      (mouseY < ballPosition[i].y - ballSize[i] / 2 || mouseY > ballPosition[i].y + ballSize[i] / 2)) 
    return false;
    
  setupBall(i);  // Reconfigura a bola após ser pressionada
  return true;
}
