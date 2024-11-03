# SimpleStorage Smart Contract

## Overview
The `SimpleStorage` contract is an advanced Solidity smart contract designed to store and manage favorite numbers for individual users, track names associated with favorite numbers, and provide information about the contract’s state. It demonstrates a variety of Solidity features, including structs, enums, mappings, visibility modifiers, events, and functions with both data manipulation and utility functionalities.

## Features

### 1. State Variables
- **favoriteNumber**: A private `uint256` variable that stores a user's favorite number.
- **favoriteNumbers**: A public array of `uint256` values to store a list of favorite numbers.
- **nameToFavoriteNumber**: A public mapping from a person's name (string) to their favorite number (uint256).
- **people**: A public array of `Person` structs to store the name and favorite number of each person.
- **state**: An enum (`ContractState`) to track the contract’s state, which can be either `Active` or `Inactive`.

### 2. Structs
- **Person**: A struct that holds the `name` (string) and `favoriteNumber` (uint256) of a person.
  - Allows adding new people with their favorite numbers to the `people` array.

### 3. Enums
- **ContractState**: An enum to represent the contract’s current status. It has two states:
  - `Active`: The contract is currently active.
  - `Inactive`: The contract is currently inactive.
- Functions `activateContract` and `deactivateContract` are used to change the contract state, and `isActive` checks if the contract is active.

### 4. Events
- **NumberUpdated(uint256 newNumber, address updatedBy)**: Emitted when the `storeNumber` function updates the `favoriteNumber`.

### 5. Functions

#### Basic Storage and Retrieval
- **storeNumber(uint256 _favoriteNumber)**: Stores a given number as the favorite number and emits the `NumberUpdated` event.
- **getFavoriteNumber()**: Returns the current favorite number.

#### Mapping and Struct Management
- **addFavoriteNumbers(uint256 _number)**: Adds a given number to the `favoriteNumbers` array.
- **addPerson(string memory _name, uint256 _favoriteNumber)**: Adds a new person with their name and favorite number to the `nameToFavoriteNumber` mapping.

#### Comparison and Mathematical Functions
- **isGreaterThan(uint256 _compareValue)**: Compares `favoriteNumber` with `_compareValue`. Returns `true` if `favoriteNumber` is greater.
- **sumToFavoriteNumber()**: Calculates and returns the sum of numbers from 1 up to `favoriteNumber`.

#### Contract State Management
- **activateContract()**: Sets the contract’s state to `Active`.
- **deactivateContract()**: Sets the contract’s state to `Inactive`.
- **isActive()**: Returns `true` if the contract state is `Active`, otherwise `false`.

#### Function Types and Visibility
- **internalFunction()**: An internal function that returns a string. Demonstrates internal function access.
- **callInternalFunction()**: A public function that calls `internalFunction` and returns its value.
- **externalFunction()**: An external function that returns a string message. Demonstrates external visibility.
- **testExternalFunction()**: Calls `externalFunction` to showcase how external functions can be called from within the contract.

#### Utility Functions
- **updateNumber(uint256 _newNumber)**: Takes a new number, adds 5 to it, and returns the result.
- **concatenateString(string calldata _inputString)**: Takes an input string and appends `" is awesome!"` to it, returning the concatenated result.

### Usage

1. **Setting and Retrieving Favorite Numbers**: Call `storeNumber()` to set a favorite number, and `getFavoriteNumber()` to retrieve it.
2. **Mapping Management**: Use `addPerson()` to associate a name with a favorite number in the `nameToFavoriteNumber` mapping.
3. **Comparison Operations**: Use `isGreaterThan()` to check if the stored favorite number is greater than a given value.
4. **Calculating Sums**: Call `sumToFavoriteNumber()` to get the cumulative sum from 1 to the favorite number.
5. **Contract State**: Use `activateContract()`, `deactivateContract()`, and `isActive()` to manage and check the contract's active state.
6. **Event Emission**: Track changes to the `favoriteNumber` with the `NumberUpdated` event emitted by `storeNumber()`.
7. **Internal and External Functions**: Demonstrate different function types by calling `callInternalFunction()` for internal access and `testExternalFunction()` for external access.
8. **Utility**: Use `updateNumber()` for simple number manipulation and `concatenateString()` for basic string concatenation.

## License
This project is licensed under the MIT License.
