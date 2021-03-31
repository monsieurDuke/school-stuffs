from twilio.rest import Client

account_sid = 'AC907dafce445563e05036c5c2453004dd'
auth_token = '15f37d22c3334ed4752a274d7aa0772b'
client = Client(account_sid, auth_token)

message = client.messages.create(
                              from_='whatsapp:+6281318420901',
                              body='Your appointment is coming up on July 21 at 3PM',
                              to='whatsapp:+6287777537983'
                          )
print(message.sid)
