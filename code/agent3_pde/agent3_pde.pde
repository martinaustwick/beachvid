//in 3D


ArrayList<Agent> agents;
int nagents = 100;
int nAgentsAtStart = 10;
int nFramesPause = 20;

ArrayList<PVector> shape;
float speed = 5; 
boolean capture = false;

//camera positions
float theta = 0;
float camRad = 1000;

//black bg
PShape ps;

boolean lightDebug = true;


void setup()
{
    size(1600, 1000, P3D);
    ps = loadShape("testSet1.svg");
    centroid =  new PVector(0,300,0);
    agents = new ArrayList<Agent>();
    
    for(int i = 0; i<nAgentsAtStart; i++)
    {
      agents.add(new Agent());
    }
    
    shape = new ArrayList<PVector>();
//    shape.add(new PVector(0, height));
//    shape.add(new PVector(width/4, height/2));
//    shape.add(new PVector(width/2, height));
//    shape.add(new PVector(3*width/4, height/4));
//    shape.add(new PVector(width, height));
    
    shape.add(new PVector(-300,-300,-200));
    shape.add(new PVector(100,100,400));
    
    shape = pointCloud(ps);
}

void draw()
{
  
   if(agents.size()<nagents && frameCount%nFramesPause==0) agents.add(new Agent());
   //background(0,150);
   background(0);
   camera(camRad*sin(theta), 0, camRad*cos(theta), 0,0,0,0,1,0);
   
   for(Agent a: agents)
   {
       a.accel(agents);
       for(int i = 0; i<shape.size(); i++)
       {
           a.a.add(pointAvoid(shape.get(i), a.p, a.v));
       }
       
       
   }
   
   for(Agent a: agents)
   {
       a.move();
   }
   
   for(Agent a: agents)
   {
       a.display();
   }
   rectMode(CENTER);
   fill(0,0,0,250);
   if(lightDebug) stroke(255);
   else noStroke();
   //noStroke();
   for(int i = 0; i<shape.size();i++)
   {
       pushMatrix();
         translate(shape.get(i).x, shape.get(i).y, shape.get(i).z);
         //point(0,0);
         //noStroke();
         rect(0,0, 2*spacer+3, 2*spacer+3); 
       popMatrix();
   }
   
   if(lightDebug)
   {
     fill(255);
     ellipse(centroid.x, centroid.y, 5,5);
   }
   
   if(capture)
   {
       saveFrame("images/#####.jpg");
   }
  
   
  
  
//  pushMatrix();
//    translate(-width*0.3, -width*0.3, 0);
//    scale(2);
//    shapeMode(CENTER);
//    shape(ps);
//  popMatrix();
}
