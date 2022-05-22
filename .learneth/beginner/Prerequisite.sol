// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Prerequisite {
    function doSmth(int num1, int num2) pure public {
        // Throws with error message
        require(num2 != 0, "Second number cant be zero");

        // Throws without error message
        assert(num2 > 0);

        // Throws with error message
        if (num2 <= 0) {
            revert("Second number cant be less than zero");
        }
    }
}