// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "@openzeppelin/contracts/utils/Strings.sol";

contract Primitives {
    bool public boo = true;

    /*
    uint stands for unsigned integer, meaning non negative integers
    different sizes are available
        uint8   ranges from 0 to 2 ** 8 - 1
        uint16  ranges from 0 to 2 ** 16 - 1
        ...
        uint256 ranges from 0 to 2 ** 256 - 1
    */
    uint8 public u8 = 1;
    uint public u256 = 456;
    uint public u = 123; // uint is an alias for uint256

    /*
    Negative numbers are allowed for int types.
    Like uint, different ranges are available from int8 to int256
    */
    int8 public i8 = -1;
    int public i256 = 456;
    int public i = -123; // int is same as int256

    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    // Default values
    // Unassigned variables have a default value
    bool public defaultBoo; // false
    uint public defaultUint; // 0
    int public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
    
    // New values
    address public newAddr = 0x0000000000000000000000000000000000000000;
    int public neg = -12;
    uint8 public newU = 0;

    // String type
    string public message = "msg";

    function combineString(string memory str1, string memory str2) pure public returns (string memory) {
        return string(abi.encodePacked(str1, " ", str2));
    }

    // Convert to bytes
    function numChars(string memory str1) pure public returns(uint) {
        bytes memory byte1 = bytes(str1);
        return byte1.length;
    }

    function intToStr() pure public returns (string memory) {
        // Convert uint to string
        string memory str = Strings.toString(123);
        return str;
    }
}
