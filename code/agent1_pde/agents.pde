float cycle = 5;
boolean drawV = false;


class Agent
{
    PVector p,v,a;
    float phase = random(TWO_PI);
    float thisCycle = cycle*(1+random(-0.1, 0.1));
    
    Agent()
    {
        p = new PVector(width/2, height/2);
        v = new PVector(random(-1,1), random(-1,1));
        //v.y=0;
    }
    
    void accel()
    {
    }
    
    void move()
    {
        p.add(v);
        //p.add(new PVector(random(-3,3), random(-3, 3)));
    }
    
    void display()
    {
        noFill();
        stroke(0);
        pushMatrix();
          translate(p.x, p.y);
          //line(0, -10, 0, 10);
          
//          pushMatrix();
//            scale(1+sin(frameCount/4), 1.0);
//            ellipse(20, 0, 40, 10);
//            ellipse(-20, 0, 40, 10);
//          popMatrix();
            float wlength = 10;
            float zwing = 0.5*wlength*(1+sin(phase-frameCount/thisCycle));
            float ztip = 0.5*wlength*(cos(phase-frameCount/thisCycle));
            
            
            bezier(0,0.5*ztip, ztip+wlength, -zwing, ztip+wlength, -zwing, 2*wlength+ztip, -ztip);
            bezier(0,0.5*ztip, -ztip-wlength, -zwing, -ztip-wlength, -zwing, -2*wlength-ztip, -ztip);
            
            if(drawV)
            {
                line(0,0,v.x*100, v.y*100);
                
            }
        popMatrix();
        v.y+=0.01*(1/thisCycle)*sin(phase-frameCount/thisCycle);
    }
}
