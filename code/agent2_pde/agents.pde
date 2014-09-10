float cycle = 5;
boolean drawV = false;

float startR = 100;


float friendWeight = 0.2;
float friendRadius = 300;
float personalSpace = 150;
float friendView = PI*0.3;

float centreWeight = 0.0;

float obstacleWeight = -0.1;
float obstacleRadius = 2500;

class Agent
{
    PVector p,v,a;
    float phase = random(TWO_PI);
    float thisCycle = cycle*(1+random(-0.1, 0.1));
    
    Agent()
    {
        p = new PVector(width/2, 3*height/4);
        
        float theta = random(TWO_PI);
        p = new PVector(random(-startR, startR), random(-startR, startR), random(-startR, startR));
        p = new PVector(-width, -height, -height);
        v = new PVector(sin(theta), cos(theta), random(5));
        //v = new PVector(random(-1,1),random(-1,1), random(-1,1));
        //v = new PVector(0,0, random(5));
        //v.div(5);
        //v = new PVector(1, 0, 1);
        //v.x=1;
        //v.y=0;
    }
    
    void accel(ArrayList<Agent> as)
    {
      
        //curently tons of race errors here
        for(Agent ag:as)
        {
            if(ag!=this)
            { 
                PVector diff = PVector.sub(ag.p, p);
                if(abs(PVector.angleBetween(diff,v))<friendView)
                {
                    
                    float dist = diff.mag();
                    PVector direction = v.get();
                    if(dist<friendRadius)
                    {
                        diff.normalize();
                        direction.normalize();
                        
                        //correct movement vs direction of object
                        PVector correct = PVector.sub(diff, direction);
                        correct.mult(friendWeight);
                        //correct.mult(100/dist);
                        
                        if(dist<personalSpace) correct.mult(-1);
                        v.add(correct);
                        
                        //match speed
                        PVector match = PVector.sub(ag.v.get(), v.get());
                        //match.normalize();
                        match.mult(0);
                        v.add(match);
                    }
                    //centre on zero
                    PVector centre = p.get();
                    centre.normalize();
                    PVector cCorrect = PVector.sub(centre, direction);
                    cCorrect.mult(centreWeight);
                    v.sub(cCorrect);
                }
            }
        }
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
          translate(p.x, p.y, p.z);
          //line(0, -10, 0, 10);
          
//          pushMatrix();
//            scale(1+sin(frameCount/4), 1.0);
//            ellipse(20, 0, 40, 10);
//            ellipse(-20, 0, 40, 10);
//          popMatrix();
            float wlength = 10;
            float zwing = 0.5*wlength*(1+sin(phase-frameCount/thisCycle));
            float ztip = 0.5*wlength*(cos(phase-frameCount/thisCycle));
            
            //bird
//            bezier(0,0.5*ztip, ztip+wlength, -zwing, ztip+wlength, -zwing, 2*wlength+ztip, -ztip);
//            bezier(0,0.5*ztip, -ztip-wlength, -zwing, -ztip-wlength, -zwing, -2*wlength-ztip, -ztip);
//            
            fill(0);
            //bat
            beginShape();
              vertex(0,0.5*ztip);
              bezierVertex(ztip+wlength, -zwing, ztip+wlength, -zwing, 2*wlength+ztip, -ztip);
              bezierVertex(-ztip+wlength, zwing, -ztip+wlength, zwing, 0, wlength+ztip);
            endShape(CLOSE);
            
            scale(-1,1);
            beginShape();
              vertex(0,0.5*ztip);
              bezierVertex(ztip+wlength, -zwing, ztip+wlength, -zwing, 2*wlength+ztip, -ztip);
              bezierVertex(-ztip+wlength, zwing, -ztip+wlength, zwing, 0, wlength+ztip);
            endShape(CLOSE);
            
            if(drawV)
            {
                line(0,0,v.x*100, v.y*100);
                
            }
        popMatrix();
        v.y+=0.01*(1/thisCycle)*sin(phase-frameCount/thisCycle);
    }
}
