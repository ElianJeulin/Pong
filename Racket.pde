/** largeur d'une raquette */ //<>//
final int RACKET_WIDTH  = 10;
/** hauteur d'une raquette */
final int RACKET_HEIGHT = 40;
/** vitesse de déplacement vertical d'une raquette */
final int RACKET_SPEED  = 7;
/** distance du bord de la fenêtre pour la raquette */
final int BORDER_SPACE  = 20;
final color RACKET_COLOR1 = BLEU;
final color RACKET_COLOR2 = VERT;

// Position initiale des raquettes
int positionY1 = 180;
int positionY2 = 180;
int positionY3 = 180;
int positionY4 = 180;

// Initialisation des sprites des raquettes
PImage imgRacket1;
PImage imgRacket2;

/**
 * Une raquette.
 */
class Racket {
  int x;
  int y;
  int mvt_x;
  int mvt_y;
}

/**
 * Cette fonction permet d'initialiser les raquettes
 */
Racket initRacket() {
  Racket racket = new Racket();
  racket.x = RACKET_WIDTH;
  racket.y = RACKET_HEIGHT;
  racket.mvt_x = RACKET_SPEED;
  racket.mvt_y = RACKET_SPEED;
  return racket;
}

/**
 * Ces fonctions permettent de montrer les raquettes dans l'interface graphique
 * @param val  Class Racket
 * @author     Jeulin
 */
void showRacket1(Racket r)
{
  imgRacket1 = loadImage("player01.png");
  image(imgRacket1, r.x, positionY1);
}

void showRacket2(Racket r)
{
  imgRacket2 = loadImage("player02.png");
  image(imgRacket2, r.x+600, positionY2);
}

void showRacket3(Racket r)
{
  image(imgRacket1, r.x+30, positionY3);
}

void showRacket4(Racket r)
{
  image(imgRacket2, r.x+570, positionY4);
}


/**
* Cette fonction permet de gérer les gestions aux claviers et 
* donc de faire bouger les raquettes en fonction de la touche où on appuie.
* @author     Jeulin
*/
void gestionClavierDepuisDraw() {
  if (keyPressed) {
    switch (key) {
    case 'z': 
      if (positionY1>0) {
        positionY1 -= 5;
      }
      break;
    case 's':
      if (positionY1<height-43) {
        positionY1 += 5;
      }
      break;
    case 'o':
      if (positionY2>0) {
        positionY2 -= 5;
      }
      break;
    case 'l':
      if (positionY2<height-43) {
        positionY2 += 5;
      }
      break;
    case 'f':
      if (positionY3>0) {
        positionY3 -= 5;
      }
      break;
    case 'v':
      if (positionY3<height-43) {
        positionY3 += 5;
      }
      break;
    case 'j':
      if (positionY4>0) {
        positionY4 -= 5;
      }
      break;
    case 'n':
      if (positionY4<height-43) {
        positionY4 += 5;
      }
      break;
    default :
      println("erreur");
      break;
    }
  }
}   
