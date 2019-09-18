import board
import busio
import time
import adafruit_tlc59711

spi = busio.SPI(board.SCK, MOSI=board.MOSI)
leds = adafruit_tlc59711.TLC59711(spi)

#leds[0] = (65535, 32767, 32767)
#time.sleep(1)
#leds[0] = (0,0,0)
#time.sleep(1)
#leds[0] = (65535, 32767, 32767)
#time.sleep(1)
#leds[0] = (0,0,0)
#time.sleep(1)
#leds[0] = (65535, 32767, 32767)
#time.sleep(1)
#leds[0] = (0,0,0)
#time.sleep(1)

#leds[1] = (65535, 0, 0)
#leds.g2 = 65535
#leds.red_brightness = 63

def blinkblink():
   b_full = 65535
   b_none = 0 
   leds[0] = (b_full, b_none, b_none)
   time.sleep(.25)
   leds[0] = (b_none, b_full, b_none)
   time.sleep(.25)

while True:
   blinkblink()
