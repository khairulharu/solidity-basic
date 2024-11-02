// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GraduationStatus {
  string public status;

  function calculateStatus(uint grade) public {
    if (grade >= 80) {
      status = "graduation";
    } else if ( grade <= 79 && grade >= 75) {
      status = "remed";
    } else {
      status = "fail";
    }
  }

  function getStatus() public view returns (string memory) {
    return status;
  }
}
