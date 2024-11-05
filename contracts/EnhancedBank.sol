// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EnhancedBank {
    address public owner;
    mapping(address => uint) public balances;

    constructor() public {
      owner = msg.sender;
    }

    modifier onlyOwner() {
      require(msg.sender == owner, "Not the contract owner");
      _;
    }

    function deposit() public payable {
      balances[msg.sender] += msg.value;
    }

    function withDraw(uint amount) public {
      require(balances[msg.sender] >= amount, "Insuficient balance");
      payable(msg.sender).transfer(amount);
      balances[msg.sender] -= amount;
    }

    function getBalances() public view returns (uint) {
      return balances[msg.sender];
    }

    function emergencyWithDraw() public onlyOwner {
      payable(owner).transfer(address(this).balance);
    }
}
