# @version ^0.3.7


sender: public(address)
receiver: public(address)

DURATION: constant(uint256) = 7 * 24 * 60 * 60
expired_at: public(uint256)

@external
@payable
def __init__(_receiver: address):
    assert _receiver != empty(address), "receiver == ZERO_ADDRESS"
    self.sender = msg.sender
    self.receiver = _receiver
    self.expiredAt = block.timestamp + DURATION


@internal
@pure
def _get_hash(_amount: uint256) -> bytes32:
    # Alice -> Bob (sign 1 ETH)
    # Alice -> Carol (unsigned)
    return keccak256(concat(
        convert(self, bytes32),
        convert(_amount, bytes32))
    )

@external
@view
def get_hash(_amount: uint256) -> bytes32:
    return self._get_hash(_amount)

@internal
@view
def _get_eth_signed_hash(_amount: uint256) -> bytes32:
    hash: bytes32 = self._get_hash(_amount)
    return keccak256(
        concat(
            b'\x19Ethereum Signed Message:\n32',
            hash
        )
    )

@external
@view
def get_eth_signed_hash(_amount: uint256) -> bytes32:
    return self._get_eth_signed_hash(_amount)


@internal
@view
def _verify(_amount: uint256, _sig: Bytes[65]) -> bool:
    eth_signed_hash: bytes32 = self._get_eth_signed_hash(_amount)

    r: uint256 = convert(slice(_sig, 0, 32), uint256)
    s: uint256 = convert(slice(_sig, 32, 32), uint256)
    v: uint256 = convert(slice(_sig, 64, 1), uint256)

    return ecrecover(eth_signed_hash, v, r, s) == self.sender


@external
@view
def verify(_amount: uint256, _sig: Bytes[65]) -> bool:
    return self._verify(_amount, _sig)


@nonreentrant("lock")
@external
def close(_amount: uint256, _sig: Bytes[65]):
    assert msg.sender == self.receiver, "!receiver"
    assert self._verify(_amount, _sig), "invalid sig"

    raw_call(self.receiver, b'\x00', value=_amount)
    selfdestruct(self.sender)


@external
def cancel():
    assert msg.sender == self.sender, "!sender"
    assert block.timestamp >= self.expiredAt, "!expired"
    selfdestruct(self.sender)
