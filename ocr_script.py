import sys
import easyocr

reader = easyocr.Reader(['ru'], gpu=False)
result = reader.readtext(sys.argv[1])
text = '\n'.join([item[1] for item in result])
print(text)
