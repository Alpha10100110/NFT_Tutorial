pragma solidity ^0.8.19;

contract Whitelist {
    uint8 public maxWhiteListedAddresses;

    mapping(address => bool) public whiteListedAddresses;

    uint8 public numAddressesWhiteListed;

    constructor(uint8 _maxWhiteListedAddresses) {
        maxWhiteListedAddresses = _maxWhiteListedAddresses;
    }

    function addAddressToWhiteList() public {
        require(!whiteListedAddresses[msg.sender], "Sender has already been whitelisted");

        require(numAddressesWhiteListed < maxWhiteListedAddresses, "More addresses can't be added. Limit reached");

        whiteListedAddresses[msg.sender] = true;

        numAddressesWhiteListed += 1;
    }  
}