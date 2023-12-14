//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract SimpleStorage {
    uint256 private number;
    address private deployerAddress;

    constructor() {
        number = 0;
        deployerAddress = msg.sender;
    }

    function storeNumber(uint256 _x) public {
        number = _x;
    }

    function getNumber() public view returns (uint256) {
        return number;
    }

    function getAddressOfDeployer() public view returns (address) {
        return deployerAddress;
    }
}

// Deployer: 0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC
// Deployed to: 0x6e989C01a3e3A94C973A62280a72EC335598490e
// Transaction hash: 0x7ab89b2d891480631195e77b14cf19ab7b5ac8a537c990300e62d08829498204

// cast send 0x6e989C01a3e3A94C973A62280a72EC335598490e "storeNumber(uint256)" 20 --rpc-url $RPC_URL --private-key $PRIVATE_KEY
// cast call 0x6e989C01a3e3A94C973A62280a72EC335598490e "getNumber()
// --to-base 0x0000000000000000000000000000000000000000000000000000000000000014 dec
