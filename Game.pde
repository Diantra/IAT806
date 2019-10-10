/* the point of this game is to click the circles on the screen as fast as possible
   score is calculated by amount of background still visible.*/

Potato[] potats  = new Potato [10];  // An array of 10 potatoes

int score,y,x;                      //creates integers score, y, and x
boolean iswin;                      //creates boolean iswin
void setup(){                      
  background(0);                    // sets background to black
  size (600,600);                   // sets canvas size to 600x600
  frameRate(10);                    // sets frame rate to 10 fps
  score = 0;                        // sets score to 0
iswin = true;                       // sets iswin boolean to true

//a loop that fills the potato array with 10 circles of random colour and location that will increase in size at a variety of speeds
  for (int i = 0; i< potats.length; i ++){
     potats[i] = new Potato(10, color(random(255),random(255),random(255)), random(width), random(height), random(5));
   }
}

class Potato {             // creates and calls class (potato) that takes a radius, x and y positions, growth rate, and colour
  float radius; 
  float posx, posy;
  float growth;
  color colour;
  Potato (float r, color c ,float x, float y,float g){ 
        this.radius = r;
        this.colour = c;
        this.posx = x;
        this.posy = y;
        this.growth = g;
  }
  
 void grow() {                 // creates function grow which affects and can halt the growth of potatoes
   radius += growth;
   fill(colour);
   circle (posx,posy,radius);
 }
}
   
void draw() {                  
  background(0);                                     // sets background to 0
     for (int i = 0; i< potats.length; i ++){        //loop that incrementally grows potatoes in size
      potats[i].grow();}

for (int i = 0; i < potats.length; i ++){           // a loop that stops potatoes from being grown if clicked on by the mouse
  if ((pow((potats[i].posx - mouseX),2) + pow((potats[i].posy - mouseY),2)) <= pow(potats[i].radius,2) && mousePressed == true) {
  potats[i].growth = 0;}
}  

iswin = true;                                       //sets boolean iswin to true

for (int p = 0; p < potats.length; p ++){          //loop that checks if any potatoes are growing, if so iswin is set to false
  if (potats[p].growth != 0){
      iswin = false;}
}


if (iswin == true){                                    //if iswin is true:
score = 0;                                                 // sets score to 0

for (int x = 0; x < width && y < height; x ++){                //loop counts black pixels in each row
    if (get(x,y) == color(0)) {
      score = score + 1;}}                                     // adds black pixel number to score
x = 0;                                                     //sets x to 0
for (int y = 0; y < height && x < width; y ++){                //loop counts black pixels in each column
    if (get(x,y) == color(0)) {
      score = score + 1;}}                                     //adds black pixel number to score
y = 0;                                                    //sets y to 0     

// prints size 32 size text in center of screen that tells player their score
fill(255);
textSize(32);
textAlign(LEFT);
text("Your Score is " + score + "!", 150, 30); 


}}
