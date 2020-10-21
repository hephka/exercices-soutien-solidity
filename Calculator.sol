// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import './Adder.sol';
import './Suber.sol';
import './Multiplier.sol';
import './Divisor.sol';
contract Calculator {
    Adder private adder;
    Suber private suber;
    Multiplier private multiplier;
    Divisor private divisor;
    constructor(address _adder, address _suber, address _multiplier, address _divisor) public {
        adder = Adder(_adder);
        suber = Suber(_suber);
        multiplier = Multiplier(_multiplier);
        divisor = Divisor(_divisor);
    }
    function calcAdd(uint256 nb1, uint256 nb2) public view returns(uint256) {
        return adder.add(nb1, nb2);
    }
    function calcSub(uint256 nb1, uint256 nb2) public view returns(uint256) {
        return suber.sub(nb1, nb2);
    }
    function calcMul(uint256 nb1, uint256 nb2) public view returns(uint256) {
        return multiplier.mul(nb1, nb2);
    }
    function calcDiv(uint256 nb1, uint256 nb2) public view returns(uint256) {
        return divisor.div(nb1, nb2);
    }
}