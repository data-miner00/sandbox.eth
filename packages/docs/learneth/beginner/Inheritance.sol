// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Shape {
    uint height;
    uint width;

    constructor(uint _height, uint _width) {
        height = _height;
        width = _width;
    }
}

contract Square is Shape {
    constructor(uint h) Shape(h, h) {}

    function getHeight() public view returns (uint) {
        return height;
    }
}
