//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract MyCoin is ERC20 {
    constructor()ERC20("My Coin","COIN")
    {
        _mint(msg.sender, 10*10**18);
    }
}