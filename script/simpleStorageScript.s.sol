//SPDX-License-Identifier: MIT

//most of the time s denote script
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract simpleStorageScript is Script {
    function run() external returns (SimpleStorage) {
        //actually starting point is this for deploying
        vm.startBroadcast();

        //making an instance of contract
        SimpleStorage simpleStorage = new SimpleStorage();

        // if we wanna deploy it with 1 ether but we have to make construct payable for this in solidity
        // SimpleStorage simpleStorage = new SimpleStorage{value: 1 ether}();

        vm.stopBroadcast();

        return simpleStorage;
    }
}

// on wihtout specifing --rpc-url it will automatically deploys on anvil chain
// forge script script/simpleStorageScript.s.sol
// contract address -> 0x90193C961A926261B756D1E5bb255e67ff9498A1;

//first anvil
// forge script script/simpleStorageScript.s.sol --rpc-url http://127.0.0.1:8545
// contract SimpleStorage 0x34A1D3fff3958843C43aD80F30b94c510645C316
// Chain 31337
// Estimated gas price: 5 gwei
// Estimated total gas used for script: 160204
// Estimated amount required: 0.00080102 ETH

// it makes new folder brodcast, it gives our previous deployment info

// on deploying with different account of anvil
// forge script script/simpleStorageScript.s.sol --rpc-url http://127.0.0.1:8545 --broadcast --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
// 0: contract SimpleStorage 0x5FbDB2315678afecb367f032d93F642f64180aa3

// cast --to-base 0x714c2 dec -> it will convert hex into dec 464066

// it will make it more secure
// making .env file
// source .env
// echo $PRIVATE_KEY
// echo $RPC_URL
// forge script script/simpleStorageScript.s.sol --rpc-url $RPC_URL --broadcast --private-key $PRIVATE_KEY
// 0: contract SimpleStorage 0x663F3ad617193148711d28f5334eE4Ed07016602

// to call the methods which costs gas
//cast send 0x663F3ad617193148711d28f5334eE4Ed07016602 "storeNumber(uint256)" 20 --rpc-url $RPC_URL --private-key $PRIVATE_KEY
// to call which don't cost the gas
