// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EnumConversion {
  enum Status {
    Pending,
    Shipped,
    Delivered,
    Cancelled
  }

  Status public status;

  function setStatus(uint _status) public {
    status = _status;
  }

  function getStatus() public view returns (Status) {
    return status;
  }

  function getStatusAsInt() public view returns (Status) {
    return uint(status)
  }
}
