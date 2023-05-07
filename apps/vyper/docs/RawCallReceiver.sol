// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RawCallReceiver {
    event Log(uint x, uint y);

    function test(uint x, uint y) external {
        require(x == y, "x != y");
        emit Log(x, y);
    }

    function testDynamic(uint x, uint[] calldata xs) external
        returns (uint[] memory)
    {
        emit Log(xs[0], xs[1]);

        uint[] memory ys = new uint[](2);
        ys[0] = x + 1;
        ys[1] = x + 2;

        return ys;
    }
}
