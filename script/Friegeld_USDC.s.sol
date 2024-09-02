// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import "src/Friegeld_USDC.sol";
import "lib/Modular-Tokenomics/contracts/DemurrageFee.sol";

contract Friegeld_USDCScript is Script {
    //IERC20 usdc;

    //address private usdc_address;

    function setUp() public {
        //usdc = IERC20(usdc_address);
    }

    

    function run() public {
        uint private_key = vm.envUint("PRIVATE_KEY");
        address account = vm.addr(private_key);
        console.log(account);
        string memory url = vm.envString("SEPOLIA_URL");
        console.log(url);
        vm.startBroadcast();
        
        IERC20 usdc;
        address usdc_address = 0xc55307C1395Cf13E17C24F51Fa4980Bcf7d5fa7F;
        usdc = IERC20(usdc_address);

        //egcoin = IERC20(egcoin);
        Friegeld_USDC dusdc;
        //dusdc = new Friegeld_USDC(usdc, 10, 300, 100);
        dusdc = Friegeld_USDC(0xb3C996eD330e0E7defb893DB4164b8Dbf9642681);
        console.log(dusdc.owner());
        usdc.approve(address(dusdc), 1000);
        dusdc.deposit(100);
        console.log(dusdc.balanceOf(0xC9ADc46240C1828cEfEf0650C6951Fa3FDDb9846));
        dusdc.withdraw(100);
        console.log(dusdc.balanceOf(0xC9ADc46240C1828cEfEf0650C6951Fa3FDDb9846));
        vm.stopBroadcast();
    }
}
