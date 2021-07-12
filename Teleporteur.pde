//Position des teleporteurs
int xPortal1 = int(random(80,250)) ;
int xPortal3 = int(random(80,250)) ;
int xPortal2 = int(random(350, 520));
int xPortal4 = int(random(350, 520));
int yPortal1 = int(random(20, 160));
int yPortal2 = int(random(20, 160));
int yPortal3 = int(random(210, 350));
int yPortal4 = int(random(210, 350));

/**
* Cette fonction permet d'afficher les teleporteurs mais aussi de les 
* utiliser. Quand il y a collision entre la balle et le teleporteur
* on tire un entier aleatoire entre 1 et 4 qui choisi le teleporteur dans lequel
* elle va apparaitre. Selon le signe du mouvement elle va s'afficher en haut à
* gauche du teleporteur ou en haut à droite.
* @author     Jeulin
*/

void portailTeleport() {
  PImage imgPortail1 = loadImage("teleportation.png");
  PImage imgPortail2 = loadImage("teleportation.png");
  PImage imgPortail3 = loadImage("teleportation.png");
  PImage imgPortail4 = loadImage("teleportation.png");
  image(imgPortail1, xPortal1, yPortal1);
  image(imgPortail2, xPortal2, yPortal2);
  image(imgPortail3, xPortal3, yPortal3);
  image(imgPortail4, xPortal4, yPortal4);
  if (teleportation(ball)) {
    int aleatoire = int(random(1, 5));
    if (aleatoire == 1) {
      if (ball.mvt_x > 0) {
        ball.x = xPortal1+33;
        ball.y = yPortal1-1;
      } else {
        ball.x = xPortal1-5;
        ball.y = yPortal1-5;
      }
      ball.x += ball.mvt_x;
      ball.y += ball.mvt_y;
    } else if (aleatoire == 2) {
      if (ball.mvt_x > 0) {
        ball.x = xPortal2+33;
        ball.y = yPortal2-1;
      } else {
        ball.x = xPortal2-5;
        ball.y = yPortal2-5;
      }
      ball.x += ball.mvt_x;
      ball.y += ball.mvt_y;
    } else if (aleatoire == 3) {
      if (ball.mvt_x > 0) {
        ball.x = xPortal3+33;
        ball.y = yPortal3-1;
      } else {
        ball.x = xPortal3-5;
        ball.y = yPortal3-5;
      }
      ball.x += ball.mvt_x;
      ball.y += ball.mvt_y;
    } else if (aleatoire == 4) {
      if (ball.mvt_x > 0) {
        ball.x = xPortal4+33;
        ball.y = yPortal4-1;
      } else {
        ball.x = xPortal4-5;
        ball.y = yPortal4-5;
      }
      ball.x += ball.mvt_x;
      ball.y += ball.mvt_y;
    }
  }  
}
     
