// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract People {

  struct Person {
    string name;
    uint age;
    address wallet;
  }

  Person[] public people;

  function addPerson(string memory _name, uint _age, address _wallet) public {
    Person memory newPerson = Person({
      name: _name,
      age: _age,
      wallet: _wallet
    });

    people.push(newPerson);
  }

  function getPerson(uint _index) public view returns (string memory, uint, address) {
    Person storage person = people[_index];

    return (person.name, person.age, person.wallet);
  }
}
