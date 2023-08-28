class Tree implements GameObject {
  private String name;
  private ArrayList<String> tags;
  private Transform transform;
  private int score = 0;
  private boolean leftOfScreen = false;
  private int spriteIndex = 0;
  ArrayList<PImage> sprites = new ArrayList<PImage>();
  
  PImage sprite;
  
  public Tree (String name) {
    this.name = name;
    this.tags = new ArrayList<String>();
    this.tags.add("Environment");
    this.transform = new Transform(this);
    this.transform.position = new PVector(width+64, height-93);
    this.transform.velocity = new PVector(-worldSpeed,0);
    this.transform.size = new PVector(96, 48);
    this.sprites = treeSprites;
    this.spriteIndex = round(random(4));
  }
  
  public void update() {
    this.transform.update();
    for (GameObject collision : this.transform.getCollisions()) {
      if (collision.containsTag("Explosion")) {
        this.spriteIndex = 5;
      }
    }
    
    ArrayList<String> edgeCollisions = this.transform.getEdgeCollisions();
    if (edgeCollisions.contains(LEFT)) {
      if (!leftOfScreen)
        leftOfScreen = true;
    }
    if (leftOfScreen && !this.transform.onScreen()) {
      destroy(this);
    }
    
    fill(0, 255, 0);
    imageMode(CENTER);
    image(sprites.get(this.spriteIndex), this.transform.position.x, this.transform.position.y, 96, 96);
    //rect(this.transform.position.x, this.transform.position.y, this.transform.size.x, this.transform.size.y); 
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
