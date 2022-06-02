// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Storage {
    uint[] public ids;

    function add(uint id) public {
        ids.push(id);
    }

    function get(uint i) public view returns(uint) {
        return ids[i];
    }

    function getAll() public view returns(uint[] memory) {
        return ids;
    }

    function length() public view returns(uint) {
        return ids.length;
    }
}
