// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract Bank {
    address public owner;
    mapping(address => uint256) savings;
    mapping(address => uint256) timestamps;

    constructor() {
        owner = msg.sender;
    }
    function deposit(uint256 amount) public {
        savings[msg.sender] += amount;
        timestamps[msg.sender] = block.timestamp;
    }

    function getInterest(address owning) public view returns (uint) {
        if (timestamps[owning] > 0) {
            return (block.timestamp - timestamps[owning]);
        }
        return 0;
    }

    function getTotalAmount(address owning) public view returns (uint) {
        return savings[owning] + getInterest(owning);
    }

    function withdraw() public {
        savings[msg.sender] = 0;
        timestamps[msg.sender] = 0;
    }
}
