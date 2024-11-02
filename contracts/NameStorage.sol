// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.19;

contract NameStorage {
     
     string public nameStorage = "nama";
     bool public flag = true;
     //untul niali negatif menggunakan int
     int public signedInt = -1;
     //nilai positif itu uint
     uint public unsignedInt = 1;

     //untuk tipe data byte yang dinamis yang menyesuaikan dengan panjang dari datanya 
     bytes public data = "HEllo";

     //sedangkan untuk tipe data yang tidak berubah, artinya panjang bytenya itu sudah di atur, jika data yang masuk melibhi darti byte yang di inisiate maka akan error sama seperti tipe data lainnya int dan uint
     bytes32 public fixedData = "Hello";

     //tipedata untuk address atau alamat
     address public wallet = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;

     //untuk tipe data dynamic cocok untuk array yang kita tidak tahu berapa isinya, atau lists yang kita tidak tahu
     uint[] public dynamicArray;

     //Contoh penggunaan array, disini saya akan memasukkan data ke dalam dynamic array, yang berarti ukuran array nya itu tidak di limit, beda dengan yang di limit atau ada angka pada saat inisialisai variable arraynya
     function addElement(uint element) public {
          dynamicArray.push(element);
     }

     //pengambilan array pada dynamicArray hampir sama seperti dan pada umumnya
     function getElement(uint index) public view returns (uint) {
          return dynamicArray[index];
     }

     //fixed array atau array dengan ukuran dan panjang yang sudah di tentutkan;
     //pada kode ini berarti hanya boleh 5 angka yang masuk, selebihnya itu akan error;
     uint[5] public fixedArray;

     //cara memasukkan element ke dalam fixed array itu berbeda dengan dynamicArray yang dimana fixed array itu harus didefenisikan index ke berapakah element itu akan masuk, berbeda dengan dynamic array yang index nya itu otomatis
     function setFixedArrayElement(uint index, uint element) public {
          fixedArray[index] = element;
     }

     //hampir sama seperti array pada umumnya
     function getFixedArrayElement(uint index) public view returns (uint) {
          return fixedArray[index];
     }

     //tipe data map, address sebagai data yang key nya dan unit sebagai valuenya
     mapping(address => uint) public balances;

     function updateBalances(address user, uint amount) public {
          balances[user] = amount;
     }

     function getBalance(address user) public view returns (uint) {
          return balances[user];
     }

     function setName(string memory name) public {
          nameStorage = name;
     }

     function getName() public view returns (string memory) {
          return nameStorage;
     }

     //for loop di solidity
     // uint value = 0;
     // for (uint i =0; i < 100; i++) {
     //      value += i
     // }

     //while loop di solidity
     // uint umur = 0;
     // while (umur < 18) {
     //      umur += 1
     // }
}