// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SupplyChain {
  enum Status {
    Pending,
    Shipped,
    Delivered,
    Cancelled
  }

  struct Order {
    uint id;
    string item;
    uint quantity;
    Status status;
  }

  Order[] public orders;
}
