// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Owned {
    address public ownerAddr;

    constructor() {
        ownerAddr = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == ownerAddr, "sender must be owner");
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        require(_newOwner != address(0),"newOwner must not be address(0)");
        
        ownerAddr = _newOwner;
    }
}
