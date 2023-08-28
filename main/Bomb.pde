class Bomb implements GameObject {
  private String name;
  private ArrayList<String> tags;
  private Transform transform;
  private int score = 0;
  private boolean hasExploded = false;
  
  PImage sprite;
  
  public Bomb (String name) {
    this.name = name;
    this.tags = new ArrayList<String>();
    this.tags.add("Bomb");
    this.transform = new Transform(this);
    this.transform.position = new PVector(player.getTransform().position.x, player.getTransform().position.y);
    this.transform.velocity = new PVector(0,4);
    this.transform.size = new PVector(24, 48);
    this.sprite = bombSprite;
  }
  
  public void update() {
    this.transform.update();
    fill(0, 255, 0);
    //rectMode(CENTER);
    //rect(this.transform.position.x, this.transform.position.y, this.transform.size.x, this.transform.size.y); 
    imageMode(CENTER);
    image(sprite, this.transform.position.x, this.transform.position.y, 24, 48);
    
    for (GameObject collision : this.transform.getCollisions()) {
      if (!this.hasExploded) {
        if (collision.containsTag("Environment") || collision.containsTag("Ground") || collision.containsTag("EnemyPlane")) {
          createExplosion(this.transform.position);
          this.hasExploded = true;
          destroy(this);
        }
      }
    }
    
    if (!this.transform.onScreen())
      destroy(this);
  }
  
  public boolean containsTag(String tag) {
    return tags.contains(tag);
  }
  
  public String getName() {
    return name;
  }
  
  public ArrayList<String> getTags() {
    return tags;
  }
  
  public Transform getTransform() {
    return transform;
  }
  
  public int getScore() {
    return score;
  }
  
  public int getDamage() {
    return 0;
  }
  
  public void takeDamage(int damage) {
    return;
  }
}
