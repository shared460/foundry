// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    // this is stores as storage
    uint256 public number;
    uint256 public number_0;

    // immutable and constant directly stores in bytecode, code already swapp the values of variables
    uint256 public constant number_1 = 10;

    function setNumber(uint256 newNumber) public {
        // it is stored in memory which will be delete after some time so not stored in storage.
        uint256 number_2 = 10;

        number = number_2;
        number = newNumber;
    }

    function increment() public {
        number++;
    }

    // used when sending an ethers to contract without any calling of payable function
    fallback() external {}
    receive() external payable {}
}

// 1. we can inspect storage by -> forge inspect Counter storage
// 2. storage -> it is big giant array contains all variables, stores in form of hex, for dynaminc values are stored in form of hashing
//    function, it changes on chaging length.
// 3. strings need memory -> due to dynamically sized array.it will be deleted after completion, string can be stored as storage also.

// abi.encodePacked(arg) -> it is used to concatenate the strings, it returns an bytes form so convert it in string by string().
// on comilation of contract we get bytecode(binary data) and abi code(json file).
// abi.encode -> encoding some string into bytes or machine understanding language. it does not compressesd things.
// abi.decode(args, type) -> it decodes the args into type like string bytes etc.
//
