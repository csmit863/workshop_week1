### QUT Blockchain Club Week 1 Workshop
# **Make Your Own Cryptocurrency**

#### Explanation
Hello! Welcome to our first workshop.

Please open up /src/MyCoin.sol in your text editor of choice (for example VSCode, or notepad)

In this file you will see the most BASIC cryptocurrency you can make. 
It is essentially a boilerplate for creating tokens, but it was also built to introduce standards
to tokens on Ethereum. Why?

Well, a cryptocurrency token on Ethereum is just code. So, in order to send and receive this cryptocurrency,
you need to call the *functions* which have been written into the token code. Now, imagine everyone writes their own
tokens from scratch without looking at each other's code. You'll probably end up with a lot of very different code.
This makes it incredibly difficult for coin exchanges, decentralised finance, and governance protocols to work.
And so this is where ERC20 comes in. Some developers decided to standardise the code of how to make tokens, so
now all you have to do is import this template into your code, set any custom parameters, and boom! You have a
working cryptocurrency.

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
This block of code is the first thing that is run when we deploy our code onto the blockchain. As you can see,
we have to pass in some starting parameters to ERC20. These parameters are the token *name* and *symbol* or *ticker*. 
So, when you see this token in your wallet, or on an exchange, it will show up as "My Coin" with the symbol $COIN, similar
to how Australian Dollars are shortened to $AUD.

We also pass in some code to run after ERC20 is initialised. The _mint function is used to mint the initial supply to the 
deployer of this smart contract. So, if you use your crypto wallet to deploy this smart contract, you will be minted 
however much you specify as the initial supply. The _mint function can also be used generally to create new tokens.
This doesn't mean you can just continue to create more and more of this token out of thin air, though! This is all our 
code does: it inherits the ERC20 standard, and it mints 10^18 MyCoin to the deployer's wallet. No more tokens can be minted after this. The only thing you can do after this is send and receive these tokens.


#### Deploying your token
In order to deploy our token onto the blockchain, we first will need some ether, also known as gas. This is what is used 
to pay for transactions, creating smart contracts, and interacting with smart contracts on Ethereum and other smart contract blockchains. 

You are going to need a crypto wallet, luckily we can easily create one using Foundry's **Cast Wallet** commands.

If you are a student, go to faucet.qutblockchain.club and enter your wallet address and student number (no 'n'). 




#### Finishing up
There you go! You just created your first token, deployed straight onto the blockchain, with no middlemen or centralised databases. Congrats! Put it on your resume! Tell your grandma! 