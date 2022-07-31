// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract DeleteContract {
    constructor(address payable _recipient) public payable {
        recipient = _recipient;
    }

    address payable public recipient;

    function sendEth() external payable {
        selfdestruct(recipient);
    }

    fallback() external payable {}
    receive() external payable {}
}