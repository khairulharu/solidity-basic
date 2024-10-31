// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleBank {
  mapping(address => uint) public balances;

  function deposit() public payable {
    balances[msg.sender] += msg.value;
  }

  function withdraw(uint amount) public {
    require(balances[msg.sender] >= amount, "Insufficient balance");

    payable(msg.sender).transfer(amount);

    balances[msg.sender] -= amount;
  }

  function getBalance() public view returns (uint) {
    return balances[msg.sender];
  }
}
