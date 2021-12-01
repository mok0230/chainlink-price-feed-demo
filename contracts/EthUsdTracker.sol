//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

import "hardhat/console.sol";

contract EthUsdTracker {
  AggregatorV3Interface internal priceFeed;
  int initialPrice;
  event PriceLog(string functionName, int price);

  constructor() {
    priceFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);

    int currentPrice = latestPrice();

    emit PriceLog("constructor", currentPrice);

    initialPrice = currentPrice;
  }

  function latestPrice() public view returns (int) {
    (,int price,,,) = priceFeed.latestRoundData();

    return price;
  }

  function hasPriceIncreased() public returns (bool) {
    int currentPrice = latestPrice();

    emit PriceLog("hasPriceIncreased", currentPrice);

    return currentPrice > initialPrice;
  }
}
