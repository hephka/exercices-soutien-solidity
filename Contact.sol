// SPDX-License-Identifier: MIT                 r
pragma solidity >=0.6.0;
pragma experimental ABIEncoderV2;
contract Contact {
    struct Data {
        string name;
        string email;
        string phone;
    }
    mapping(address => Data) public contact;
    function addContact(address _account, string memory _name, string memory _email, string memory _phone) public {
        contact[_account] = Data(_name, _email, _phone);
    }
    function getContact(address _addr) public view returns(Data memory) {
        return contact[_addr];
    }
}