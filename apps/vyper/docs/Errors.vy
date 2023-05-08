# @version ^0.3.7

x: public(String[10])
owner: public(address)


@external
def __init__():
    self.owner = msg.sender


@external
def set_x_with_assert(_x: String[10]):
    assert self.owner == msg.sender, "!owner"
    if self.owner != msg.sender:
        raise "!owner"

    self.x = _x


@internal
def set_x_with_raise(sender: address, _x: String[10]):
    # raise is good for complex logics
    if self.owner != sender:
        raise "!owner"

    self.x = _x


# Note: error bubbles up
@external
def set_x_to_foo():
    self.set_x_with_raise(msg.sender, "Foo")


# UNREACHABLE uses all of gas. Uncommon to use.
@external
def unreachable():
    raise UNREACHABLE
