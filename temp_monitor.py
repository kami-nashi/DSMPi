#!/usr/bin/env python3

import time
import sys
import subprocess

import Adafruit_GPIO.SPI as SPI
import Adafruit_SSD1306
import Adafruit_DHT

from PIL import Image
from PIL import ImageDraw
from PIL import ImageFont

# Raspberry Pi pin configuration:
RST = None     
DC = 23
SPI_PORT = 0
SPI_DEVICE = 0
#humidity, temperature = Adafruit_DHT.read_retry(22, 17)

# 128x32 display with hardware I2C:
disp = Adafruit_SSD1306.SSD1306_128_32(rst=RST)

# Initialize library.
disp.begin()

# Clear display.
disp.clear()
disp.display()

width = disp.width
height = disp.height
image = Image.new('1', (width, height))

# Get drawing object to draw on image.
draw = ImageDraw.Draw(image)

# Draw a black filled box to clear the image.
draw.rectangle((0,0,width,height), outline=0, fill=0)

# Draw some shapes.
# First define some constants to allow easy resizing of shapes.
padding = -2
top = padding
bottom = height-padding
# Move left to right keeping track of the current x position for drawing shapes.
x = 0

font = ImageFont.truetype('/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf', 36)

def enviro():
    humidity, temperature = Adafruit_DHT.read_retry(22, 17)
    if temperature is not None:
        utemp = temperature * 9/5.0 + 32
        ftemp=('{0:0.1f}\N{DEGREE SIGN}F'.format(utemp)) 
        disp.clear()
        draw.text((x, top), str(ftemp),  font=font, fill=255)
    else:
        print('Failed to get reading. Try again!')
    pass

while True:
    draw.rectangle((0,0,width,height), outline=0, fill=0)
    enviro()
    # Display image.
    disp.image(image)
    disp.display()
    time.sleep(3)
