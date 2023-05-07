# @version ^0.3.7

event Log:
    message: String[100]
    val: uint256

@external
def call_test(test: address, x: uint256, y: uint256):
    raw_call(
        test,
        concat(
            method_id("test(uint256, uint256)"),
            convert(x, bytes32),
            convert(y, bytes32),
        ),
        max_outsize=0
    )

@external
def call_dynamic_test(test: address, x: uint256):
    res: Bytes[128] = raw_call(
        test,
        concat(
            method_id("testDynamic(uint256, uint256[])"),
            convert(x, bytes32),
            convert(64, bytes32),   # offset 2 func args
            convert(2, bytes32),    # length of uint256[]
            convert(88, bytes32),   # uint256[0]
            convert(99, bytes32)    # uint256[1]
        ),
        max_outsize=128
    )

    offset: uint256 = extract32(res, 0, uint256)
    length: uint256 = extract32(res, 32, uint256)
    y0: uint256 = extract32(res, 64, uint256)
    y1: uint256 = extract32(res, 96, uint256)
