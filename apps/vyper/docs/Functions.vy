# @version ^0.3.7


num: public(uint256)
message: public(String[10])
value: public(uint256)
owner: public(address)

# payable constructor
@external
@payable
def __init__():
    self.owner = msg.sender
    self.value = msg.value


# visibility (internal or external)
@external
@pure
def fn(x: uint256, y: bool, z: String[10]) -> (uint256, bool, String[11]):
    return (x + 1, not y, concat(z, "?"))


@internal
@pure
def fn2(x: uint256, y: uint256) -> (uint256, bool):
    return (x + y, True)


@external
@view
def fn3(x: uint256) -> uint256:
    i: uint256 = 1
    b: bool = False
    (i, b) = self.fn2(1, 2)

    return x * x


# mutability (does it write to blockchain)
# pure, view, nonpayable, payable
@external
@pure
def fn4(x: uint256) -> bool:
    return x > 2


@external
@view
def fn5(x: uint256) -> (uint256, address):
    return (x + self.num, msg.sender)


@external
def fn6(_message: String[10]):
    self.message = _message


@external
@payable
def fn7():
    self.value = msg.value
