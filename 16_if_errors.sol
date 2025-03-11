// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// custom error (define outside of the contract)
error ErrorName();

contract SampleContract{
    address public immutable i_owner;
    
    constructor(){
        i_owner = msg.sender;
    }
    function paying() public{
        if(msg.sender != i_owner){
            revert ErrorName();
        }
    }
}