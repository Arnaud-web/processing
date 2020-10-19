import java.awt.*; //<>// //<>//
import java.awt.event.*;
import javax.swing.*;
import javax.swing.event.*;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.UIManager.*;
import java.awt.Color;
import java.awt.Graphics;
import java.applet.*;
float[][] kernel = {{ -1, -1, -1}, 
                    { -1,  9, -1}, 
                    { -1, -1, -1}};
                      float v = 1.0 / 9.0;
                      float[][] ker = {{ v, v, v }, 
                                          { v, v, v }, 
                                          { v, v, v }}; 
                                          
 float[][] kero;
int x,y;int xi = 10;
int SB;color t ;
PImage img,buff;
int w,h;
float _r,_g,_b,_bn;
String path;
int wanted;
int startx,starty,endx,endy;
boolean seg = false;
boolean cont = false;
boolean eg = false;
boolean effet = false;
boolean egg = false;
MyPanel panel;

int sB,sR,sG,sBN;
int valB, valBN,valG,valR;
PImage r;
void setup()
{
  
  size(740,640);
  background(0);
  try{
    for(LookAndFeelInfo info : UIManager.getInstalledLookAndFeels()){
      println(info.getName());
      if("Nimbus".equals(info.getName())){
        UIManager.setLookAndFeel(info.getName());
        break;
      }
    }
  }catch(Exception e){};
  JFrame frame = new JFrame ("Tools");
  frame.setDefaultCloseOperation (JFrame.EXIT_ON_CLOSE);
  panel = new MyPanel();

  frame.getContentPane().add (panel);
 // frame.getContentPane().add (paneli);
 //paneli.setBounds(200, 400, 200, 200);
 // panel.setBounds(0, 0, 200, 200);
 
  frame.pack();
  frame.setVisible (true);
  path = "wallpaper.png";
   //path = "moi.png";
 
  loadImg(path);
  startx = (width - img.width)/2;
  endx = width-startx;
  starty = 0;
  endy = img.height;
}

void draw()
{
  if ((egg)) {go();println("go ok ");}
  
}

void listenControl()
{
  for (int x = startx;x < endx; x++) {
            for (int y =starty; y < endy; y++ ) {
              int loc = x + width*y;
      // Make sure we haven't walked off our image, we could do better here
              loc = constrain(loc,startx,width*endy);
               
              // Calculate the convolution
              _r = (red(buff.pixels[loc]));
              
              _g = (green(buff.pixels[loc]));
              _b = (blue(buff.pixels[loc]));
            //int   sR = panel.jsliderR.getValue();
              
            //  sR = int(map(sR,0,100,-255,255));
              valR=sR;
              _r += sR;
            //int   sG = panel.jsliderG.getValue();
            
            //  sG = int(map(sG,0,100,-255,255));
              valG=sG;
              _g += sG;
              
           
            SB = 0;
              valB=sB;
              _b += sB;
          
              
            
              //int sBN = panel.jsliderBN.getValue();
              //sBN = int(map(sBN,0,100,-255,255));
              valBN= sBN;
              _r += sBN;
              _g += sBN;
              _b += sBN;
              _r = constrain(_r,0,255);
              _g = constrain(_g,0,255);
              _b = constrain(_b,0,255);
              
              color c = color(_r,_g,_b);
              if(seg) c = segmentation(c);
              if(cont) c = convolution(x,y,kernel,3,buff);
              if(effet) c = convolution(x,y,kernel,2,buff);
               if(eg) c = convolution(x,y,kernel,3,buff);
               
             
              pixels[loc] = c;
             
               panel.labelvalB.setText("B : "+sB);  
                panel.labelvalR.setText("R : "+sR);
                 panel.labelvalG.setText("G : "+sG);
                 
            }
        }
        println("SB-->"+sR);
        println("-->"+valR);
        panel.textFieldBN.setText(""+valBN);
        panel.textFieldB.setText(""+valB);
        panel.textFieldR.setText(""+valR);
        panel.textFieldG.setText(""+valG);
        updatePixels();
          
        
      
         
 
       
}

color convolution(int x, int y, float[][] matrix, int matrixsize, PImage img)
{
  float rtotal = 0.0;
  float gtotal = 0.0;
  float btotal = 0.0;
  int offset = matrixsize / 2;
  for (int i = 0; i < matrixsize; i++){
    for (int j= 0; j < matrixsize; j++){
      // What pixel are we testing
      int xloc = x+i-offset;
      int yloc = y+j-offset;
      int loc = xloc + img.width*yloc;
      // Make sure we haven't walked off our image, we could do better here
      loc = constrain(loc,0,img.pixels.length-1);
      // Calculate the convolution
       xi = panel.jsliderBN.getValue();
          xi = int(map(sBN,0,100,-10,10));
          if ((cont)||(effet)){
      rtotal += (red(img.pixels[loc]) * matrix[i][j])+xi+sR;
      gtotal += (green(img.pixels[loc]) * matrix[i][j])+xi+sG;
      btotal += (blue(img.pixels[loc]) * matrix[i][j])+xi+sB;
          }
          if (eg)
          {
                 rtotal += (red(img.pixels[loc]) * matrix[i][j])+xi;
    
          }
 
      
      
      
      
    }
  }
  // Make sure RGB is within range
  rtotal = constrain(rtotal, 0, 255);
  gtotal = constrain(gtotal, 0, 255);
  btotal = constrain(btotal, 0, 255);
  // Return the resulting color
   //= color(rtotal, gtotal, btotal);
   if((cont)||(effet)) {t = color(rtotal, gtotal, btotal);}
   if((eg)){t= color(rtotal);}
  
  return t;
  

 
 
}
float rr=0;
color segmentation(color c)
{
  int val = 4;
  int offset = 256/val;
  float r = red(c);
  float g = green(c);
  float b = blue(c);
  for(int i=1;i<=val;i++)
  {
    if(r<offset*i && r>=offset*(i-1)) r=((offset*i)-(offset*(i-1)))/2+offset*(i-1);
    if(g<offset*i && g>=offset*(i-1)) g=((offset*i)-(offset*(i-1)))/2+offset*(i-1);
    if(b<offset*i && b>=offset*(i-1)) b=((offset*i)-(offset*(i-1)))/2+offset*(i-1);
  }
  
  color d = color(r,g,b);
  return d;
 
}


void loadImg(String path)
      {
        img = loadImage(path);
        r = loadImage(path);;
        fill(0);
        rect(0,0,width,height);
        w = img.width; //<>//
        h = img.height;
        while(w>640 || h>640)
        {  
          if(w>640)
          {
            img.resize(640,h*640/w);
          }
          if(h>640)
          {
            img.resize(w*640/h,640);
          }
          w = img.width;
          h = img.height;
        }
        image(img,(width-w)/2,0);
       
        loadPixels();
        buff = get();
        
  } //<>//
  
void  go() {
 if (eg){img = r; xi = panel.jsliderBN.getValue();
          xi = int(map(sBN,0,100,-10,10));}
        fill(0);
        rect(0,0,width,height);
        w = img.width;
        h = img.height;
        while(w>640 || h>640)
        {  
          if(w>640)
          {
            img.resize(640,h*640/w);
          }
          if(h>640)
          {
            img.resize(w*640/h,640);
          }
          w = img.width;
          h = img.height;
        }
  //image(img, 0, 0); // Displays the image from point (0,0) 
  img.loadPixels();
  // Create an opaque image of the same size as the original
  PImage edgeImg = createImage(img.width, img.height, RGB);
  // Loop through every pixel in the image.
  for (int y = 1; y < img.height-1; y++) { // Skip top and bottom edges
    for (int x = 1; x < img.width-1; x++) { // Skip left and right edges
      float sum = 0; // Kernel sum for this pixel
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          // Calculate the adjacent pixel for this kernel point
          int pos = (y + ky)*img.width + (x + kx);
          // Image is grayscale, red/green/blue are identical
          float val = red(img.pixels[pos]);
          // Multiply adjacent pixels based on the kernel values
          
          sum += kernel[ky+1][kx+1] * val+xi;
        }
      }
      // For this pixel in the new image, set the gray value
      // based on the sum from the kernel
      edgeImg.pixels[y*img.width + x] = color(sum,sum,sum);
      
    }
  }
  // State that there are changes to edgeImg.pixels[]
  edgeImg.updatePixels();
 //color d = color (sum, sum, sum);
  //if (eg)
  image(edgeImg,(width-w)/2,0);
  
   // Draw the new image
  img = edgeImg;
  image(edgeImg,(width-w)/2,0);
}


      
