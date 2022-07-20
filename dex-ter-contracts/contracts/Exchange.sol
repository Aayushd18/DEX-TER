//SPDX-License-Identifier: MIT
pragma solidity^0.8.4;

import "openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Exchange is ERC20 {

  // address of the ERC20 token
  address public TokenAddress;

  constructor(address _tokenAddress, string memory _name, string memory _symbol) ERC20(_name, _symbol) {
    require(_tokenAddres != address(0), "Token address undefined");
    TokenAddress = _tokenAddress;
  }

  /**
  * @dev It returns the amount of token held by the contract
  * @return uint
  */
  funtion getReserve() public view returns (uint) {
    return ERC20(TokenAddress).balanceOf(address(this));
  }

  /**
  * @dev Adds liquidity to the exhange
  * @param Amount to add to the liquidity
  * @return LP token against the token deposited
  */
  function addLiquidity(uint _amount) public payable returns (uint) {
    uint liquidity;
    uint ethBalance = address(this).balance;
    uint tokenReserve = getReserve();
    ERC20 token = ERC20(TokenAddress);

    // Reserve is empty so we can take any amount from sender
    if(tokenReserve == 0) {
      token.transferFrom(msg.sender, address(this), _amount);
      liquidity = ethBalance;
      _mint(msg.sender, liquidity);
    } else {
      uint ethReserve - msg.value;
      uint tokenAmount = (msg.value * tokenReserve) / (ethReserve);
      require(_amount >= tokenAmount, "Insufficient Tokens Sent");

      // transfer Token from sender to contract
      token.transferFrom(msg.sender, address(this), tokenAmount);

      // Send the Lp token proportiontional to liquidity provided
      liquidity = (totalSupply() * msg.sender) / (ethReserve);
      _mint(msg.sender, liquidity);
    }

    return liquidity;
  }

  /**
  * @dev Function to remove liquidity
  * @param uint Amount of Eth/Token which sender wants to withdraw
  * @return tuple of uint - eth amount and token amount withdrawer can get
  */
  function removeLiquidity(uint _amount) public payable returns (uint, uint) {
    require(_amount > 0, "Amount should be greater than 0");
    uint ethReserve = address(this).balance;
    uint _totalSupply = totalSupply();

    // Eth that will be sent to user
    uint ethAmount = (ethReserve * _amount) / _totalSupply;

    // Token that will be sent to user
    uint tokenAmount = (getReserve() * _amount) / _totalSupply;

    // Burn the LP token as the liquidity is removed
    _burn(msg.sender, _amount);

    payable(msg.sender).transfer(ethAmount);
    ERC20(TokenAddress).transfer(msg.sender, tokenAmount);

    return (ethAmount, tokenAmount);
  }

  
  
}