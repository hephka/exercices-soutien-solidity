// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "./CalcToken.sol";
contract CALKIco {
    // Declare a FirstErc20 contract
    FirstErc20 public token;

    // The price of 1 unit of our token in wei;
    uint256 public _price;
    
    address payable _wallet;
    
    mapping(address => uint256) public balances;

    // Address of token seller
    address payable private _seller;
    
    uint256 _nbTokens;
    
    event Purchase(
        address indexed _buyer,
        uint256 _amount
    );

    constructor(uint256 price, address payable seller, address erc20Address) public {
        _price = price;
        _seller = seller;
        //Token is deployed at 0x1F1aEcA9973f7ac293676c9032bC8dD0813535FC
        token = FirstErc20(erc20Address);
    }
    
    receive() external payable {
        buy(msg.value / _price);
    }

    function buy(uint256 nbTokens) public payable returns(bool){
        require(msg.value >= 0, "ICO: Price is not 0 ether");
        require(nbTokens * _price <= msg.value, "ICO: Not enough Ether for purchase");
        uint256 _realPrice = nbTokens * _price;
        uint256 _remaining = msg.value - _realPrice;
        token.transferFrom(_seller, msg.sender, nbTokens);
        _seller.transfer(_realPrice);
        if(_remaining > 0) {
            msg.sender.transfer(_remaining);
        }
        return true;
    }
}