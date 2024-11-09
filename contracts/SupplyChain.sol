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

  function crateOrder(uint _id, string memory _item, uint _quantity) public returns (uint256) {
    orders.push(Order({
      id: _id,
      item: _item,
      quantity: _quantity,
      status: Status.Pending
    }));

    return orders.length - 1;
  }
}
