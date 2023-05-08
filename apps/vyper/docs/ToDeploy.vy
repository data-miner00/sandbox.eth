# @version ^0.3.7

owner: public(address)
name: public(String[100])


@external
def __init__():
    """
    Init is not called when using create_forwarder_to.
    """
    self.owner = msg.sender
    self.name = "Foo bar"


@external
def setup(_name: String[100]):
    assert self.owner == empty(address), "owner != zero address"
    self.owner = msg.sender
    self.name = _name


# To deploy such contract multiple times, it will be n times the cost for deploying one single time.


# DANGER: never have selfdestruct in contract used by create_forwarder_to.
@external
def kill():
    selfdestruct(msg.sender)
