// Constantes - Couleurs //<>// //<>//

final color NOIR = color(0);
final color BLANC = color(255);
final color ROUGE = color(255, 0, 0);
final color VERT = color(0, 255, 0);
final color BLEU = color(0, 0, 255);

/** Valeur du menu (1=menu d'accueil), chargement de l'img de fond et value equivaut à la valeur permettant de changer
l'affichage du menu quand on passe dessus avec sa souris. */
int menu = 1;
int value = 0;
PImage img;

// Etat du jeu

/** Gestion de la pause */
boolean enPause = false;

/** La balle */
Ball ball;
Racket racket;

/**
 * Fonction d'initialisation Processing.
 */
void setup()
{
  size(640, 400);

  // on initialise nos objets
  ball = initBall();
  racket = initRacket();
}

/**
 * Fonction de rafraichissement Processing.
 * Selon la valeur de menu, draw affiche quelque chose de différents
 * Pour menu = 1, il affiche le menu de démarrage
 * Pour menu = 0, il affiche le début d'une partie à 2 joueurs
 * Pour menu = 2, il affiche le début d'une partie à 4 joueurs
 */
void draw()
{
  if (menu == 1) {
    menu();
  } else if (menu == 0) {
    img = loadImage("fond.jpg");
    background(img);
    showBall(ball); 
    moveBall(ball);
    showRacket1(racket);
    showRacket2(racket);
    showRocher();
    gestionClavierDepuisDraw();
    portailTeleport();
  } else if (menu == 2) {
    img = loadImage("fond.jpg");
    background(img);
    showBall(ball); 
    moveBall(ball);
    showRacket1(racket);
    showRacket2(racket);
    showRacket3(racket);
    showRacket4(racket);
    showRocher();
    gestionClavierDepuisDraw();
    portailTeleport();
  }
}

/**
 * Cette fonction permet de quand on clique sur un bouton du menu alors
 * la valeur de menu est changée et donc change l'affichage dans la boucle draw()
 * @author     Jeulin
 */
void mousePressed() {
  int x = mouseX;
  int y = mouseY;
  while (menu == 1) {
    if (x >= 80 && x < 280 && y >= 70 && y<160) {
      menu = 0;
    } else if (x >= 80 && x < 280 && y >= 245 && y<335) {
      menu = 2;
      exit();
    } else if ( x >= 360 && x < 560 && y >= 70 && y < 160) {
      menu = 2;
    } else {
      break;
    }
  }
}

/**
 * Cette fonction permet de quand la souris se trouve sur
 * la position d'un bouton alors elle affiche le bouton en jaune en changeant la valeur de value.
 * @author     Jeulin
 */
void mouseMoved() {
  if (mouseX >= 80 && mouseX < 280 && mouseY >= 70 && mouseY < 160) {
    value = 1;
  } 
  else if (mouseX >= 80 && mouseX < 280 && mouseY >= 245 && mouseY < 335) {
    value = 2;
  } 
  else if (mouseX >= 360 && mouseX < 560 && mouseY >= 70 && mouseY < 160) {
    value = 3;
  }
  else if (mouseX >= 380 && mouseX < 540 && mouseY >= 200 && mouseY < 360) {
    value = 4;
  } else {
    value = 0;
  }
}

/**
 * Cette fonction gère la pause et le redemarrage dans le jeu.
 * @author     Jeulin
 */
void keyPressed() {
  if (key == ' ' && enPause == false) {
    noLoop();
    enPause = true;
  } else if (key == ' ' && enPause == true) {
    loop();
    enPause = false;
  } 
}
