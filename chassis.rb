require_relative 'figure'

class Chassis
	attr_accessor :p,:q,:r,:s, :p1,:q1,:r1,:s1, :p2,:q2,:r2,:s2, :p3,:q3,:r3,:s3, :p4,:q4,:r4,:s4, 
	              :p5,:q5,:r5,:s5, :p6,:q6,:r6,:s6, :p7,:q7,:r7,:s7, :p8,:q8,:r8,:s8, :p9,:q9,:r9,:s9, 
	              :p10,:q10,:r10,:s10, :p11,:q11,:r11,:s11, :p12,:q12,:r12,:s12, :p13,:q13,:r13,:s13, 
	              :p14,:q14,:r14,:s14, :p15,:q15,:r15,:s15, :p16,:q16,:r16,:s16, :p17,:q17,:r17,:s17,
				  :p18,:q18,:r18,:s18, :p19,:q19,:r19,:s19, :p20,:q20,:r20,:s20, :p21,:q21,:r21,:s21

	def initialize(p,q,r,s, p1,q1,r1,s1, p2,q2,r2,s2, p3,q3,r3,s3, p4,q4,r4,s4, 
	              p5,q5,r5,s5, p6,q6,r6,s6, p7,q7,r7,s7, p8,q8,r8,s8, p9,q9,r9,s9, 
	              p10,q10,r10,s10, p11,q11,r11,s11, p12,q12,r12,s12, p13,q13,r13,s13, 
	              p14,q14,r14,s14, p15,q15,r15,s15, p16,q16,r16,s16, p17,q17,r17,s17,
				  p18,q18,r18,s18, p19,q19,r19,s19, p20,q20,r20,s20, p21,q21,r21,s21)
		@p = p
		@q = q
		@r = r
		@s = s

		@p1 = p1
		@q1 = q1
		@r1 = r1
		@s1 = s1

		@p2 = p2
		@q2 = q2
		@r2 = r2
		@s2 = s2

		@p3 = p3
		@q3 = q3
		@r3 = r3
		@s3 = s3

		@p4 = p4
		@q4 = q4
		@r4 = r4
		@s4 = s4

		@p5 = p5
		@q5 = q5
		@r5 = r5
		@s5 = s5

		@p6 = p6
		@q6 = q6
		@r6 = r6
		@s6 = s6

		@p7 = p7
		@q7 = q7
		@r7 = r7
		@s7 = s7

		@p8 = p8
		@q8 = q8
		@r8 = r8
		@s8 = s8

		@p9 = p9
		@q9 = q9
		@r9 = r9
		@s9 = s9

		@p10 = p10
		@q10 = q10
		@r10 = r10
		@s10 = s10

		@p11 = p11
		@q11 = q11
		@r11 = r11
		@s11 = s11

		@p12 = p12
		@q12 = q12
		@r12 = r12
		@s12 = s12

		@p13 = p13
		@q13 = q13
		@r13 = r13
		@s13 = s13

		@p14 = p14
		@q14 = q14
		@r14 = r14
		@s14 = s14

		@p15 = p15
		@q15 = q15
		@r15 = r15
		@s15 = s15

		@p16 = p16
		@q16 = q16
		@r16 = r16
		@s16 = s16

		@p17 = p17
		@q17 = q17
		@r17 = r17
		@s17 = s17

		@p18 = p18
		@q18 = q18
		@r18 = r18
		@s18 = s18

		@p19 = p19
		@q19 = q19
		@r19 = r19
		@s19 = s19

		@p20 = p20
		@q20 = q20
		@r20 = r20
		@s20 = s20

		@p21 = p21
		@q21 = q21
		@r21 = r21
		@s21 = s21
	end

	def chassis		
		specular = [0.7, 0.7, 0.7, 1.0]
		ambient = [1,1,1,1]
		diffuse = [0.7,0.7,0.7,1]
		full_shininess = [100.0]

		
		glMaterialfv(GL_FRONT,GL_AMBIENT,ambient)
		glMaterialfv(GL_FRONT,GL_SPECULAR,specular)
		glMaterialfv(GL_FRONT,GL_DIFFUSE,diffuse)
		glMaterialfv(GL_FRONT,GL_SHININESS, full_shininess)

		glColor3f(0,0.2,0.9)
        f = Figure.new 
		f.rect(@p,@q,@r,@s)
		f.rect(@p2,@q2,@r2,@s2)
		f.rect(@p3,@q3,@r3,@s3)
		f.rect(@p4,@q4,@r4,@s4)
		f.rect(@p5,@q5,@r5,@s5)
		f.rect(@q5,@q4,@r4,@r5)
		f.rect(@p6,@q6,@r6,@s6)
		f.rect(@p7,@q7,@r7,@s7)
		f.rect(@p8,@q8,@r8,@s8)
		f.rect(@p9,@q9,@r9,@s9)

		glColor3f(1,0.6,0)

		f.rect(@p1,@q1,@r1,@s1)
		f.rect(@q5,@q4,@p3,@q3)
		f.tri(@p4,@q4,@p3)
		f.tri(@p5,@q5,@q3)
		f.rect(@p10,@q10,@r10,@s10)
		f.rect(@p11,@q11,@r11,@s11)
		f.rect(@r16,@r18,@q18,@q16)
		f.rect(@q17,@q19,@r19,@r17)
		f.rect(@p21,@q21,@r21,@s21)

		glColor3f(0,0.2,0.9)
		f.rect(@p12,@q12,@r12,@s12)
		f.rect(@p13,@q13,@r13,@s13)								
		f.rect(@p14,@q14,@r14,@s14)
		f.rect(@p15,@q15,@r15,@s15)
		f.rect(@p16,@q16,@r16,@s16)
		f.rect(@p17,@q17,@r17,@s17)
		f.rect(@p18,@q18,@r18,@s18)
		f.rect(@p19,@q19,@r19,@s19)
		f.rect(@r18,@q19,@p19,@s18)
		f.rect(@p20,@q20,@r20,@s20)

	end

end