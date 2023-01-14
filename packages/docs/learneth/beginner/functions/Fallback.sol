// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Fallback {
    mapping(address => uint) balance;
    event Log(uint gas);

    fallback() external payable {
        emit Log(gasleft());
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract TransferToFallback {
    function transferFallback(address payable _target) public payable {
        _target.transfer(msg.value);
    }

    function callFallback(address payable _target) public payable {
        (bool sent,) = _target.call{value:msg.value}('');
        require(sent, 'FAILURE: NOT SENT');
    }
}