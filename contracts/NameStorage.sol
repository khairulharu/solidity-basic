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

    //function di solidity seperti apakah
    // function functionName(type parameter) visibility returns (type) {
    //      //function body
    // }

    //VISIBILITY DI SOLIDITY

    uint public valueStorage;

    //public hanya dapat di panggil oleh akun eksternal atau internal
    function setValue(uint x) public {
        valueStorage = x;
    }

    //externall hanya dapat dipanggil oleh akun external atau kontrak lain, tidak dipanggil secara internal, katanya external biasa digunakan untuk mengubuhngkan beberapa kontrak atau memanggil kontrak lain
    function setValueUsingExternalVisibility(uint x) external {
        valueStorage = x;
    }

    //internal hanya dapat dipanggil di dalam kontrak saat ini atau kontrak turunan
    function increment(uint x) internal {
        valueStorage += x;
    }

    //private hanya dapat dipanggil di dalam kontrak saat ini
    function decrement() private {
        valueStorage -= 1;
    }

    //STATE-CHANGING dan FUNCTION
    //function di solidity memiliki beberapa tipe seperti

    //State changing function yang berfungsi untuk update value
    // function set(uint x) public {
    //      valueStorage += x;
    // }

    //View Functions function satu ini hanya bertugas untuk mengembalikan sebuah value sesuai dengan
    //tipe data yang sudah di tentukan
    // function getValueStorage() public view returns (uint) {
    //      return valueStorage;
    // }

    //Pure Functions functions satu ini hanya untuk melakukan pengembalian nilai tanpa terpengaruh state external
    //state external ini berarti tidak mengubah data dari luar function itu sendiri, retrn nya hanya bergantung pada
    //parameter yang diberikan jadi tidak ada perubahan state

//     function add(uint a, uint b) public pure returns (uint) {
//         return a + b; // Tidak membaca atau memodifikasi state external.
//     }

     // Function Parameters and return values, function di solidity can take multiple value and returun multiple values
     //Example
     // function productCounts(uint a, uint b) public pure returns (uint pieces) {
     //      return pieces = a * b;
     // }

    // Dalam konteks Solidity, yang merupakan bahasa pemrograman untuk kontrak pintar di blockchain Ethereum, istilah yang kamu sebutkan memiliki makna khusus:

    // State External: Ini merujuk pada data atau keadaan di luar fungsi yang dimaksud, seperti variabel yang disimpan di dalam kontrak (state variables) atau data lain di blockchain. Dengan kata lain, state external adalah semua data yang di luar lingkup fungsi yang dipanggil.

    // Pure Function: Sebuah fungsi pure dalam Solidity adalah fungsi yang menjamin bahwa:

    // Fungsi tersebut tidak membaca atau memodifikasi state dari kontrak (state variables).
    // Fungsi hanya bekerja dengan data yang diberikan sebagai parameter dan tidak menggunakan data eksternal sama sekali.
    // Output yang dihasilkan hanya bergantung pada input yang diberikan dan tidak berubah-ubah.

    //     Selain pure, dalam Solidity terdapat beberapa jenis fungsi dengan spesifikasi terkait bagaimana mereka berinteraksi dengan state kontrak. Berikut penjelasan masing-masing:

    // View Function:

    // Fungsi view adalah fungsi yang hanya membaca state kontrak, tetapi tidak memodifikasi state tersebut.
    // Fungsi ini dapat membaca variabel di dalam kontrak, tetapi tidak bisa mengubahnya.
    // Cocok untuk fungsi yang digunakan untuk mendapatkan data dari kontrak tanpa mengubahnya.
    // Contoh view function:

    // solidity
    // Copy code
    // pragma solidity ^0.8.0;

    // contract Example {
    //     uint public number = 10;

    //     function getNumber() public view returns (uint) {
    //         return number; // Membaca state variable, tetapi tidak mengubahnya.
    //     }
    // }
    // Non-pure/Non-view (Regular Functions):

    // Fungsi biasa dalam Solidity tidak memiliki kata kunci pure atau view dan dapat mengubah state kontrak.
    // Fungsi ini digunakan untuk operasi yang memodifikasi variabel dalam kontrak atau menulis data ke blockchain.
    // Contoh fungsi yang memodifikasi state:

    // solidity
    // Copy code
    // pragma solidity ^0.8.0;

    // contract Example {
    //     uint public number = 10;

    //     function setNumber(uint _newNumber) public {
    //         number = _newNumber; // Memodifikasi state variable.
    //     }
    // }
    // Payable Function:

    // Fungsi payable memungkinkan kontrak untuk menerima Ether.
    // Fungsi ini harus ditandai dengan kata kunci payable untuk bisa menerima pembayaran dalam bentuk Ether.
    // Contoh payable function:

    // solidity
    // Copy code
    // pragma solidity ^0.8.0;

    // contract Example {
    //     function receiveFunds() public payable {
    //         // Fungsi ini bisa menerima Ether.
    //     }

    //     function getBalance() public view returns (uint) {
    //         return address(this).balance; // Membaca saldo kontrak.
    //     }
    // }
    // Ringkasan:
    // pure: Tidak membaca atau memodifikasi state kontrak.
    // view: Membaca state kontrak, tetapi tidak memodifikasi.
    // Regular functions: Dapat membaca dan memodifikasi state.
    // payable: Digunakan untuk fungsi yang dapat menerima Ether.
}
