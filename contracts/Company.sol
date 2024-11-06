// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Company {

  struct Employee {
    string name;
    uint age;
    address wallet;
  }

  struct Department {
    string name;
    Employee[] employees;
  }

  Department[] public departments;

  function addDepartment(string memory _name) public {
    Department memory newDept = Department({
      name: _name,
      employees: new Employee()[0]
    });

    departments.push(newDept);
  }

  function addEmployeeToDepartment(uint _deptIndex, string memory _name, uint _age, address _wallet) public {
    Employee memory newEmployee = Employee({
      name: _name,
      age: _age,
      wallet: _wallet
    });

    departments[_deptIndex].employees.push(newEmployee);
  }

  function getEmployee(uint _deptIndex, uint _empIndex) public view returns (string memory, uint, address) {
    Employee storage employee = departments[_deptIndex].employees[_empIndex];

    return (employee.name, employee.age, employee.wallet);
  }
}
