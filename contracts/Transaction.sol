// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Transaction {
    string public message;
    constructor(string memory myMessage) {
        message = myMessage;
    }

    function getMessage() public view returns (string memory) {
        return message;
    }
}
