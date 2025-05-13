//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SimpleStorage {

    Struct UserInfo {

        uint256 age;
        string name;
    }


    mapping(address => UserInfo) private users;

    function setUserInfo(uint256 _age, string memory _name) public {

        require(_age > 0, "Idade deve ser maior que zero");
        require(bytes(_name).length > 0, "Nome não pode ser vazio");
    }

    users[msg.sender] = UserInfo(_age,_name);
}