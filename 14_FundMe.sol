// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "./PriceConverter.sol";

// using constant, immutable -> we can make our contract more gas efficient
// constant-> declared and initialized once
// immutable -> assigned only once (e.g - once at constructor)

contract FundMe{

    using PriceConverter for uint256;

    mapping(address => uint256) public addressToAmountFunded;
    address[] public funders;

    // Could we make this constant?  /* hint: no! We should make it immutable! */
    address public /* immutable */ i_owner;
    uint256 public constant MINIMUM_USD = 50 * 10 ** 18;
    
    constructor() {
        i_owner = msg.sender;
    }

    // payable  function -> fund the contract
    function fund() public payable{
        // value parameter (remix ide) takes value of coins/token to be send with the transactoin

        // access the value field: msg.value
        require(msg.value.getConversionRate() >= MINIMUM_USD, "You need to spend more ETH!");
        // require(PriceConverter.getConversionRate(msg.value) >= MINIMUM_USD, "You need to spend more ETH!");
        addressToAmountFunded[msg.sender] += msg.value;
        funders.push(msg.sender);
    }

    function getVersion() public view returns (uint256){
        // ETH/USD price feed address of Sepolia Network.
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    function withdraw() public onlyOwner {
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call Failed");
    }

    // modifier
    // keyword that we ccan add in function decoration
    // do all thta is present in the modifier and then go to rest of the code
    modifier onlyOwner{
        require(msg.sender == i_owner, "Sender is not owner");
        _;
        // any thing below _; will run after the funciton is complemeted
    }

    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }
}