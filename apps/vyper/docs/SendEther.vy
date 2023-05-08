# @version ^0.3.7

@external
@payable
def send_ether(to: address):
    # send forwards 2300 gas
    send(to, msg.value)
