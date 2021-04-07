import pywhatkit
import time
from datetime import datetime
from pynput.keyboard import Key, Controller

keyboard = Controller()
pywhatkit.sendwhatmsg('+6287885639274','hello world im dying',21,46)
keyboard.press(Key.ctrl)
keyboard.press('w')
keyboard.release('w')
keyboard.release(Key.ctrl)
time.sleep(5.0)
keyboard.press(Key.enter)
keyboard.release(Key.enter)
