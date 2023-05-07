# @version ^0.3.7

event Log:
    message: String[100]

locked: bool

@external
def call_me():
    assert not self.locked, "locked"
    self.locked = True
    # do stuffs here
    # call external contract
    raw_call(msg.sender, b"", value=0)
    # more code here
    self.locked = False


@external
@nonreentrant("lock")
def call_me_2():
    log Log("Here")
    raw_call(msg.sender, b"", value=0)
