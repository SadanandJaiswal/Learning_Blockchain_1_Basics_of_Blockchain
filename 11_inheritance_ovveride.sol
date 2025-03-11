// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

// importing SimpleSorage contract
import "./SimpleStorage.sol";

// inheritance
// syntax:
// contract contractName is InheritFromContractName{

// }

// this will have all the function and state of the simplestorage contract
// addPerson, getFavoriteNumber, nameToFavoritePerson, peoples, person, person1
contract ExtraStorage is SimpleStorage{
    // overriding the function of simpleStorage
    // to override the function need two conditions:
    // 1) overriding function in SimpleStorage should have virtual keyword
    // 2) override specifier is needed to override the function

    function getFavoriteNumberOfPerson(string memory _name) public override view returns(uint256) {
        return nameToFavoriteNumber[_name] + 5;
    }
}