// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Sample {
    string public data;

    function hello() public pure returns(string memory) {
        return "Hello World";
    }

    function set(string memory _data) public {
        data = _data;
    }

    function get() public view returns (string memory) {
        return data;
    }
}
