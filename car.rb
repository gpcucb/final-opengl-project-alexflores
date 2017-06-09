require_relative 'figure'
require_relative 'chassis'

class Car
	attr_accessor :c, :rot

	def initialize
		@c = 3.14 / 180
		@rot = 0
	end
    
    #Función para dibujar los radios de la rueda
	def actall(r1,r2)
		glBegin(GL_QUADS);
		for i in(0..361) do
			glColor3f(0,0.5,0.5)
			x = r1*Math.cos(@c*i)
			y = 0
			z = r1*Math.sin(@c*i)
			glVertex3f(x,y,z)

			x = r1*Math.cos(@c*(i+30))
			y = 0
			z = r1*Math.sin(@c*(i+30))
			glVertex3f(x,y,z)

			x = r2*Math.cos(@c*(i+30))
			y = 0
			z = r2*Math.sin(@c*(i+30))
			glVertex3f(x,y,z)

			x = r2*Math.cos(@c*i)
			y = 0
			z = r2*Math.sin(@c*i)
			glVertex3f(x,y,z)
		end
		glEnd

	end
    
    #Función para generar los lados de los neumáticos
	def alloy(r1,r2)
		glColor3f(0,0,0)
		glBegin(GL_QUAD_STRIP)
		for j in(0..361) do
			x = r1*Math.cos(@c*j)
			z = r1*Math.sin(@c*j)
			y = 0
			glVertex3f(x,y,z)

			x = r2*Math.cos(@c*j)
			z = r2*Math.sin(@c*j)
			y = 0
			glVertex3f(x,y,z)
		end	
		glEnd

	end

	#Función para generar conductor de coche
	def driver
		glColor3f(0.5,0.2,0.8)
		#Legs
		glPushMatrix
			glTranslatef(3,-3.5,1.5)
			glRotatef(90,0,0,1)
			f1 = Figure.new
			f1.cylinder(0.4,3)
		glPopMatrix

		glPushMatrix
			glTranslatef(3,-6.5,1.5)
			glRotatef(90,0,0,1)
			f2 = Figure.new
			f2.cylinder(0.4,3)
		glPopMatrix

		#Hands
		glPushMatrix
			glTranslatef(3,-3.5,2.5)
			glRotatef(90,0,0,1)
			f3 = Figure.new
			f3.cylinder(0.4,3)
		glPopMatrix

		glPushMatrix
			glTranslatef(3,-6.5,2.5)
			glRotatef(90,0,0,1)
			f4 = Figure.new
			f4.cylinder(0.4,3)
		glPopMatrix

		#Head
		glPushMatrix
			glTranslatef(3,-5,4)
			glutSolidSphere(1.0,20,16)
		glPopMatrix


	    #Body
		glPushMatrix
			glTranslatef(3,-5,1)
			glRotatef(90,1,0,0)
			f5 = Figure.new
			f5.cylinder(1,2)
		glPopMatrix

		#Circle
		glPushMatrix
			glTranslatef(3,-5,3)
			glRotatef(90,1,0,0)
			f6 = Figure.new
			f6.circle(1)
		glPopMatrix

	end
    
    #Función que tiene llamadas a otras funciones para generar ruedas junto con eje
    def wheels
    	#axle
		glColor3f(0,0.5,0.3)
		f1 = Figure.new
		f1.cylinder(0.4,9)

		#1st Wheel
		glColor3f(0,0,0)
		f2 = Figure.new
		f2.cylinder(2,2)
		alloy(2,1.4)
		actall(1.4,0.8)
		glColor3f(0,0.5,0.4)
		f3 = Figure.new
		f3.circle(0.8)

		glPushMatrix
			glTranslatef(0,2,0)
			alloy(2,1.4)
			actall(1.4,0.8)
			glColor3f(0,0.5,0.4)
			f4 = Figure.new
			f4.circle(0.8)
		glPopMatrix

		#2nd Wheel
		glPushMatrix
			glTranslatef(0,8,0)
			glColor3f(0,0,0)
			f5 = Figure.new
			f5.cylinder(2,2)
			alloy(2,1.4)
			actall(1.4,0.8)
			glColor3f(0,0.5,0.4)
			f6 = Figure.new
			f6.circle(0.8)
		glPopMatrix

		glPushMatrix
			glTranslatef(0,10,0)
			actall(1.4,0.8)
			alloy(2,1.4)
			glColor3f(0,0.5,0.4)
			f7 = Figure.new
			f7.circle(0.8)
		glPopMatrix

    end
    
    #Función que tiene llamadas de función a chasis ()
    #driver () para generar el coche con ruedas giratorias
    def car
    	 #Coordenadas para el chasis del coche
    	 p = [5.5,-2.5,1]
    	 q=[5.5,-7.5,1]
    	 r=[10.7,-7.5,1]
    	 s=[10.7,-2.5,1]
		 p1=[10.7,-9,3]
		 s1=[12.7,-9,3]
		 q1=[10.7,-1,3]
		 r1=[12.7,-1,3]
		 p2=[0.5,-1,1]
		 s2=[5.5,-1,1]
		 q2=[0.5,-9,1]
		 r2=[5.5,-9,1]
         p3=[-15,-6.5,1]
         q3=[-15,-3.5,1]
         r3=[0.5,-2.5,1]
         s3=[0.5,-7.5,1]
         p4=[-13,-6.5,1]
         q4=[-13,-6.5,2.5]
         r4=[0.5,-7.5,3.5]
         s4=[0.5,-7.5,1]
         p5=[-13,-3.5,1]
         q5=[-13,-3.5,2.5]
         r5=[0.5,-2.5,3.5]
         s5=[0.5,-2.5,1]
         p6=[5.5,-2.5,1]
         q6=[5.5,-2.5,3.5]
         r6=[10.7,-2.5,3.5]
         s6=[10.7,-2.5,1]
         p7=[5.5,-7.5,1]
         q7=[5.5,-7.5,3.5]
         r7=[10.7,-7.5,3.5]
         s7=[10.7,-7.5,1]
         p8=[5.5,-7.5,3.5]
         q8=[10.7,-7.5,3.5]
         r8=[10.7,-6,3.5]
         s8=[5.5,-6,3.5]
         p9=[5.5,-2.5,3.5]
         q9=[5.5,-4,3.5]
         r9=[10.7,-4,3.5]
         s9=[10.7,-2.5,3.5]
         p10=[5.5,-4,3.5]
         q10=[10.7,-4,3.5]
         r10=[10.7,-5,4.5]
         s10=[5.5,-5,5.5]
         p11=[5.5,-6,3.5]
         q11=[10.7,-6,3.5]
         r11=[10.7,-5,4.5]
         s11=[5.5,-5,5.5]
         p12=[10.7,-9,2]
         q12=[10.7,-9,4]
         r12=[12.7,-9,4]
         s12=[12.7,-9,2]
         p13=[10.7,-1,2]
         q13=[10.7,-1,4]
         r13=[12.7,-1,4]
         s13=[12.7,-1,2]
         p14=[0.5,-1,1]
         q14=[0.5,-1,3]
         r14=[5.5,-1,3]
         s14=[5.5,-1,1]
         p15=[0.5,-9,1]
         q15=[0.5,-9,3]
         r15=[5.5,-9,3]
         s15=[5.5,-9,1]
         p16=[0.5,-1,1]
         q16=[0.5,-1,3]
         r16=[0.5,-2.5,3.5]
         s16=[0.5,-2.5,1]
         p17=[0.5,-7.5,1]
         q17=[0.5,-7.5,3.5]
         r17=[0.5,-9,3]
         s17=[0.5,-9,1]
         p18=[5.5,-1,1]
         q18=[5.5,-1,3]
         r18=[5.5,-2.5,3.5]
         s18=[5.5,-2.5,1]
         p19=[5.5,-7.5,1]
         q19=[5.5,-7.5,3.5]
         r19=[5.5,-9,3]
         s19=[5.5,-9,1]
         p20=[10.7,-7.5,1]
         q20=[10.7,-7.5,3.5]
         r20=[10.7,-2.5,3.5]
         s20=[10.7,-2.5,1]
         p21=[4,-2.5,3.5]
         q21=[5.5,-2.5,3.5]
         r21=[5.5,-7.5,3.5]
         s21=[4,-7.5,3.5]

         glPushMatrix
			glRotatef(180,0,0,1)

			c = Chassis.new(p,q,r,s,p1,q1,r1,s1,p2,q2,r2,s2,p3,q3,r3,s3,p4,q4,r4,s4,
				p5,q5,r5,s5,p6,q6,r6,s6, p7,q7,r7,s7,p8,q8,r8,s8,p9,q9,r9,s9,
				p10,q10,r10,s10,p11,q11,r11,s11,p12,q12,r12,s12,p13,q13,r13,s13,
				p14,q14,r14,s14,p15,q15,r15,s15,p16,q16,r16,s16,p17,q17,r17,s17,
				p18,q18,r18,s18,p19,q19,r19,s19,p20,q20,r20,s20,p21,q21,r21,s21)
			c.chassis()

			glPushMatrix
				glTranslatef(8,-10,1)
				glRotatef(@rot,0,1,0)
				wheels()
			glPopMatrix
			glPushMatrix
				glTranslatef(-12,-10,1)
				glRotatef(@rot,0,1,0)
				wheels()
			glPopMatrix

			driver()

			@rot+=90
			if @rot > 360 
				@rot-=360
			end

		glPopMatrix

    end

end