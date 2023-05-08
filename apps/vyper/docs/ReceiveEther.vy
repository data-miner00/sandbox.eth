# @version ^0.3.7

event Payment:
    sender: indexed(address)
    amount: uint256
    bal: uint256
    gasLeft: uint256


@external
@payable
def __default__():
    """
    Will be called when:
    1. Non-existing contract is called.
    2. Sending ether to this contract

    Note: Cannot take inputs
    """
    log Payment(msg.sender, msg.value, self.balance, msg.gas)
