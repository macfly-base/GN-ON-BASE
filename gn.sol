// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

/**
 * @title SayGN
 * @dev A simple contract to emit a "GN - Good Night!" message via an event.
 */
contract SayGN {
    // Event emitted when a user calls the sayGN function
    event GNSaid(address indexed user, string message);

    // Mapping to store the last message of each user
    mapping(address => string) public lastMessage;

    /**
     * @notice Restricts access to externally owned accounts (EOAs) only.
     */
    modifier onlyEOA() {
        require(tx.origin == msg.sender, "Only EOAs can call this function");
        _;
    }

    /**
     * @notice Emits the GNSaid event with a user-defined message.
     * @param customMessage The custom message to be emitted.
     */
    function sayGN(string calldata customMessage) external onlyEOA {
        lastMessage[msg.sender] = customMessage;
        emit GNSaid(msg.sender, customMessage);
    }
}
