// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract SimpleContract{
    // struct

    People public  person = People({favoriteNumber: 2, name: "saddy"});
    People public person2 = People(13, "maddy");
    
    struct People{
        uint256 favoriteNumber;
        string name;
    }

    
    // mapping:
    mapping(string => uint256) public nameToFavoriteNumber;

    // Array
    // Syntax: 
    // uint256[size] public people;
    People[] public peoples;

    function addPerson(string memory _name, uint256 _favoriteNumber) public{
        People memory newPerson = People(_favoriteNumber, _name);
        peoples.push(newPerson);
        // peoples.push(People(_favoriteNumber, _name));

        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    // in solidity we can store data in six place:
    // stack, memory, storage, calldata, code, logs

    // calldata, memory : variable exists temporarily
    // calldata: temporary variable that can't be modified: _name as parameter can't be _name = "cat"
    // memory: temporary variable that can be modified
    // storage: variable exits out of function , eg: favoriteNumber

    // array, string, struct, mapping : need memory , solidity default know where uint256 will live


    // for loop
    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    for(uint256 index=0; index<funders.length; index++){
        address funder = funders[index];
        addressToAmountFunded[funder] = 0;
    }

    funders = new address[](0); // new array of size 0 , if n then n size

}