import cv2 as cv


alph = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

for iter in range(26):
	img = cv.imread(alph[iter]+".jpg", 0)

	_,img = cv.threshold(img, 200, 255, cv.THRESH_BINARY_INV)

	coe_file = open(alph[iter]+".coe", 'w')
	coe_file.write("memory_initialization_radix=2;\n")
	coe_file.write("memory_initialization_vector=\n")
	for i in range(32):
		for j in range(32):
			x = "1" if img[i,j]==255 else "0"
			if (j==31):
				if(i==31 and j==31):
					coe_file.write(x+";")
				else:
					coe_file.write(x+", ")
			else:
				coe_file.write(x)


