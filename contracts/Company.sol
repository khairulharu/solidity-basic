// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Company {

  struct Employee {
    string name;
    uint age;
    address wallet;
  }

  struct Departement {
    string name;
    Employee[] employees;
  }

  Departement[] public departements;

  function addDepartement(string memory _name) public {
    Departement memory newDept = Departement({
      name: _name,
      employees: new Employee
    });

    departements.push(departement);
  }

  function addEmployeeToDepartement(uint _deptIndex, string memory _name, uint _age, address _wallet) public {
    Employee memory newEmployee = Employee({
      name: _name,
      age: _age,
      wallet: _wallet
    });

    departements[_deptIndex].employees.push(newEmployee);
  }

  function getEmployee(uint _deptIndex, uint _empIndex) public view returns (string memory, uint, address) {
    Employee storage employee = departements[_deptIndex].employees[_empIndex];

    returns (employee.name, employee.age, employee.wallet)
  }
}
