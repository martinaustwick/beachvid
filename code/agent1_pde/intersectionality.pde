PVector intersect(PVector x0, PVector x1, PVector p, PVector v)
{
    float xs = 0;
    float ys = 0;
    if(!(x1.x-x0.x==0))
    {
        float m = (x1.y - x0.y)/(x1.x-x0.x);
        float c = x0.y - (x0.x*m);
        float mv = v.y/v.x;
        
         xs = (p.y-(p.x*mv)-c)/(m-mv);
         ys = (m*xs)+c;
        if(xs>=x0.x && xs<=x1.x && (xs-p.x)/v.x>0)
       {
        // ellipse(xs,ys,5,5);
       }
        else{
          xs = 0;
          ys = 0;
        }
        
    }
    else
    {
        xs = x0.x;
        ys = p.y + (v.y/v.x)*(xs-p.x);
        if(ys>0) println(ys);
        if(ys>=x0.y && ys<=x1.y) ellipse(xs,ys,5,5);
    }
    
    return new PVector(xs, ys);
}
