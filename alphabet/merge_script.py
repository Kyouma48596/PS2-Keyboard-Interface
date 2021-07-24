import cv2 as cv


alph = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H", "J", "K", "L", "Z", "X", "C", "V", "B", "N", "M"]
coe_file = open("mesrged.coe", 'w')
coe_file.write("memory_initialization_radix=2;\n")
coe_file.write("memory_initialization_vector=\n")
for iter in range(26):
	img = cv.imread(alph[iter]+".jpg", 0)

	_,img = cv.threshold(img, 200, 255, cv.THRESH_BINARY_INV)

	for i in range(32):
		for j in range(32):
			x = "1" if img[i,j]==255 else "0"
			if (j==31):
				if(i==31):
					coe_file.write(x+";\n")
				else:
					coe_file.write(x+", ")
			else:
				coe_file.write(x)