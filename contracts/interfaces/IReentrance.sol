// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IReentrance {
    function withdraw(uint _amount) external;
    function donate(address _to) external payable;
}