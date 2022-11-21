- ERC20 is a standard for fungible token contract.
- Fungible token are all equal and have same value.
- Fungible token are used as medium of exchange.
- Voting rights and reputation

## Must Have Functions

- `totalSupply`: Returns the total amount of tokens available
- `balanceOf`: Returns the amount of tokens owner by the account with the address `account`.
- `transfer`: Transfer amount of tokens to the address `recipient`. This must emit a `Transfer` event and should throw if sender has insufficient balance.
- `approve`: Creates an allowance for the address `spender` to transfer `amount` of tokens on behalf of the account calling the function.
- `allowance`: Returns the amount of tokens that the address `spender` is allowed to spend on behalf of the account with the same `owner.
- `transferForm`: Transfers `amount` of tokens on bahalf of the address `sender` to the address `recipient. Must emit a `Trnasfer` event.

## Must Have Events

- `Transfer` must emit when `value` amount of token are transferred from account with address `index from` to `indexed to`
- `Approval` emit when the account `account owner` approves the account `indexed spender` to transfer `value` amount of tokens on its behalf.

## Optional functions

These functions is specified in ERC20 standard but is not being implemented.

- `name`: Return the name of the token
- `symbol`: Return the symbol of the token
- `decimals`: Returns the number of decimal places the token uses.

## References

- [Ethereum improvement proposal](https://eips.ethereum.org/EIPS/eip-20)
