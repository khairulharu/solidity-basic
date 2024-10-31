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

     //fixed array atau array dengan ukuran dan panjang yang sudah di tentutkan;
     //pada kode ini berarti hanya boleh 5 angka yang masuk, selebihnya itu akan error;
     uint[5] public fixedArray;

     //tipe data map

     function setName(string memory name) public {
          nameStorage = name;
     }

     function getName() public view returns (string memory) {
          return nameStorage;
     }
}