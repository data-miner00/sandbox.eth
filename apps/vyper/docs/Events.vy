# @version ^0.3.7

# - notification

# up to 3 indexed arguments
event Transfer:
    sender: indexed(address)
    receiver: indexed(address)
    value: uint256

event Authorized:
    addr: indexed(address)
    authorized: bool

authorized: public(HashMap[address, bool])

@external
def transfer(to: address, amount: uint256):
    log Transfer(msg.sender, to, amount)


# - for cheap storage
@external
def grant_authorization(addr: address):
    assert self.authorized[msg.sender], "!authorized"
    self.authorized[addr] = True
    log Authorized(addr, True)


@external
def revoked_authorization(addr: address):
    assert self.authorized[msg.sender], "!authorized"
    self.authorized[addr] = False
    log Authorized(addr, False)
