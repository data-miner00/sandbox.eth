# @version ^0.3.7

event Log:
    sender: indexed(address)
    message: String[100]

event Payment:
    sender: indexed(address)
    amount: uint256

@external
def __default__():
    log Log(msg.sender, "function does not exist")

@external
@view
def get_balance() -> uint256:
    return self.balance


@external
def call_non_payable(message: String[10]) -> uint256:
    log Log(msg.sender, message)
    return 123


@external
@payable
def call_payable():
    log Payment(msg.sender, msg.value)
