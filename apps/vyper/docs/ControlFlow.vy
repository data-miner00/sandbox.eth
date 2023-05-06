# @version ^0.3.7

nums: public(uint256[3])

@external
def __init__():
    self.nums[0] = 1
    self.nums[1] = 2
    self.nums[2] = 3

@external
@pure
def if_else(i: uint256) -> uint256:
    if i < 10:
        return i + 1
    elif: i < 20:
        return i + 2
    else:
        return i + 3


@external
@view
def for_loop() -> (uint256, uint256, uint256, uint256):
    x: uint256 = 0
    for i in [1, 2, 3]:
        x += convert(i, uint256)

    y: uint256 = 0
    for i in self.nums:
        y += i

    z: uint256 = 0
    for i in range(10): # run 10 times
        z += 1

    w: uint256 = 0
    for i in range(1, 10): # run 9 times
        w += convert(1, uint256)

    return (x, y, z, w)


@external
@pure
def continue_and_break() -> (uint256):
    x: uint256 = 0
    for i in [1, 2, 3, 4, 5]:
        if i < 3:
            continue
        if i == 4:
            break
        x = convert(i, uint256)

    return x


@external
def blank():
    pass
