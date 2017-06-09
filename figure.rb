require 'opengl'
require 'glu'
require 'glut'

include Gl
include Glu
include Glut

class Figure
	attr_accessor :c

	def initialize
		@c = 3.14 / 180
	end

	def circle(r)
		glBegin(GL_POLYGON)
		for i in(0..360) do
			x = r*Math.cos(@c*i)
			z = r*Math.sin(@c*i)
			y = 0
			glVertex3f(x,y,z)
		end
		glEnd

	end

	def rect(p,q,r,s)
		glBegin(GL_POLYGON)
			glVertex3fv(p)
			glVertex3fv(q)
			glVertex3fv(r)
			glVertex3fv(s)
		glEnd

	end

	def cylinder(r,h)
		glBegin(GL_QUAD_STRIP)
		for d in(0..362) do
			x = r*Math.cos(@c*d)
			z = r*Math.sin(@c*d)
			y = 0;
			glVertex3f(x,y,z)

			y = h
			glVertex3f(x,y,z)
		end
		glEnd

	end

	def tri(a,b,z)
		glBegin(GL_TRIANGLES)
			glVertex3fv(a)
			glVertex3fv(b)
			glVertex3fv(z)
		glEnd

	end

end