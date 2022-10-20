// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProofOfExistence2 {
    bytes32[] public proofs;

    function storeProof(bytes32 proof) public {
        proofs.push(proof);
    }

    // calculate and store the proof for a document
    function notarize(bytes memory document) public {
        bytes32 proof = proofFor(document);
        storeProof(proof);
    }

    // helper function to get document's sha256
    function proofFor(bytes memory document) public pure returns (bytes32) {
        return sha256(document);
    }

    // check if a document has been notarized
    function checkDocument(bytes memory document) public view returns (bool) {
        bytes32 _proof = proofFor(document);
        return hasProof(_proof);
    }

    // returns true if proof is stored
    function hasProof(bytes32 proof) public view returns (bool) {
        for (uint256 i = 0; i < proofs.length; i++) {
            if (proofs[i] == proof) {
                return true;
            }
        }
        return false;
    }
}