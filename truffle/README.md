# Solidity Examples with Truffle

A simple project to learn Ethereum development.

## Prerequisites and Installation

For this project, [Truffle](https://trufflesuite.com/docs/truffle/getting-started/installation/) and [Solidity compiler](https://docs.soliditylang.org/en/v0.8.10/using-the-compiler.html) are used and can be installed via `npm install` command from [Node.js](https://nodejs.org/en/).

```
npm i -g truffle solc
```

## Truffle Commands

A curated list of Truffle commands that is commonly used.

### Initialize a Truffle project

Initializes a project with a standard folder structure. Folder includes `contracts/` for all of the Solidity contracts, `migrations/` for Javascript deployment code, `test/` for unit testing and an empty `scripts` folder.

```
truffle init
```

### Scaffolding codes

- Creates a contract file within the `contracts/` folder.

```
truffle create contract <contract-name>
```

- Create a migration file in Javascript that is responsible to deploy the contract.

```
truffle create migration <migration-name>
```

### Compile

Compiles the code so that the EVM can understand.

```
truffle compile
```

### Start local environment

Spinup a local dev environment for deployment and interacting with the contract easily.

```
truffle develop
```

Within the local Truffle environment, we can run the `truffle` command without the `truffle` keyword.

We can get the `web3` library directly inside the Truffle testnet, or the contract name itself.

We can also declare a variable `var inst;` and assign instance from the code.

```
truffle(develop)> Transaction.deployed().then((instance) => { inst = instance; });
```

Now the `var inst` points to the smart contract.

## Migration (Deployment)

To deploy the contract, it can be done within the Ganache CLI or with the `truffle` command.

```
truffle migrate
or
truffle migrate --reset
```

### Public Testnets

To deploy the contracts to public testnet such as Binance Smart Chain testnet, we can use the `truffle migrate` command and attach a `--network` flag to it. Note that the networks are required to be configured within the `truffle-config.js` properly for it to work.

```
truffle migrate --reset --network bscTestnet
```

The following is the sample output of the successful deployment. Note that it might take longer than in local as it is actually deploying to the public blockchain.

```
1652670427_sample.js
====================

   Deploying 'Sample'
   ------------------
   > transaction hash:    0x1db84c60026d5223d4d5d889b27df0a7636d4ee2772dc935792de591e946509d
   > Blocks: 2            Seconds: 8
   > contract address:    0xB8fb622d3052c31D36acAa2D241f29cfF9b37672
   > block number:        19352978
   > block timestamp:     1652696668
   > account:             0xa25903284B762DABfc289AE58F960fF8d1547e69
   > balance:             0.19102163
   > gas used:            370949 (0x5a905)
   > gas price:           10 gwei
   > value sent:          0 ETH
   > total cost:          0.00370949 ETH

   > Saving migration to chain.
   > Saving artifacts
   -------------------------------------
   > Total cost:          0.00370949 ETH

Summary
=======
> Total deployments:   3
> Final cost:          0.00827775 ETH
```

### Interaction

To interact with the contracts deployed on the public testnet, we will need to start up the Truffle console with the appropriate network.

```
truffle console --network bscTestnet
```

The contract will need to be loaded into the console before any interaction can happen. The syntax are as follows: `<your-variable-name> = await <your-contract-name>.deployed()`.

```
truffle(bscTestnet)> tx = await Transaction.deployed()
undefined
```

Interaction is now possible with `<your-variable-name>.<your-contract-method>(...params-if-any)`.

```
truffle(bscTestnet)> tx.getMessage()
'hello world'
```

## Testing

All the tests are written in Javascript and is located inside the `test/` folder. Test are not written in Solidity as this is not a library project.

The library/syntax used for testing can be refer to [Mochajs](https://mochajs.org/).

```
pnpm test
```

## Linter

[Solhint](https://protofire.github.io/solhint/) is used for linting. It allows flexible lint through its configuration files that can extends predefined configurations.

```
pnpm lint
```

## Library

List of library used for this project.

- [OpenZeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts)
