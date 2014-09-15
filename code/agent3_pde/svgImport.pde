float scale = 2;
    
ArrayList<PVector> pointCloud(PShape p)
{
    ArrayList<PVector> ap = new ArrayList<PVector>();
    
    PGraphics pg = createGraphics(width, height);
    pg.beginDraw();
    pg.shape(p);
    pg.endDraw();
    
    pg.loadPixels();
    //println(pg.pixels);
   
    
    PVector centre =  new PVector(width*0.5, 0.5*height);
    int N = 0;
    for(int i = 0; i<pg.pixels.length; i+=spacer)
    {
        if(pg.pixels[i]==color(255,0,0))
        {  
            int eye = i%width;
            int jay = int(float(i)/width);
            PVector point = new PVector(scale*eye, abs(scale)*jay, 0);
            point.sub(centre);
            ap.add(point);
            
            //centroid.add(point);
            N++;
        }
        
        
        
        
        if(i%width==0)
        {
            i+=(width*spacer);
        }
        
    }
    
    println(centroid);
    //centroid.div(N);
    
    return ap;
    
}



