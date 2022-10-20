// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Escrow {
    enum State {
        AWAITING_PAYMENT,
        AWAITING_DELIVERY,
        COMPLETE
    }

    State public currentState;

    address public buyer;
    address payable public seller;

    modifier onlyBuyer() {
        require(msg.sender == buyer, "Only buyer can call this method");
        _;
    }

    constructor(address _buyer, address payable _seller) {
        buyer = _buyer;
        seller = _seller;
    }

    function deposit() external onlyBuyer payable {
        require(currentState == State.AWAITING_PAYMENT, "Already paid");
        currentState = State.AWAITING_DELIVERY;
    }

    function confirmDelivery() external onlyBuyer {
        require(currentState == State.AWAITING_DELIVERY, "Cannot confirm delivery");
        currentState = State.COMPLETE;
        seller.transfer(address(this).balance);
    }
}