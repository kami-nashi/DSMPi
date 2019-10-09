import board
import busio
import time
import adafruit_tlc59711

spi = busio.SPI(board.SCK, MOSI=board.MOSI)
leds = adafruit_tlc59711.TLC59711(spi)

def link_absent():
    b_full = 65535
    b_none = 0
    leds[0] = (b_full, b_none, b_none)
    time.sleep(.25)
    leds[0] = (b_none, b_none, b_none)
    time.sleep(.25)

def link_present():
    b_full = 65535
    b_none = 0
    leds[0] = (b_full, b_none, b_none)

def link_nlog():
    b_full = 65535
    b_none = 0
    leds[1] = (b_full, b_none, b_none)
    time.sleep(.05)
    leds[1] = (b_none, b_none, b_none)
    time.sleep(.05)

def link_ylog():
    b_full = 65535
    b_none = 0
    leds[1] = (b_full, b_none, b_none)
