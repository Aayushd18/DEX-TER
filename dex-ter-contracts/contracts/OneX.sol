//SPDX-License-Identifier: MIT
pragma solidity^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OneX is ERC20 {
  // max spupply of token
  uint256 maxSupply = 10000;

  constructor(uint256 initialSupply) ERC20("OneX", "onex") {
    _mint(msg.sender, initialSupply);
  }

  function mint(uint256 _amount) public {
    require(totalSupply() < maxSupply);
    _mint(msg.sender, _amount);
  }
}