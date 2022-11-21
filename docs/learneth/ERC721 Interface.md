- ERC721 is a standard for NFTs
- NFT is unique and not interchangeable
- They can have different properties, behaviour or rights
- Used to represent ownership of unique digital and physical assets like art, collectibles or real estate.

## Must Have Functions

- `balanceOf`: Returns the amount of tokens owned by the account with the address `owner`
- `ownerOf`: Returns the address `owner` of the account that holds the token with the id `tokenId`.
- `safeTransferFrom`: Transfer the ownership of a token with the id `tokenId` from the account with the address `from` to the account with the address `to`.
- `transferFrom`: Transfers the ownership of a token with id `tokenId` from the account with the address `from` to the account with the address `to`.
  > `transferFrom` is not safe because it does not check the recipient if it is a smart contract on whether it has implemented the `ERC721TokenReceiver` interface to handle ERC721 tokens.
- `approve`: Gives the account with the address `to` the permission to manage the token with the id `tokenId` on behalf of the account calling the function.
- `getApproved`: Returns the address `operator` of the account that is approved to manage the token with the id `tokenId`.
- `setApprovalForAll`: Gives or removes the permission (`_approved`) to the account with the address `operator` to manage all tokens of the account calling the function.
- `isApprovedForAll`: Returns `true` if the account with the address `operator` is approved to manage all tokens of the account with the address `owner`

## Must Have Events

- `Transfer`: Emitted when the token with the id `tokenId` is transferred from the account with the address `from` to the account with the account with the address `to`.

- `Approval`: Emitted when the account with the address `owner` approves the account with the address `spender` to manage the token with the id `tokenId` on its behalf.

- `ApprovalForAll`: Emitted when the account with the address `owner` gives or removes the permission (`_approved`) of the account with the address `operator` to manage all its tokens.

## IERC165

- ERC721 contracts is also inheriting from IERC165 interface. Hence, need to implement the functions
- Implementation of IERC165 can specify the interoperability to certain interfaces.
- A contracts that wants to interact with another contract can then query if it supports this interface before making a transaction.

```solidity
interface IERC165 {
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}
```

- For example, the ERC165 identifier for the ERC721 is "0x80ac58cd".
- Learn more at [EIP-165](https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified)

## Other interfaces

- The [IERC721TokenReceiver](https://eips.ethereum.org/EIPS/eip-721#specification) interface must be implemented to accept safe transfers.

- Optional extensions
  - `IERC721Enumerable` enables contract to publish full list of tokens and make the discoverable.
  - `IERC721Metadata` enables a contract to associate additional information to a token.

# Metadata Interface

- Optional, allow to specify additional info to ERC721 (`name`, `symbol`, `tokenURI`)
- `name` returns the name of the token collection. All token created with the contract have same name regardless their tokenId.
- `symbol` returns the symbol of the token collection.
- `tokenURI` returns the URI for the token with the id `tokenId`. It is for the individual token in collection.

```json
{
  "title": "Asset Metadata",
  "type": "object",
  "properties": {
    "name": {
      "type": "string",
      "description": "Identifies the asset to which this NFT represents"
    },
    "description": {
      "type": "string",
      "description": "Describes the asset to which this NFT represents"
    },
    "image": {
      "type": "string",
      "description": "A URI pointing to a resource with mime type image/* representing the asset to which this NFT represents. Consider making any images at a width between 320 and 1080 pixels and aspect ratio between 1.91:1 and 4:5 inclusive."
    }
  }
}
```

- ERC721 standard is flexible.
- The tokenURI does not need to point to a JSON document and the JSON does not need to have all properties.
