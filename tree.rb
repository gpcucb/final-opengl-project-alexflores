
require_relative 'figure'

class Tree
	attr_accessor :a, :b, :c

	def initialize(a,b)
		@a = a.to_f
		@b = b.to_f
		@c = 3.14 / 180
	end

	def cone
		r=10
		glColor3f(0.0,0.7,0.2)
		glBegin(GL_TRIANGLE_FAN)
		glVertex3f(0,0,20)
		for i in(0..361).step(2) do
			x= r*Math.cos(i*@c)
			y= r*Math.sin(i*@c)
			glVertex3f(x,y,0)
		end
		glEnd

	end

	def cone_tree
	   #Tree trunk
	   glColor3f(0.9,0.3,0)
	   glPushMatrix
		 glTranslatef(@a,@b,-1)
		 glRotatef(90,1,0,0)
		 f = Figure.new
		 f.cylinder(3,15)
	   glPopMatrix

	   #Cone shaped tree top
	   glPushMatrix
		 glTranslatef(@a,@b,8)
		 cone()
	   glPopMatrix

	end

	def sphere_tree
		#Tree trunk
		glColor3f(1,0.2,0)
		glPushMatrix
			glTranslatef(@a,@b,-1)
			glRotatef(90,1,0,0)
			f = Figure.new
			f.cylinder(6,25)
		glPopMatrix

		#Sphere shaped tree top
		glColor3f(0,1,0.3)
		glPushMatrix
			glTranslatef(@a,@b,45)
			glutSolidSphere(30,10,10)
		glPopMatrix

	end

end