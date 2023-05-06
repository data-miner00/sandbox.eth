# @version ^0.3.7

"""
Reference types
- list
- mappings
- structs

Reference types works like value types unlike in other programming
languages.
"""

nums: public(uint256[10])
maps: public(HashMap[address, uint256])

struct Person:
    name: String[100]
    age: uint256

person: public(Person)


@external
def __init__():
    self.nums[5] = 123
    self.maps[msg.sender] = 456
    self.person.name = "Vyper"

    # does not modify nums[0]
    arr: uint256[10] = self.nums
    arr[0] = 999

    # mappings cannot be local variable
    
    # does not modify person.name
    p: Person = self.person
    p.name = "Solidity"
