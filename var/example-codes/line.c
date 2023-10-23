#include<GL/glut.h>

void init(void) {

  glClearColor(1.0,1.0,1.0,0.0);
  glMatrixMode(GL_PROJECTION);
  gluOrtho2D(0.0,800.0,0.0,600.0);
}

void createline(void) {
  glClear(GL_COLOR_BUFFER_BIT);
  glColor3f(0,1,0);
  glBegin(GL_LINES);
  glVertex2f(-0.5, 0.0);
  glVertex2f(0.5, 0.0);
  glEnd();
  glFlush();
}

void main(int argc, char** argv) {
  glutInit(&argc, argv);
  glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
  glutInitWindowSize(800, 600);
  glutCreateWindow("OpenGL Line Example");
  glClearColor(0.0, 0.0, 0.0, 1.0);
  glutDisplayFunc(createline);
  glutMainLoop();
}