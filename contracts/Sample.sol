// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Sample {
    string public data;

    function hello() pure public returns(string memory) {
        return 'Hello World';
    }

    function set(string memory _data) public {
        data = _data;
    }

    function get() view public returns (string memory) {
        return data;
    }
}
