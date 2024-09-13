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


def get_current_time2():
    current_time2 = datetime.now().strftime("%H:%M:%S.%f")
    return current_time2[:-3]


def parse_pin(pin):
    list_a = []
    string = re.sub(r"[^0-9]", "", pin)
    for each in string:
        list_a.append(each)
    return list_a



def get_schedule_time(delta=9):
    future_time = datetime.now() + timedelta(minutes=delta)
    gcal_format_schedule_start = future_time.strftime("%-I:%M %p")
    conf_end_time = future_time + timedelta(minutes=15)
    gcal_format_schedule_end = conf_end_time.strftime("%-I:%M %p")
    time_list = [future_time.strftime("%-I"), future_time.strftime("%M"), future_time.strftime("%p"),
                 gcal_format_schedule_start, gcal_format_schedule_end]
    return time_list


def get_recurring_date(delta=7):
    future_day = datetime.now() + timedelta(days=7)
    return future_day.strftime("%a, %b %-d")


def get_date():
    current_day = datetime.now()
    return current_day.strftime("%m/%d/%Y")


def get_date2():
    current_day = datetime.now()
    return current_day.strftime("%b %-d, %Y")


def dot_append(text):
    lista = []
    for c in text.lower():
        lista.append(c + '.')
    return ''.join(lista)


def strip_list(list_name):
    temp = []
    for text in list_name:
        striped_text = text.strip()
        temp.append(striped_text)
    return temp


def get_bearer_token(endpoint, email, password):
    url = endpoint + "/api/auth/client"
    payload = json.dumps({
        "email": email,
        "password": password,
        "action": "android"
    })
    headers = {
        'Content-Type': 'application/json',
    }

    response = requests.request("POST", url, headers=headers, data=payload)
    result = response.json()
    if response.status_code == 200:
        return result['access_token']
    else:
        return None


def get_call_id(endpoint, token, target_key):
    url = endpoint + "/api/feed?target_key=" + target_key + "&filter=call&limit=1"
    payload = {}
    headers = {
        'Authorization': 'Bearer {0}'.format(token)
    }

    response = requests.request("GET", url, headers=headers, data=payload)
    result = response.json()
    return str(result[0]['id'])


def end_existing_call_api(endpoint, token, call_id):
    url = endpoint + "/api/call/" + call_id
    payload = json.dumps({
        "state": "hangup"
    })
    headers = {
        'Authorization': 'Bearer {0}'.format(token),
        'Content-Type': 'application/json'
    }

    response = requests.request("PATCH", url, headers=headers, data=payload)
    print(response.text)

def get_current_day_month_string():
        return datetime.today().strftime('%d%b').upper()
