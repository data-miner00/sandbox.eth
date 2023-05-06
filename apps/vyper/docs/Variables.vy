# @version ^0.3.7

"""
- state variables
    - public and private
- name shadowing
- constants
    - built in
        - ZERO_ADDRESS
        - MAX_UINT256
    - custom
- environment variables
"""

# public state
num: public(uint256)

# private state without `public` keyword
string: String[10]

# constant
MY_CONSTANT: constant(uint256) = 123


@external
def __init__():
    self.num = 1
    self.string = "hello world"


"""
Shadowing a variable in Vyper is not allowed.
The following code that have state and local variables
of the same name will not be compiled.

```
num: public(uint256)

@external
def shadowing1(num: uint256):
    self.num = num

@external
def shadowing2(x: uint256):
    num: uint256 = x + 1
    self.num = num

@external
def use_of_reserved_keyword():
    balance: uint256 = 1
    return balance
```
"""

@external
@pure
def get_built_in_constants() -> (address, uint256):
    return (ZERO_ADDRESS, MAX_UINT256)


# environment variables
@external
@payable
def get_env_vars() -> (
    uint256, address, uint256, uint256, uint256, address
):
    return (
        self.balance,
        msg.sender,
        msg.value,
        block.number,
        block.timestamp,
        tx.origin
    )

"""
`msg.sender` vs `tx.origin`

A - calls -> B - calls -> C

- `msg.sender` returns the caller, can be a contract or user.
- `tx.origin` returns the user that initiated the transaction.
"""
