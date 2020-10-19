
import java.awt.event.ActionEvent;

class MyPanel extends JPanel {
  /**
   * 
   */

   
   
  public JSlider jsliderB;
  public JSlider jsliderG;
  public JSlider jsliderBN;
  public JCheckBox JContour;
  private JLabel labelR;
  private JLabel labelG;
  private JLabel labelB;
  private JLabel lableBlack;
  private JLabel labelN;
  public JCheckBox JEffect;
   public JCheckBox egde;
   public JCheckBox effetpro;
   public JCheckBox noirBlanc;
  public JSlider jsliderR;
  private JButton openButton;
  
  public Clock clock;

 private JLabel labelBB;
  private JLabel labelBBB;
   private JLabel labellum;
   private JLabel labelcol;
    public JLabel labelvalB;
    public JLabel labelvalG;
    public JLabel labelvalR;
    public JTextField textFieldBN;
  private static final long serialVersionUID = 1L;
  
  public JTextField textFieldB;
  public JTextField textFieldG;
  public JTextField textFieldR;

  Image image;
 
  public MyPanel() {
    //construct components
      clock = new Clock();
      
      jsliderB = new JSlider (0, 100);
      jsliderR = new JSlider (0, 100);
      jsliderG = new JSlider (0, 100);
      jsliderBN = new JSlider (0, 100);
      JEffect = new JCheckBox ("Segmentation");
      JContour = new JCheckBox ("Contour");
      egde = new JCheckBox("Egde");
      effetpro = new JCheckBox("Effet");
      noirBlanc = new JCheckBox("Noire Blanc");
      labelR = new JLabel ("R");
      labelG = new JLabel ("G");
      labelB = new JLabel ("B");
      lableBlack = new JLabel ("B");
      labelN = new JLabel ("N");
     
      labelBB = new JLabel ("255");
      labelBBB = new JLabel ("-255");
      labellum = new JLabel ("Luminosité : ");
      labelcol = new JLabel ("Couleur : ");
     
      labelvalB = new JLabel( " B : 0 ");
       labelvalG = new JLabel( " G : 0 ");
        labelvalR = new JLabel(" R : 0 ");
   
     textFieldBN = new JTextField("Edit Me ");
    //textFieldBN.setPreferredSize (new Dimension (40,30) );
    JButton btnNew = new JButton("OK");
    
     JButton btnNewB = new JButton("B : ");
      textFieldB = new JTextField("0 ");
      
      JButton btnNewG = new JButton("G : ");
      textFieldG = new JTextField("0 ");
     
      JButton btnNewR = new JButton("R : ");
      btnNewR.setForeground(Color.red);
      btnNewG.setForeground(Color.green);
      btnNewB.setForeground(Color.blue);
      jsliderB.setBackground(Color.blue);
      jsliderG.setBackground(Color.green);
      jsliderR.setBackground(Color.red);
      //btnNewR.setBackground(Color.RED);
      //labelvalR.setForeground(Color.GREEN);
       setBackground( Color.lightGray);
      JButton btnNewReini = new JButton("Reini ");
      textFieldR = new JTextField("0 ");
     //setBackground( Color. ) ;
     
      btnNewReini.addActionListener(new ActionListener() {
        public void actionPerformed(ActionEvent arg0) {
          //edge();
        
         int  x = 0;
        
        panel.jsliderR.setValue(50);
        panel.jsliderB.setValue(50);
        panel.jsliderG.setValue(50);
        panel.jsliderBN.setValue(50);
        sBN=x;
        sG=x;
        sB=x;
        sR=x;
        listenControl();
              }
      });
    
      btnNew.addActionListener(new ActionListener() {
        public void actionPerformed(ActionEvent arg0) {
       String q = panel.textFieldBN.getText();
         int  qq = Integer.parseInt(q);
        int x = int(map(qq,-255,255,0,100));
        panel.jsliderBN.setValue(x);
        if ((qq<=-255))qq=-255;if((qq>=255)) qq=255;
        
        sBN=qq;
        listenControl();
        ;        }
      });
      
      btnNewB.addActionListener(new ActionListener() {
        public void actionPerformed(ActionEvent arg0) {
        String q = panel.textFieldB.getText();
         int  qq = Integer.parseInt(q);
        int x = int(map(qq,-255,255,0,100));
        panel.jsliderB.setValue(x);
        if ((qq<=-255))qq=-255;if((qq>=255)) qq=255;
        
        sB=qq;
        listenControl();
        
               }
      });
  
    btnNewR.addActionListener(new ActionListener() {
        public void actionPerformed(ActionEvent arg0) {
        String q = panel.textFieldR.getText();
         int  qq = Integer.parseInt(q);
        int x = int(map(qq,-255,255,0,100));
        panel.jsliderR.setValue(x);
        if ((qq<=-255))qq=-255;if((qq>=255)) qq=255;
        
        sR=qq;
        listenControl();
              }
      });
      
        btnNewG.addActionListener(new ActionListener() {
        public void actionPerformed(ActionEvent arg0) {
         String q = panel.textFieldG.getText();
         int  qq = Integer.parseInt(q);
        int x = int(map(qq,-255,255,0,100));
        panel.jsliderG.setValue(x);
        if ((qq<=-255))qq=-255;if((qq>=255)) qq=255;
        
        sG=qq;
        listenControl();
               }
      });
  
    
   
      
      
      JEffect.addActionListener(new ActionListener() {
        public void actionPerformed(ActionEvent arg0) {
          if(JEffect.isSelected()) {
            seg = true;
          }else seg = false;
          listenControl();
        }
      });
      JContour.addActionListener(new ActionListener() {
        public void actionPerformed(ActionEvent arg0) {
          if(JContour.isSelected()) {
            cont = true;
          }else cont = false;
          listenControl();
        }
      });
      effetpro.addActionListener(new ActionListener() {
        public void actionPerformed(ActionEvent arg0) {
          if(effetpro.isSelected()) {
            effet = true;
          }else effet = false;
          listenControl();
        }
      });
      
      noirBlanc.addActionListener(new ActionListener() {
        public void actionPerformed(ActionEvent arg0) {

          if(noirBlanc.isSelected()) {
            eg = true; 
           
          }
          else eg = false;//img = loadImage(path);
          listenControl();
        }
      });
      
        egde.addActionListener(new ActionListener() {
        public void actionPerformed(ActionEvent arg0) {
          if(egde.isSelected()) {
            egg = true;
          }else egg = false;
          listenControl();
        }
      });
      
      jsliderR.addChangeListener(new ChangeListener() {
        public void stateChanged(ChangeEvent arg0) {
         // System.out.println(jsliderR.getValue());
          sR = panel.jsliderR.getValue();
          sR = int(map(sR,0,100,-255,255));
          listenControl();
      }});
      jsliderG.addChangeListener(new ChangeListener() {
        public void stateChanged(ChangeEvent arg0) {
         // System.out.println(jsliderG.getValue());
          sG = panel.jsliderG.getValue();
          sG = int(map(sG,0,100,-255,255));
          listenControl();
        }
      });
      jsliderB.addChangeListener(new ChangeListener() {
        public void stateChanged(ChangeEvent arg0) {
          //System.out.println(jsliderB.getValue());
          sB = panel.jsliderB.getValue();
          sB = int(map(sB,0,100,-255,255));
          listenControl();
         
          
        }
      });
      jsliderBN.addChangeListener(new ChangeListener() {
        public void stateChanged(ChangeEvent arg0) {
         // System.out.println(jsliderBN.getValue());
          sBN = panel.jsliderBN.getValue();
          sBN = int(map(sBN,0,100,-255,255));
          listenControl();
        }
      });

      //set components properties
      jsliderB.setOrientation (JSlider.VERTICAL);
      jsliderB.setMinorTickSpacing (1);
      jsliderB.setMajorTickSpacing (5);
      jsliderB.setPaintTicks (false);
      jsliderB.setPaintLabels (false);
      jsliderR.setOrientation (JSlider.VERTICAL);
      jsliderR.setMinorTickSpacing (10);
      jsliderR.setMajorTickSpacing (50);
      jsliderR.setPaintTicks (false);
      jsliderR.setPaintLabels (false);
      jsliderG.setOrientation (JSlider.VERTICAL);
      jsliderG.setMinorTickSpacing (1);
      jsliderG.setMajorTickSpacing (5);
      jsliderG.setPaintTicks (false);
      jsliderG.setPaintLabels (false);
      jsliderBN.setOrientation (JSlider.HORIZONTAL);
      jsliderBN.setMinorTickSpacing (10);
      jsliderBN.setMajorTickSpacing (50);
      jsliderBN.setPaintTicks (false);
      jsliderBN.setPaintLabels (false);

      //adjust size and set layout
      setPreferredSize (new Dimension (360, 700));
      setLayout (null);

      //add components
      add (jsliderB);
      add (jsliderR);
      add (jsliderG);
      add (jsliderBN);
      add (JEffect);
      add (JContour);
      add (labelR);
      add (labelG);
      add (labelB);
      add (lableBlack);
      add (labelN);
      
      add (labelBB);
      add (labelBBB);
       add (labellum);
       add (labelcol);
     
       add (labelvalB);
       add (labelvalG);
       add (labelvalR);
       add (textFieldBN);
       add (btnNew);
       
       add (textFieldB);
       add (btnNewB);
       
       add (textFieldG);
       add (btnNewG);
       
       add (textFieldR);
       add (btnNewR);
       add(btnNewReini);
       add(clock);
       add(egde);
       add(noirBlanc);
       add(effetpro);
       
int s = 50;     
int a = 130;
int b = 100+s;
      //set component bounds (only needed by Absolute Positioning)
    
      jsliderR.setBounds (10+a, 16+b, 16, 125);
      jsliderG.setBounds (70+a, 16+b, 16, 125);
      jsliderB.setBounds (130+a, 16+b, 16, 125);
      jsliderBN.setBounds (10+a, 30+s, 150, 16);
     
      
      labelBB.setBounds (a-15, b+10, 200, 25);
      labelBBB.setBounds (a-20, 120+b, 200, 25);
      
      labelvalR.setBounds (a-15, 150+b, 200, 25);
      labelvalG.setBounds (190, 150+b, 200, 25);
      labelvalB.setBounds (130 +a, 150+b, 200, 25);
      
       labelR.setBounds (30+a, 16+b, 20, 25);
      labelG.setBounds (90+a, 16+b, 20, 25);
      labelB.setBounds (150+a, 16+b, 10, 25);
     
      
     labellum.setBounds (10, 30+s, 100, 25);
      labelcol.setBounds (10, 16+b, 90, 25);
      
       lableBlack.setBounds (270, 10+s, 20, 25);
      labelN.setBounds (140, 10+s, 20, 25);
      
      noirBlanc.setBounds (a-120, 3  , 100, 25);
       egde.setBounds (a-10, 3  , 120, 25);
        effetpro.setBounds (250, 3  , 70, 25);
      JContour.setBounds (a-120, 80  -s, 100, 25);
      JEffect.setBounds (a-10, 80  -s, 120, 25);
      btnNewReini.setBounds (250 , 80 -s, 70, 25);
      
      textFieldBN.setBounds(a+90, 170-s, 70, 25);
      btnNew.setBounds(a+20, 170-s, 70, 25);
      
      textFieldR.setBounds(a+90, 300+s, 70, 25);
      btnNewR.setBounds(a+20, 300+s, 70, 25);
      
      textFieldG.setBounds(a+90, 330+s, 70, 25);
      btnNewG.setBounds(a+20, 330+s, 70, 25);
      
      textFieldB.setBounds(a+90, 360+s, 70, 25);
      btnNewB.setBounds(a+20, 360+s, 70, 25);
      clock.setBounds(90, 400+s, 200, 200);
  }
 

    
  }
  
