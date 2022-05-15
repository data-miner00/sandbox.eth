# Solidity Examples with Truffle

A simple project to learn Ethereum development.

## Prerequisites and Installation

For this project, [Truffle](https://trufflesuite.com/docs/truffle/getting-started/installation/) and [Solidity compiler](https://docs.soliditylang.org/en/v0.8.10/using-the-compiler.html) are used and can be installed via `npm install` command from [Node.js](https://nodejs.org/en/).

```
npm i -g truffle solc
```

## Truffle Commands

A curated list of truffle commands that is commonly used.

### Initialize a truffle project

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

Within the truffle environment, we can run the truffle command without the `truffle` keyword.

We can get the `web3` library directly inside the truffle testnet, or the contract name itself.

We can also declare a variable `var inst;` and assign instance from the code.

```
Transaction.deployed().then((instance) => { inst = instance; });
```

Now the `var inst` points to the smart contract.

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
