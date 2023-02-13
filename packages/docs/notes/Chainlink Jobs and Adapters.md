# Chainlink Jobs and Adapters

## Chainlink Jobs

When making a request to a Chainlink node, it translates to dispatching a Job request for the node to execute. The parameters required for the jobs include _what_, _how_ and _when_ regarding the requested job.

Chainlink Jobs have 2 parts

1. **Initiators** - When to start the job
2. **Adapters** - What task to execute

Chainlink supports `cron`, `directrequest`, `fluxmonitor`, `keeper`, `offchainreporting` and `webhook` jobs. [> Read More](https://docs.chain.link/chainlink-nodes/oracle-jobs/jobs/)

## Adapters

Adapters are the actions that takes place within a Job. A job can only be done successfully when the [pipelines](https://docs.chain.link/chainlink-nodes/oracle-jobs/task-types/pipelines/) of Adapters are composed in an arbitrary order. There are two types of Adapters - Core Adapters and External Adapters.

Core Adapters ([Tasks](https://docs.chain.link/chainlink-nodes/oracle-jobs/task-types/tasks)) are the common Adapters that are built into all Chainlink nodes and can be used for any Job.

Conversely, [External Adapters](https://docs.chain.link/chainlink-nodes/external-adapters/external-adapters) are the ones that are created by the community and can do basically everything that the core adapters can't.

## API Request

To make an API Request on-chain with the oracle, it will need to dispatch a job that consist of the following adapters (tasks) - `httpget`, `jsonparse`, `multiply`, `ethuint256` and `ethtx`.

```json [job.json]
{
  "name": "Get > Uint256",
  "initiators": [
    {
      "type": "runlog",
      "params": {
        "address": "YOUR_ORACLE_CONTRACT_ADDRESS"
      }
    }
  ],
  "tasks": [
    {
      "type": "httpget" // fetch the api data
    },
    {
      "type": "jsonparse" // parse the json, extract the piece of desired data
    },
    {
      "type": "multiply" // solidity doesnt work with decimal
    },
    {
      "type": "ethuint256" // convert to ethereum readable data
    },
    {
      "type": "ethtx" // create transaction on-chain
    }
  ]
}
```

### Smart Contract

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

contract APIConsumer is ChainlinkClient {
    using Chainlink for Chainlink.Request;

    uint256 public volume;
    bytes32 private jobId = "ca98366cc7314957b8c012c72f05aeeb"; // jobId for `get > uint256`
    uint256 private fee = (1 * LINK_DIVISIBILITY) / 10;

    constructor() {
        setChainlinkToken(0x326C977E6efc84E512bB9C30f76E30c160eD06FB)
        setCahinlinkOracle(0xCC79157eb46F5624204f47AB42b3906cAA40eaB7)
    }

    function requestVolumeData() public returns (bytes32 requestId) {
        Chainlink.Request memory req = buildChainlinkRequest(
            jobId,
            address(this),
            this.fulfill.selector
        );

        // httpget
        req.add("get","https://min-api.cryptocompare.com/data/pricemultifull?fsyms=ETH&tsyms=USD");

        // jsonparse
        req.add("path", "RAW,ETH,USD,VOLUME24HOUR");

        // multiply
        int256 timesAmount = 10 ** 18;
        req.addInt("times", timesAmount);

        return sendChainlinkRequest(req, fee)
    }

    function fulfill(bytes32 _requestId, uint256 _volume) public recordChainlinkFulfillment(_requestId) {
        volume = _volume;
    }
}
```

### Explaination

The `requestVolumeData()` function first creates a placeholder for the type `Chainlink.Request` to hold the request object. After that, the `httpget` adapter is placed into the pipeline followed by `jsonparse` to walk through the JSON object for the desired content and finally `multiply` to convert from decimal to integer.

Note that `ethuint256` and `ethtx` adapters is not placed as they are implicitly performed by the job and happens automatically.

After the job request is submitted, it will take some time for the request to come back and populate the `volume` variable.

## Goerli Testnet

- Chainlink contract: `0x326C977E6efc84E512bB9C30f76E30c160eD06FB`

## Reference

- [Chainlink API Call [See Description] | Chainlink Engineering Tutorials](https://www.youtube.com/watch?v=ay4rXZhAefs)
- [Reading Off-Chain Data With Chainlink](https://app.stackup.dev/)quest_page/reading-off-chain-data-with-chainlink
- [Chainlink Market](https://market.link/overview)
- [LinkPool](https://linkpool.io/)
