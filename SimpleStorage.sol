// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract SimpleStorage {
    uint256 private favoriteNumber;

    uint256[] public favoriteNumbers;

    mapping(string => uint256) public nameToFavoriteNumber;

    // Struct to store a person’s name and their favorite number
    struct Person {
        string name;
        uint256 favoriteNumber;
    }

    Person[] public people;

    enum ContractState {
        Active,
        Inactive
    }

    ContractState public state;

    function storeNumber(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        emit NumberUpdated(_favoriteNumber, msg.sender);
    }

    function getFavoriteNumber() public view returns (uint256) {
        return favoriteNumber;
    }

    function isGreaterThan(uint256 _compareValue) public view returns (bool) {
        if (favoriteNumber > _compareValue) {
            return true;
        } else {
            return false;
        }
    }

    function sumToFavoriteNumber() public view returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 1; i <= favoriteNumber; i++) {
            sum = sum + i;
        }
        return sum;
    }

    function internalFunction() internal pure returns (string memory) {
        return "This is an internal function";
    }

    function callInternalFunction() public pure returns (string memory) {
        return internalFunction();
    }

    function externalFunction() external pure returns (string memory) {
        return "This is an external function";
    }

    function testExternalFunction() public view returns (string memory) {
        return this.externalFunction();
    }

    function addFavoriteNumbers(uint256 _number) public {
        favoriteNumbers.push(_number);
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    function activateContract() public {
        state = ContractState.Active;
    }

    function deactivateContract() public {
        state = ContractState.Inactive;
    }

    function isActive() public view returns (bool) {
        return state == ContractState.Active;
    }

    event NumberUpdated(uint256 newNumber, address updatedBy);

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function updateNumber(uint256 _newNumber) public pure returns (uint256) {
        uint256 tempNumber = _newNumber + 5;
        return tempNumber;
    }

    function concatenateString(string calldata _inputString)
        public
        pure
        returns (string memory)
    {
        string memory newString = string(
            abi.encodePacked(_inputString, " is awesome!")
        );
        return newString;
    }
}
