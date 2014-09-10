//in 3D


ArrayList<Agent> agents;
ArrayList<PVector> shape;
float speed = 5; 
boolean capture = false;

//camera positions
float theta = 0;
float camRad = 1000;

void setup()
{
    size(600, 600, P3D);
    
    agents = new ArrayList<Agent>();
    
    for(int i = 0; i<50; i++)
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
}

void draw()
{
   //background(0,0,150);
   background(255);
   camera(camRad*sin(theta), 0, camRad*cos(theta), 0,0,0,0,1,0);
   
   for(Agent a: agents)
   {
//       for(int i = 1; i<shape.size(); i++)
//       {
//           PVector inter = intersect(shape.get(i-1), shape.get(i), a.p, a.v);
//           if(PVector.dist(inter, a.p)<50)
//           {
//               PVector deflect = PVector.sub(a.p, inter);
//               deflect.normalize();
//               deflect.mult(0.5);
//               a.v.add(deflect);
//               float theta = random(TWO_PI);
//               a.v.add(new PVector(sin(theta), cos(theta)));
//               //a.v.normalize();
//               //a.v.mult(speed);
//           }
//       }
       a.accel(agents);
       for(int i = 0; i<shape.size(); i++)
       {
           a.v.add(pointAvoid(shape.get(i), a.p, a.v));
       }
       
       a.v.normalize();
       a.v.mult(speed);
   }
   
   for(Agent a: agents)
   {
       a.move();
   }
   
   for(Agent a: agents)
   {
       a.display();
   }
   
   fill(255,0,0);
   //beginShape();
     for(int i = 0; i<shape.size();i++)
     {
         //vertex(shape.get(i).x, shape.get(i).y);
         pushMatrix();
           translate(shape.get(i).x, shape.get(i).y, shape.get(i).z);
           ellipse(0,0, 10,10);
         popMatrix();
     }
   //endShape(CLOSE);
   
   if(capture)
   {
       saveFrame("images/#####.jpg");
   }
//   shape.get(0).x = width*0.5*(1+ 0.5*sin(frameCount/100.0));
//   shape.get(0).y = width*0.5*(1+ 0.5*cos(frameCount/100.0));
//   shape.get(1).x = width*0.5*(1+ 0.5*sin((frameCount/100.0)-PI*0.4));
//   shape.get(1).y = width*0.5*(1+ 0.5*cos((frameCount/100.0)-PI*0.4));
}
