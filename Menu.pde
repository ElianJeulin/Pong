/**
 * Cette fonction permet de d'afficher le menu avec les boutons
 * et propose différents affichages selon value
 * @author     Jeulin
 */

void menu() {
  img = loadImage("fond.jpg");
  background(img);
  PImage imgButton = loadImage("button.png");
  PImage imgButton2 = loadImage("button2.png");
  PImage imgLassaleContent = loadImage("jeanLassaleContent.png");
  PImage imgLassalePasContent = loadImage("jeanLassalePasContent.png");
  if (value == 1) {
    copy(imgButton, 200, 100, 150, 100, 80, 70, 200, 150);
    copy(imgButton, 0, 0, 150, 100, 80, 245, 200, 150);
    copy(imgButton2, 0, 100, 150, 100, 360, 70, 200, 150);
    image(imgLassalePasContent, 380, 200);
  }
  if (value == 2) {
    copy(imgButton, 200, 0, 150, 100, 80, 245, 200, 150);
    copy(imgButton, 0, 100, 150, 100, 80, 70, 200, 150);
    copy(imgButton2, 0, 100, 150, 100, 360, 70, 200, 150);
    image(imgLassalePasContent, 380, 200);
  }
  if (value == 3) {
    copy(imgButton2, 200, 100, 150, 100, 360, 70, 200, 150);
    copy(imgButton, 0, 100, 150, 100, 80, 70, 200, 150);
    copy(imgButton, 0, 0, 150, 100, 80, 245, 200, 150);
    image(imgLassalePasContent, 380, 200);
  } 
  if (value == 0) {   
    copy(imgButton, 0, 100, 150, 100, 80, 70, 200, 150);
    copy(imgButton, 0, 0, 150, 100, 80, 245, 200, 150);
    copy(imgButton2, 0, 100, 150, 100, 360, 70, 200, 150);
    image(imgLassalePasContent, 380, 200);
  }
  if (value == 4) {   
    copy(imgButton, 0, 100, 150, 100, 80, 70, 200, 150);
    copy(imgButton, 0, 0, 150, 100, 80, 245, 200, 150);
    copy(imgButton2, 0, 100, 150, 100, 360, 70, 200, 150);
    image(imgLassaleContent, 380, 200);
  }
}
