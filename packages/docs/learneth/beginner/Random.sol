// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Random {
    function getRandNum(uint max) public view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(block.timestamp)));
        return rand % max;
    }
}