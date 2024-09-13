import random
import string
import time
from datetime import datetime, timedelta
import re
import requests
import json
from fuzzywuzzy import fuzz


s1="Please call Stella ask her to bring this thing with her from the store six spoons of fresh snow piece five thick slabs of blue cheese and maybe snacks for her brother bob. We also need a small plastic snake and a big toy frog for the kids. She could keep this things into three red bags and we will go meet her next Wednesday at the train station."
s2="Please call Stella ask her to bring this thing for them from store six bottles of fresh know pays five six labs blue cheese and maybe snacks runner brother. Thought we also need a small plastic snake and a big toy frog for the kids. She could skip this things into three rent bags and we will go need her next Wednesday at the train station."
s3="Please Costello, ask her to bring least things with her from the store. Six movements of personal piece five six, seven so blue cheese and maybe that's not for brother Bob, we also need a small plastic snake, a big toy front for the kids. She can scoop these things to see right bags are gonna meet for Wednesday at the train station."

def compare_strings(s1,s2):
    return fuzz.token_set_ratio(s1,s2)


def random_string(string_length=10):
    """Generate a random string of fixed length """
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for _ in range(string_length))


def get_current_time():
    t = time.localtime()
    current_time = time.strftime("%H:%M:%S", t)
    return current_time
