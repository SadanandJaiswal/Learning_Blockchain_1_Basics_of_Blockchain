// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// importing SimpleSorage contract
import "./SimpleStorage.sol";

// one contract can deploy to another contract
contract StorageFactory{
    SimpleStorage[] public simpleStorageArray;

    // function to deploy contract
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();  // new: creaating new contract
        simpleStorageArray.push(simpleStorage);
    }

    // sf: storageFactory , just for naming purpose we used
    function sfAddPerson(uint256 _simpleStorageIndex, string memory _name, uint256 _favoriteNumber) public{
        // to interact with another contract, need: address of the contract deployed and ABI of the contract(coem after compilation of contract)
        // Address
        // ABI: Application Binary Interface

        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];

        // use function of simplestorage contract
        simpleStorage.addPerson(_name, _favoriteNumber);
    }

    function sfGet(uint256 _simpleStorageIndex, string memory _name) public view returns(uint256) {
        
        // both are same

        // SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        // return simpleStorage.getFavoriteNumberOfPerson(_name);
        
        return simpleStorageArray[_simpleStorageIndex].getFavoriteNumberOfPerson(_name);

    }
}