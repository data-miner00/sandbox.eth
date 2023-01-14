//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Lottery {
    uint public pastBlockTime;

    constructor() payable {}

    receive () external payable {
        require(msg.value == 10 ether, "must be equal to 10 ether");
        require(block.timestamp != pastBlockTime, "must not be old block");

        pastBlockTime = block.timestamp;

        if (block.timestamp % 15 == 0) {
            (bool success, ) = msg.sender.call{value: address(this).balance}("");
            require(success, "failed to send Ether");
        }
    }
}
