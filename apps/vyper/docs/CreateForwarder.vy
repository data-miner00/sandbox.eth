# @version ^0.3.7

"""
Forwarder reduces the gas to deploy the same contract 50%-60% cheaper.

- `create_forwarder_to` is a deprecated alias of `create_minimal_proxy_to`
"""

interface ToDeploy:
    def setup(name: String[100]): nonpayable


@external
def deploy(_master_copy: address, _name: String[100]) -> address:
    addr: address = create_minimal_proxy_to(_master_copy)
    ToDeploy(addr).setup(_name)
    return addr
