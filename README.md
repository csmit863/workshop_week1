### QUT Blockchain Club Week 1 Workshop
# **Make Your Own Cryptocurrency**

#### Explanation
Hello! Welcome to __🔥⚡😈LEVEL 2😈⚡🔥__ of our week 1 workshop.

Please open up [/src/MyCoin.sol](https://github.com/csmit863/workshop_week1/blob/main/src/MyCoin.sol)

In this file you will see the most BASIC cryptocurrency you can make. It is essentially a boilerplate for creating tokens, but it was also built to introduce standards to tokens on Ethereum. Why?

Well, a cryptocurrency token on Ethereum is just code. So, in order to send and receive this cryptocurrency, you need to call the *functions* which have been written into the token code. Now, imagine everyone writes their own tokens from scratch without looking at each other's code. You'll probably end up with a lot of very different code. This makes it incredibly difficult for decentralised exchanges, lending, and governance protocols to work. And so this is where ERC20 comes in. Some developers decided to standardise the code of how to make tokens, so now all you have to do is import this template into your code, set any custom parameters, and you have a working cryptocurrency.

As you can see, our 'smart contract' aka the code for the token, starts with 
```solidity
contract MyCoin is ERC20 { 
    ...
}
```
This means that the code we are going to write is leveraging the standardised code written in ERC20.
Next, you will see the constructor
```solidity
    constructor() ERC20("My Coin", "COIN")
    {
        _mint(msg.sender, 10*10**18);
    }
```
This block of code is the first thing that is run when we deploy our code onto the blockchain. As you can see, we have to pass in some starting parameters to ERC20. These parameters are the token *name* and *symbol* or *ticker*. So, when you see this token in your wallet, or on an exchange, it will show up as "My Coin" with the symbol $COIN, similar to how Australian Dollars are shortened to $AUD.

We also pass in some code to run after ERC20 is initialised. The _mint function provided by ERC20 is used to mint the initial supply to the deployer of this smart contract. So, if you use your crypto wallet to deploy this smart contract, you will be minted however much you specify as the initial supply. The _mint function can also be used generally to create new tokens. This doesn't mean you can just continue to create more and more of this token out of thin air, though! This is all our code does: it inherits the ERC20 standard, and it mints 10^18 MyCoin to the deployer's wallet. No more tokens can be minted after this. The only thing you can do after this is send and receive these tokens.

Now that we understand the code, we can deploy it.


#### Deploying your token

**Before you proceed:**
In order to deploy our token onto the blockchain, we first will need some ether, also known as gas. This is what is used to pay for transactions, creating smart contracts, and interacting with smart contracts on Ethereum and other smart contract blockchains. 


**Method 1:** Remix IDE & Mobile Wallet (hotspot required)

Wallet:
If you want to choose the easy (and arguably more secure) route, download a mobile wallet. Download a crypto wallet like **Metamask** or **Coinbase Wallet** which support test networks like Sepolia. Once you've created your wallet, copy your wallet address.

If you are a student, you can go to [our faucet](https://faucet.qutblockchain.club) and enter your wallet address and student email. After verifying your email, you should receive some test ether to your crypto wallet on the **Sepolia** test network. This network is where we will deploy our coins for the time being.

Alternatively if you can't access the faucet or are not a student, just ask someone in the club, or go to a public faucet such as google's [Sepolia ether faucet](https://cloud.google.com/application/web3/faucet/ethereum/sepolia)

Now, you can use your test ether to deploy smart contracts and tokens! 


You will need to use your hotspot as the QUT WiFi currently blocks the Remix IDE (and all things crypto, unfortunately).
You can access the Remix IDE through TOR, but it sort of breaks. So, if you are going with this option, use your hotspot.

1. Go to the [Remix IDE](https://remix.ethereum.org)
2. Create a new file: MyCoin.sol
3. Copy & paste the code from [/src/MyCoin.sol](https://github.com/csmit863/workshop_week1/blob/main/src/MyCoin.sol)
4. Uncomment the line with '@openzeppelin', and comment out the line with 'openzeppelin-contracts'
 - it should look like this:
```solidity
//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// uncomment if using remix:
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


// uncomment if using foundry:
// import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";


contract MyCoin is ERC20 {
    constructor()ERC20("My Coin","COIN")
    {
        _mint(msg.sender, 10*10**18);
    }
}
```

5. 

**Method 2:** Foundry & Cast Wallet

Wallet:
If you are more technically inclined and want to look like a cool hacker and use the terminal, you can create a wallet using Foundry's **Cast Wallet** commands. 

If you are a student, you can go to [our faucet](https://faucet.qutblockchain.club) and enter your wallet address and student email. After verifying your email, you should receive some test ether to your crypto wallet on the **Sepolia** test network. This network is where we will deploy our coins for the time being.

Alternatively if you can't access the faucet or are not a student, just ask someone in the club, or go to a public faucet such as google's [Sepolia ether faucet](https://cloud.google.com/application/web3/faucet/ethereum/sepolia)

Now, you can use your test ether to deploy smart contracts and tokens! 

1. Download Git and Foundryup
2. Clone this project
3. Deploy the contract using 
```
forge create MyCoin --account <your cast wallet account name> --rpc-url https://sepolia.gateway.tenderly.co
```
4. Copy paste the 'deployed to' address and view it on Sepolia Scan


#### Finishing up
There you go! You just created your first token, deployed straight onto the blockchain, with no middlemen or centralised databases. Congrats! Put it on your resume! Tell your grandma! 