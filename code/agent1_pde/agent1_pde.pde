ArrayList<Agent> agents;


void setup()
{
    size(1000, 1000);
    agents = new ArrayList<Agent>();
    
    for(int i = 0; i<30; i++)
    {
      agents.add(new Agent());
    }
}

void draw()
{
   background(255);
   
   for(Agent a: agents)
   {
       a.move();
   }
   
   for(Agent a: agents)
   {
       a.display();
   }
}
