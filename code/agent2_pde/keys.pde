void keyPressed()
{
    if(key=='r') setup();
    if(keyCode==LEFT) theta-=0.1;
    if(keyCode==RIGHT) theta+=0.1;
    if(keyCode==UP) camRad-=50;
    if(keyCode==DOWN) camRad+=50;
}
