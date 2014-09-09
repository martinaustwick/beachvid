ArrayList<Agent> agents;
ArrayList<PVector> shape;
float speed =5; 
void setup()
{
    size(1000, 1000);
    agents = new ArrayList<Agent>();
    
    for(int i = 0; i<100; i++)
    {
      agents.add(new Agent());
    }
    
    shape = new ArrayList<PVector>();
    shape.add(new PVector(width/4, height/4));
    shape.add(new PVector(width/2, 3*height/4));
    shape.add(new PVector(3*width/4, height/4));
}

void draw()
{
   background(255);
   
   for(Agent a: agents)
   {
       for(int i = 1; i<shape.size(); i++)
       {
           PVector inter = intersect(shape.get(i-1), shape.get(i), a.p, a.v);
           if(PVector.dist(inter, a.p)<50)
           {
               PVector deflect = PVector.sub(a.p, inter);
               deflect.normalize();
               //deflect.mult(0.5);
               a.v.add(deflect);
               a.v.normalize();
               //a.v.mult(speed);
           }
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
   
   for(int i = 1; i<shape.size();i++)
   {
       line(shape.get(i-1).x, shape.get(i-1).y, shape.get(i).x, shape.get(i).y);
   }
   
//   shape.get(0).x = width*0.5*(1+ 0.5*sin(frameCount/100.0));
//   shape.get(0).y = width*0.5*(1+ 0.5*cos(frameCount/100.0));
//   shape.get(1).x = width*0.5*(1+ 0.5*sin((frameCount/100.0)-PI*0.4));
//   shape.get(1).y = width*0.5*(1+ 0.5*cos((frameCount/100.0)-PI*0.4));
}
