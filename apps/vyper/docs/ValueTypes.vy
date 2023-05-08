# @version ^0.3.7

boolean     : public(bool)
integer     : public(int128)    # -2 ** 127 to (2 ** 127 - 1)
uinteger    : public(uint256)   # 0 to 2 ** 256 - 1
decimals    : public(decimal)   # -2 ** 127 to (2 ** 127 - 1), 10 decimal places
addr        : public(address)
byt         : public(bytes32)

bytearrays  : public(Bytes[100])
strings     : public(String[100])


@external                       # can be called outside of the contract
def __init__():
    self.boolean    = False
    self.integer    = -1
    self.uinteger   = 123
    self.decimals   = 3.14
    self.addr       = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    self.byt        = 0xada1b75f8ae9a65dcc16f95678ac203030505c6b465c8206e26ae84b525cdacb
    self.bytearrays = b"\x01"
    self.strings    = "This is a string"
