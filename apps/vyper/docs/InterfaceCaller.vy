# @version ^0.3.7

interface Receiver:
    def get_balance() -> uint256: view
    def call_non_payable(message: String[10]) -> uint256: nonpayable
    def call_payable(): payable
    def does_not_exist(): nonpayable


@external
@view
def get_balance_of_receiver(receiver: address) -> uint256:
    return Receiver(receiver).get_balance()


@external
def call_receiver(receiver: address):
    num: uint256 = Receiver(receiver).call_non_payable("hello")


@external
@payable
def pay_receiver(receiver: address):
    Receiver(receiver).call_payable(value=msg.value)


@external
def call_does_not_exist(receiver: address):
    Receiver(receiver).does_not_exist() # will call `__default__()`
