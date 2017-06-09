require 'opengl'
require 'glu'
require 'glut'
require 'chunky_png'
require 'wavefront'

require_relative 'model'
require_relative 'tree'
require_relative 'figure'
require_relative 'car'

include Gl
include Glu
include Glut

FPS = 60.freeze
DELAY_TIME = (1000.0 / FPS)
DELAY_TIME.freeze

$c = 3.14 / 180
$PI = 3.14
$TWO_PI = 2.0 * $PI
$RAD_TO_DEG = 180.0 / $PI

$viewpoint = 2
$MID = 570
$start = 1
$key = 'a'
$angle = 0
$carx = 0
$cary = 570

def load_objects
  puts "Loading model"
  @model = Model.new('obj/new_lego', 'obj/new_lego.mtl')
  puts "model loaded"
end

#Fuction to draw the track
def track(r1,r2)
    glBegin(GL_QUAD_STRIP)
    for j in(0..361) do  
      x = r1*Math.cos($c*j)
      y = r1*Math.sin($c*j)
      z = -1
      glVertex3f(x,y,z)

      x = r2*Math.cos($c*j)
      y = r2*Math.sin($c*j)
      z = -1;
      glVertex3f(x,y,z)
    end
    glEnd

end

#Function generating scenery using functions track( ),cone_tree( ),sphere_tree( )
def scenery
    #Background
    glColor3f(0.4,0.9,0.9)
    glPushMatrix
      glRotatef(90,1,0,0)
      f = Figure.new
      f.cylinder(1000,1000)
    glPopMatrix

    #Ground
    glColor3f(0,1,0)
    glPushMatrix
      glTranslatef(0,0,-1.1)
      glRotatef(90,1,0,0)
      c = Figure.new
      c.circle(1100)
    glPopMatrix

    #Track
    glColor3f(0.3,0.3,0.6)
    track(600,540)

    #Cone shaped trees
    for p in (0..360).step(30) do  
      x=700*Math.cos($c*p)
      y=700*Math.sin($c*p)
      ct = Tree.new(x,y)
      ct.cone_tree
    end

    #Sphere shaped trees
    for p in (100..460).step(30) do
      x=800*Math.cos($c*p)
      y=800*Math.sin($c*p)
      st = Tree.new(x,y)
      st.sphere_tree
    end

end

def view
  pos = [1000,1000,2000,1]
  c = Car.new
  case $viewpoint
      #case HELICOPTER:
      when 1 then
        glLightfv(GL_LIGHT0, GL_POSITION, pos)
        gluLookAt(200,0,700,0,0,0,0,0,1)
        scenery()
        glPushMatrix
          glTranslatef($carx,$cary,0)
          glRotatef($angle*$RAD_TO_DEG,0,0,-1)
          c.car()
          #@model.draw
        glPopMatrix

      #case SIDE:
      when 2 then
      gluLookAt(-20.0,-20.0,15,0.0,0.0,2.0,0.0, 0.0,1.0)
      c.car()
      #@model.draw
      glPushMatrix
        glRotatef($angle*$RAD_TO_DEG, 0.0,0.0,1.0)
        glTranslatef(-$carx,-$cary,0)
        glLightfv(GL_LIGHT0, GL_POSITION, pos)
        scenery()
      glPopMatrix

      #case FRONT:
      when 3 then
      gluLookAt(15.0,5.0,20,0.0,0.0,4.0,0.0,0.0,1.0)
      c.car()
      #@model.draw
      glPushMatrix
        glRotatef($angle*$RAD_TO_DEG, 0.0,0.0,1.0)
        glTranslatef(-$carx,-$cary,0)
        glLightfv(GL_LIGHT0, GL_POSITION, pos)
        scenery()
      glPopMatrix

      #case BACK:
      when 4 then
      gluLookAt(-12.0,6.0,13,15.0,6.0,2.0,0.0,0.0,1.0)
      c.car()
      #@model.draw
      glPushMatrix
        glRotatef($RAD_TO_DEG*$angle, 0.0, 0.0, 1.0)
        glTranslatef(-$carx,-$cary,0)
        glLightfv(GL_LIGHT0, GL_POSITION, pos)
        scenery()
      glPopMatrix
  end

end

def keyboard(key,x,y)
  $key = key
  if key == 'E' || key == 'e'
    $start = 0
  end
  if key == 'G' || key == 'g'
    $start = 1
  end

end

def initGL
  glDepthFunc(GL_LEQUAL)
  glEnable(GL_DEPTH_TEST)
  glClearDepth(1.0)
  
  glClearColor(1.0, 1.0, 1.0, 1.0)
  glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)

  glEnable(GL_LIGHTING)
  glEnable(GL_LIGHT0)
  glEnable(GL_COLOR_MATERIAL)
  glColorMaterial(GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE)
  glEnable(GL_NORMALIZE)
  glShadeModel(GL_SMOOTH)
  glCullFace(GL_BACK)

  light_position = [0.0, 50.0, 100.0]
  light_color = [1.0, 1.0, 1.0, 1.0]
  specular = [1.0, 1.0, 1.0, 0.0]
  ambient = [1.0, 1.0, 1.0, 1.0]
  glLightfv(GL_LIGHT0, GL_POSITION, light_position)
  glLightfv(GL_LIGHT0, GL_DIFFUSE, light_color)
  glLightfv(GL_LIGHT0, GL_SPECULAR, specular)
  glLightModelfv(GL_LIGHT_MODEL_AMBIENT, ambient)

end

def draw
  glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
  glMatrixMode(GL_MODELVIEW)
  glLoadIdentity
  view()
  glutSwapBuffers

end

def reshape(width, height)
  glViewport(0, 0, width, height)
  glMatrixMode(GL_PROJECTION)
  glLoadIdentity
  gluPerspective(100, width / height, 1.000, 2000.0)
  glMatrixMode(GL_MODELVIEW)
  glLoadIdentity
  
end

def idle
  if $start == 1
    $angle+=0.05;
    if $angle == $TWO_PI
      $angle-=$TWO_PI;
    end

    $carx = $MID*Math.sin($angle);
    $cary = $MID*Math.cos($angle);

    case $key

    when 'H', 'h' then $viewpoint = 1 #viewpoint=HELICOPTER

    when 'S', 's' then $viewpoint = 2 #viewpoint=SIDE

    when 'F', 'f' then $viewpoint = 3 #viewpoint=FRONT

    when 'B', 'b' then $viewpoint = 4 #viewpoint=BACK

    end
    glutPostRedisplay
    #puts $key
  end

end

#@spin = 0.0
#@previous_time = 0
#@frame_count = 0

load_objects
glutInit
glutInitDisplayMode(GLUT_RGBA | GLUT_DOUBLE | GLUT_DEPTH)

puts "**********PISTA CON OPEN-GL***********"
puts "PRESS:"
puts "G or g:Start"
puts "E or e:Stop"
puts "H or h :Vista Helicoptero"
puts "B or b :Vista Atraz"
puts "S or s :Vista Lateral"
puts "F or f :Vista Frontal"

glutInitWindowSize(500,500)
glutInitWindowPosition(10,10)
glutCreateWindow("Pista by alexroy5")
glutDisplayFunc :draw
glutIdleFunc :idle
glutKeyboardFunc :keyboard
glutReshapeFunc :reshape
initGL
glutMainLoop
