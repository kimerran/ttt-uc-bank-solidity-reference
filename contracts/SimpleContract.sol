// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract SimpleContract {
    address public owner;
    uint256 public number;
    constructor() {
        owner = msg.sender;
    }
    function read() public view returns (uint256) {
        return number;
    }
    function write(uint256 _number) public {
        number = _number;
    }
}