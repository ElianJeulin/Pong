/** largeur (ou diamètre) de la balle */
final int BALL_WIDTH = 10;
/** vitesse de déplacement de la balle */
final int BALL_SPEED = 3;
/** couleur de la balle */
final color BALL_COLOR = BLANC; 

// initialisation des scores
int score1=0;
int score2=0;

//initialisation de l'img de la balle et de la police
PFont font;
PImage imgBall;

//initialisation des positions des rochers
int xRocher1 = int(random(260, 320));
int xRocher2 = int(random(260, 320));
int yRocher1 = int(random(30, 150));
int yRocher2 = int(random(250, 360));

/**
* Cette fonction permet d'afficher les rochers
*/
void showRocher() {
  PImage imgRocher = loadImage("rocher.png");
  image(imgRocher, xRocher1, yRocher1);
  image(imgRocher, xRocher2, yRocher2);
}

/**
 * Une balle.
 */
class Ball {

  /** abscisse du centre de la balle */
  int x;

  /** ordonnée du centre de la balle */
  int y;

  /** mouvement sur l'axe des abscisses */
  int mvt_x;

  /** mouvement sur l'axe des ordonnées */
  int mvt_y;
}

/**
 * Initialisation d'une balle : tous les attributs prennent des valeurs par défaut.
 */
Ball initBall() {
  Ball ball = new Ball();
  ball.x = width/2;
  ball.y = height/2;
  ball.mvt_x = BALL_SPEED;
  ball.mvt_y = BALL_SPEED;
  return ball;
}

/**
 * Affichage de la balle
 */
void showBall(Ball b)
{
  imgBall = loadImage("ball.png");
  image(imgBall, b.x, b.y);
  point(ball);
}

/**
 * Déplacement de la balle
 */
void moveBall(Ball b)
{
  // Mouvement Horizontal
  b.x += b.mvt_x;
  if (collisionHorizontale(b, racket))
  {
    b.x -= b.mvt_x; // mouvement annulé
    b.mvt_x *= -1; // changement de direction
    if (b.mvt_x > 0) {
      b.mvt_x++;
    } else {
      b.mvt_x--;
    }
  }

  // Mouvement Vertical
  b.y += b.mvt_y;
  if (collisionVerticale(b))
  {
    b.y -= b.mvt_y; // mouvement annulé
    b.mvt_y *= -1; // changement de direction
  }
}

/**
 * Retourne vrai si la balle tape les rochers, les rackets.
 */
boolean collisionHorizontale(Ball b, Racket r)
{
  if (menu == 2) {  //Si menu = 2, il doit y avoir les collisions activées pour les 4 raquettes et le reste
    return (collision(b.x,b.y,BALL_WIDTH,BALL_WIDTH,r.x+600,positionY2,r.x,r.y) || (collision(b.x,b.y,BALL_WIDTH,BALL_WIDTH,r.x,positionY1,r.x,r.y)) 
    || (collision(b.x,b.y,BALL_WIDTH,BALL_WIDTH,xRocher1,yRocher1,25,25)) || (collision(b.x,b.y,BALL_WIDTH,BALL_WIDTH,xRocher2,yRocher2,25,25))
    || (collision(b.x,b.y,BALL_WIDTH,BALL_WIDTH,r.x+30,positionY3,r.x,r.y)) || (collision(b.x,b.y,BALL_WIDTH,BALL_WIDTH,r.x+570,positionY4,r.x,r.y)));
  } else {          // Sinon, il ne doit y avoir que les collisions pour 2 raquettes et le reste
    return (collision(b.x,b.y,BALL_WIDTH,BALL_WIDTH,r.x+600,positionY2,r.x,r.y) || (collision(b.x,b.y,BALL_WIDTH,BALL_WIDTH,r.x,positionY1,r.x,r.y)) 
    || (collision(b.x,b.y,BALL_WIDTH,BALL_WIDTH,xRocher1,yRocher1,25,25)) || (collision(b.x,b.y,BALL_WIDTH,BALL_WIDTH,xRocher2,yRocher2,25,25)));  
  }
}

/**
 * Retourne vrai si la balle tape les bords ou les rochers.
 */
boolean collisionVerticale(Ball b)
{
  return (b.y + BALL_WIDTH/2> height) || (b.y - BALL_WIDTH/2 < 0)
  || (collision(b.x,b.y,BALL_WIDTH,BALL_WIDTH,xRocher1,yRocher1,25,25)) || (collision(b.x,b.y,BALL_WIDTH,BALL_WIDTH,xRocher2,yRocher2,25,25));
}

/**
* Cette fonction permet de vérifier si il y a collision entre le teleporteur et la balle.
* @return     true si il y a collision
* @author     Jeulin
*/
boolean teleportation(Ball b) {
  return (collision(b.x,b.y,BALL_WIDTH,BALL_WIDTH,xPortal1,yPortal1,32,32)) || (collision(b.x,b.y,BALL_WIDTH,BALL_WIDTH,xPortal2,yPortal2,32,32)) 
  || (collision(b.x,b.y,BALL_WIDTH,BALL_WIDTH,xPortal3,yPortal3,32,32)) || (collision(b.x,b.y,BALL_WIDTH,BALL_WIDTH,xPortal4,yPortal4,32,32));
}

/**
* Cette fonction permet d'afficher le score, de le mettre à jour et de réinitialiser 
* la position et la vitesse de la balle si un point est marqué,
* mais aussi de se remettre sur le menu et tout réinitialiser si un score atteint 5.
* est appelé dans la fonction showBall.
* @param val  Class Ball
* @author     Jeulin
*/
void point(Ball b) {
  font = loadFont("Algerian-48.vlw");
  textFont(font, 48);
  text("score", 240, 40);
  text(score1, 255, 78);
  text(score2, 350, 78);
  if (b.x - BALL_WIDTH/2 > width) {
    b.x = width/2;
    b.y = height/2;
    b.mvt_x = BALL_SPEED;
    score1++;
  } else if (b.x + BALL_WIDTH/2 < 0) {
    b.x = width/2;
    b.y = height/2;
    b.mvt_x = BALL_SPEED;
    score2++;
  }
  if (score1 == 5 || score2 == 5) {
    menu = 1;
    score1 = 0;
    score2 = 0;
    value = 0;
    positionY1 = 180;
    positionY2 = 180;
    positionY3 = 180;
    positionY4 = 180;
  }
}
