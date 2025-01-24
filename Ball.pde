class Ball
{
  float size, speed;
  PVector position, direction;
  color c;
  
  Ball(float size, float speed) 
  {
    this.size = size;
    this.speed = speed;
    direction = new PVector(1, 1);
    Setup();
  }
  
  void Setup()
  {
    SetupBall();
  }
  void Update()
  {
    UpdateBall();
  }
  
  void SetupBall()
  {
    SetupPosition();
    SetupColor();
  }
  void UpdateBall()
  {
    UpdateColor();
    
    fill(c);
    UpdatePosition();
  }
  
  void SetupPosition()
  {
    position = new PVector(random(25 + size / 2, width - 25 - size / 2), random(25 + size / 2, height - 25 - size / 2));
  }
  void UpdatePosition()
  {
    direction = new PVector(position.x - size / 2 <= 0 || position.x + size / 2 >= width ? direction.x * -1 : direction.x, position.y - size / 2 <= 0 || position.y + size / 2 >= height ? direction.y * -1 : direction.y);
    
    position = new PVector(position.x + speed * direction.x, position.y + speed * direction.y);
    ellipse(position.x, position.y, size, size);
  }
  void SetupColor()
  {
    c = color(random(32, 255), random(32, 255), random(32, 255));
  }
  void UpdateColor() {}
  
  Boolean BallWasPressed()
  {
    if ((mouseX < position.x - size / 2 || mouseX > position.x + size / 2) || (mouseY < position.y - size / 2 || mouseY > position.y + size / 2)) return false;
    Setup();
    return true;
  }
}
