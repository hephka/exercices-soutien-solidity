// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
contract CheckOdd {
    function check(uint i) public pure returns(bool) {
        return i % 2 == 1;
    }
}