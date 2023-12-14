//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Encoding {
    // it will returns in string with conversion of compressed bytes code of contacting both strings.
    function combineStrings() public pure returns (string memory) {
        return string(abi.encodePacked("heelo", "sharad"));
    }

    // it returns in bytes format but it is not comprssed.
    function encodeNumber() public pure returns (bytes memory) {
        return abi.encode("hello sharad");
    }

    // returns in non compressed way
    function encodeSomeString() public pure returns (bytes memory) {
        return abi.encode("some strings");
    }

    // returns in compressed way
    function packedEncodingSomeString() public pure returns (bytes memory) {
        return abi.encodePacked("some strings");
    }

    // returns same as of encodePacked but not do concatenation
    function sameOfBytes() public pure returns (bytes memory) {
        return bytes("some string");
    }

    function decodeString() public pure returns (string memory) {
        string memory somestring = abi.decode(encodeNumber(), (string));
        return somestring;
    }

    function multiEncode() public pure returns (bytes memory) {
        bytes memory someString = abi.encode("some", "string");
        return someString;
    }

    function multiDeode() public pure returns (string memory, string memory) {
        (string memory first, string memory second) = abi.decode(abi.encode("first", "second"), (string, string));
        return (first, second);
    }

    // actuall this is nohing there is not multi in ecodePacked.
    function multiPackedEncode() public pure returns (bytes memory) {
        return abi.encodePacked("hello", "sharad");
    }

    function multiPackedDecode() public pure returns (string memory) {
        return abi.decode(multiPackedEncode(), (string));
    }

    function multiStringCastPacked() public pure returns (string memory) {
        return string(multiPackedEncode());
    }
}

// calls -> static calls and calls
// call -> how we change the state of blockchain.
// staticCalls -> calling view or pure function which will not changes the states of blockchain.
