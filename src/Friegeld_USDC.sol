//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "lib/Modular-Tokenomics-Group-4/contracts/DemurrageFee.sol";
import "lib/openzeppelin-contracts/contracts/access/Ownable.sol";
import "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "lib/openzeppelin-contracts/contracts/token/ERC20/utils/SafeERC20.sol";


contract Friegeld_USDC is ERC20, Demurrage, Ownable {
    using SafeERC20 for IERC20;

    IERC20 public immutable token;
    constructor(
        IERC20 _token,
        uint256 _demurragePeriod, //blocks
        uint256 _taxAmount, // basis points
        uint256 _incentiveAmount // basis points
        )
    ERC20("Demurrage USDC","dUSDC")
    Demurrage(0xC9ADc46240C1828cEfEf0650C6951Fa3FDDb9846, _demurragePeriod, _taxAmount, _incentiveAmount)
    Ownable(0xC9ADc46240C1828cEfEf0650C6951Fa3FDDb9846)
    {
        token = IERC20(_token);
    }

    function deposit(uint256 amount) public onlyOwner { // creates new dUSDC
        require(token.balanceOf(msg.sender) >= amount, "Insufficient USDC balance");
        token.safeTransferFrom(msg.sender, address(this), amount);
        _mint(msg.sender, amount);
    }

    function withdraw(uint256 amount) public onlyOwner { // redeems dUSDC for USDC
        require(balanceOf(msg.sender) >= amount, "Insufficient dUSDC balance");
        _burn(msg.sender, amount);
        token.safeTransfer(msg.sender, amount);
    }

    function changeTaxAddress(address newAddress) public onlyOwner {
        _setTaxAddress(newAddress);
    }
    function decimals() public view override virtual returns (uint8) {
        return 6;
    }

}
