from twilio.rest import Client
import os

'''Variables'''
account_sid = os.environ['TWILIO_ACCOUNT_SID']
auth_token = os.environ['TWILIO_AUTH_TOKEN']
call_and_pause = '<Response><Say>This call is from Twilio client. We are going to Play sound</Say><Play ' \
                 'loop="100">https://api.twilio.com/cowbell.mp3</Play><Pause length="180"/></Response>'
dialin_and_enter_pin = '<Response><Dial><Number sendDigits="wwwwwwwwwwww04630">+13322081521</Number></Dial></Response>'
voicemail = '<Response><Pause length="35"/><Say>The quick brown fox jumps over the lazy dog.</Say><Pause ' \
            'length="3"/></Response>'


def create_twilio_call(callee, caller, call_type=call_and_pause):
    client = Client(account_sid, auth_token)
    call = client.calls.create(
        twiml=call_type,
        to=callee,
        from_=caller
    )
    return call.sid


def twilio_voicemail(callee, caller, call_type=voicemail):
    client = Client(account_sid, auth_token)
    call = client.calls.create(
        twiml=call_type,
        to=callee,
        from_=caller
    )
    return call.sid




def end_twilio_call(call_sid):
    client = Client(account_sid, auth_token)
    call = client.calls(call_sid).update(status='completed')
