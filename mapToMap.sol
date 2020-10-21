// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
contract mapToMap {
    mapping(string => mapping(string => string)) public earth;
    constructor() public {
        earth["europe"]["france"] = "paris";
        earth["amerique du sud"]["argentine"] = "buenos aires";
    }
    function map(string memory _continent, string memory _country) public view returns(string memory) {
        return earth[_continent][_country];
    }
}