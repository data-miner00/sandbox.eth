# @version ^0.3.7

"""
Signature verification
1. hash a message to sign
2. sign message hash offchain
3. verify signature on chain
"""

@external
@pure
def get_hash(_str: String[100]) -> bytes32:
    return keccak256(_str)


@external
@pure
def get_eth_signed_hash(_hash: bytes32) -> bytes32:
    return keccak256(
        concat(
            b'\x19Ethereum Signed Message:\n32',
            _hash
        )
    )


@external
@pure
def verify(_eth_signed_hash: bytes32, _sig: Bytes[65]) -> address:
    r: uint256 = convert(slice(_sig, 0, 32), uint256)
    s: uint256 = convert(slice(_sig, 32, 32), uint256)
    v: uint256 = convert(slice(_sig, 64, 1), uint256)
    return ecrecover(_eth_signed_hash, v, r, s)

