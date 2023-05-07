# @version ^0.3.7

interface ReEntrancyLock:
    def call_me(): nonpayable
    def call_me_2(): nonpayable

counter: public(uint256)
target: address


@external
def __init__(_target: address):
    self.target = _target


@external
def __default__():
    if self.i < 1:
        self.i += 1
        ReEntrancyLock(self.target).call_me()


@external
def test_reentrancy_lock():
    self.i = 0
    ReEntrancyLock(self.target).call_me()
