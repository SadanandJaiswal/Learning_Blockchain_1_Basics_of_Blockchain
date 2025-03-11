// 1) license
// SPDX-License-Identifier: GPL-3.0

// 2) start with solidity version

// version in range
pragma solidity >=0.8.2 <0.9.0;

// version greateer than equal to 0.8.2 using ^
// pragma solidity ^0.8.2; 

// for specific version
// pragma solidity >=0.8.2 

// 3) creating contract

// syntax
// contract contractName{

// }

contract SimpleStorage{
    // types of data types
    // boolean, uint(+ve), int, string, address, bytes, etc

    // uint: 8 to 256 bits
    // uint8, uint32, etc
    // uint : default to 256

    // address

    // bytes: till 32 bytes

    // automatically zero when not initialized
    uint256 favoriteNumber;
    uint256 public checkScore;

    // functions
    // syntax :

        // function functionName(paramType paramName) public returns(returnType){
        //     return ______;
        // }
    
    // for void return type function, no need for return and returns keyword

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;

        // more the computation more gas it will take
    }

    // visibility specifiers

    // public: visible internally and externally
    // Solidity automatically generates a getter function for public state variables.

    // private: only visible in the current contract
    // Not accessible from derived contracts

    // internal: Accessible inside the contract and in derived (inherited) contracts.

    // external: Accessible only from outside the contract. Cannot be called from inside the contract directly (except using this.functionName()).


    // function modifiers: pure and view

    // view: 
    // Read-only functions that do not modify the blockchain state. They can read state variables but cannot modify them.
    // Gas Cost: Free when called externally (e.g., from a frontend), but costs gas when called within a contract.

    function retrive() public view returns(uint256){
        return favoriteNumber;
    }

    // pure
    // They cannot read or modify state variables.
    // Only work with local variables and function parameters.
    // Gas Cost: Free when called externally.:

    function retrive() public pure returns(uint256){
        return 1+1;
    }

    // function return more than one variables
    function getValues() public pure returns (uint, string memory, bool) {
        return (100, "Hello Solidity", true);
    }

    function access() public{
        (uint a, string memory b, bool c) = getValues();
        // if we just want some variables only , we can skip other by comma
        (,,bool c) = getValues();
    }

    // Type casting:
    // int price = 10;
    // uint256 now = uint256(price);

    // version below 0.8 solidity: have variable by default unchecked (if overflow -> become zero)
    // uint8 num = 255; -> when increase by 1 -> overflow -> become zero -> now num = 0 

    // version >=0.8 have default to checked
    // to unchecked 
    uint8 num = 255;
    unchecked {num+1} // this will not give error and num become 0 (as overflow, uint8 can't have number > 255)
}