// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "../helpers/BaseStorage.sol";

contract UserStorage is BaseStorage {
    mapping(uint256 => Profile) public profiles; //public generates getter automatically
    mapping (address => uint) public addresses;
    mapping (bytes32 => uint) public usernames;

    struct Profile {
        uint256 id;
        bytes32 username;
        bytes32 firstName;
        bytes32 lastName;
        string bio;
        string gravatarEmail;
        //"If you can limit the length to a certain number of bytes,
        // always use one of bytes1 to bytes32 because they are much cheaper."
    }

    uint256 latestUserId = 0;

   function createUser(
    address _address,
    bytes32 _username,
    bytes32 _firstName,
    bytes32 _lastName,
    string memory _bio,
    string memory _gravatarEmail
  ) public onlyController returns(uint) {
    latestUserId++;  

    profiles[latestUserId] = Profile(
      latestUserId, 
      _username,
      _firstName,
      _lastName,
      _bio,
      _gravatarEmail
    );

    addresses[_address] = latestUserId;
    usernames[_username] = latestUserId;

    return latestUserId;
  }

}