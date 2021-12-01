//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

import "hardhat/console.sol";

contract EthUsdTracker {
  AggregatorV3Interface internal priceFeed;
  int initialPrice;

  constructor() {
    priceFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);
    initialPrice = latestPrice();
  }

  function latestPrice() internal view returns (int) {
    (
      uint80 roundID, 
      int price,
      uint startedAt,
      uint timeStamp,
      uint80 answeredInRound
    ) = priceFeed.latestRoundData();

    return price;
  }

  function hasPriceIncreased() public returns (bool) {
      
  }
}
