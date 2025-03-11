// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract FallbackExample{
    uint256 public  result;

    // special function

    // this function get triggered any time we send transaction to the contract
    // Used to receive Ether when no calldata is sent (i.e., a simple transfer).
    receive() external payable { 
        // anything
        result = 1;
    }

    // Triggered when a function is called that does not exist or when Ether is sent without receive() defined.
    fallback() external payable { 
        result = 2;
    }
}