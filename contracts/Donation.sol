// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Donation {
    address public owner;
    mapping(address => uint256) public donationList;

    event Donate(address indexed sender, uint256 amount);
    event Withdraw(address indexed owner, uint256 value);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can access");
        _;
    }

    constructor() {
        // 将合约的拥有者设定成建立合约的人
        owner = msg.sender;
    }

    // 收捐款的函式
    function donate() public payable {
        donationList[msg.sender] += msg.value;
        emit Donate(msg.sender, msg.value);
    }

    // 查询捐款总金额
    function getHistory() public view returns (uint256) {
        return donationList[msg.sender];
    }

    // 查询 VIP 等级
    function getRank() public view returns (string memory) {
        uint donationAmount = donationList[msg.sender];

        if (donationAmount > 10 ether) {
            return "UR";
        } else if (donationAmount > 5 ether) {
            return "SR";
        } else if (donationAmount > 1 ether) {
            return "R";
        } else if (donationAmount > 0) {
            return "N";
        } else {
            return "None";
        }
    }

    // 提领余额
    function withdraw() public onlyOwner {
        address payable receiver = payable(owner);
        uint256 value = address(this).balance;
        receiver.transfer(value);
        emit Withdraw(receiver, value);
    }
}