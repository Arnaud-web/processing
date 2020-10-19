import java.awt.*;

import java.awt.Graphics;
import java.applet.*;


class Clock extends Applet {

Image uneImage;
void paint ()
{
  repaint();
}

public void init( ) {
//lightGray
this.setBackground(Color.lightGray); 
println("OK back ground ");
uneImage = getImage(this.getCodeBase( ),path);

//this.setSize(200,200);


} 
// Déssinement de l'applet
public void paint(Graphics g ) {
  println("OK back graph ");
  
  
if(uneImage != null)
g.drawImage(uneImage,5,20,this);
g.drawString(" OK "+sR, 6, 20);
g.setColor(Color.red);
g.drawString("Photo "+path, 6, 50);



}

}
