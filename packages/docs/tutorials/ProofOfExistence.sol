// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProofOfExistence {
    bytes32 public proof;

    // calculate and store the proof for a document
    function notarize(bytes memory document) public {
        proof = proofFor(document);
    }

    // helper function to get document's sha256
    function proofFor(bytes memory document) public pure returns (bytes32) {
        return sha256(document);
    }
}