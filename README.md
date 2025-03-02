### QUT Blockchain Club Week 1 Workshop
# **Make Your Own Cryptocurrency**

#### Explanation
Hello! Welcome to __🔥⚡😈LEVEL 2😈⚡🔥__ of our week 1 workshop.

If you want to skip straight to making a token, scroll down to [Deploying your token](#deploying-your-token)

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

Here's what you do.

1. **Install Foundry**

First, go download **Foundry**. It is super easy to setup. 

[Get Foundry](https://book.getfoundry.sh/getting-started/installation)

After you've finished installing, open up your code editor such as VSCode/VSCodium.

2. **Clone the repo**

Clone the [repo](https://github.com/csmit863/workshop_week1) like so:
```
git clone https://github.com/csmit863/workshop_week1
```

Go into the workshop_week1 folder.

3. **Create a wallet keypair**

Now we will create a crypto wallet in the terminal.

In the terminal, type:
```
cast wallet new
```

This will generate a **keypair**. The *address* is how others can send you crypto, and the *private key* is how you authorise transactions from this wallet. Keep it safe and secret, but also, just don't use this as your actual wallet - there are much more secure ways to make a crypto wallet. 

4. **Import the private key into a wallet**

Now that you have **generated** a wallet, you need to **import** the wallet for Foundry to use. Copy paste that private key. Then to import, type:
```
cast wallet import --interactive my_wallet
```
*FYI, you can replace 'my_wallet' with whatever you want to name your wallet.*

When prompted for a private key, paste in your private key. You may also be prompted to set a password for this wallet.

5. **Get testnet ether**

The next step is to load up that wallet with **Sepolia Ether** so that you can deploy smart contracts on the **Sepolia Public Testnet**.

If you are a student, you can go to [our faucet](https://faucet.qutblockchain.club) and enter your wallet address and student email. After verifying your email, you should receive some test ether to your crypto wallet on the **Sepolia** test network. This network is where we will deploy our coins for the time being.

Alternatively if you can't access the faucet or are not a student, just ask someone in the club, or go to a public faucet such as google's [Sepolia ether faucet](https://cloud.google.com/application/web3/faucet/ethereum/sepolia)

You can check the balance of your wallet in the terminal using Foundry like so:
```
cast balance <wallet address> --rpc-url https://sepolia.drpc.org
```
*You can replace the rpc url with any rpc url you wish to use. You can find them with a quick google search.*

6. **Deploy your coin**

Now that you've verified that your wallet has ether, you can deploy the token!

Type:
```
forge create MyCoin --account my_wallet --rpc-url https://sepolia.drpc.org --broadcast
```

Your token exists now! And you will have minted some of those coins to your wallet. The 'deployed to' address is where you can interact with it on the blockchain. If you have a mobile wallet, you can select 'import tokens' and then paste that deployment address into the token address slot. It should automatically pick up the name and ticker of your coin, as well as your balance. Congrats!

*To deploy your coin on any other network, you must have an ether balance on that network, and a rpc url which will connect you to that network.*


#### Finishing up

There you go! You just created your first token, deployed straight onto the blockchain, with no middlemen or centralised databases managing your token.