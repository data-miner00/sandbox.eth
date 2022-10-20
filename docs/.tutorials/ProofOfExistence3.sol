// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProofOfExistence3 {
    mapping (bytes32 => bool) private proofs;

    function storeProof(bytes32 proof) public {
        proofs[proof] = true;
    }

    function notarize(bytes memory document) public {
        bytes32 proof = proofFor(document);
        storeProof(proof);
    }

    function proofFor(bytes memory document) public pure returns (bytes32) {
        return sha256(document);
    }

    function checkDocument(bytes memory document) public view returns (bool) {
        bytes32 proof = proofFor(document);
        return hasProof(proof);
    }

    function hasProof(bytes32 proof) public view returns (bool) {
        return proofs[proof];
    }
}