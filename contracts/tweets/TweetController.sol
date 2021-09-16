// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import '../helpers/BaseController.sol';
import '../ContractManager.sol';
import './TweetStorage.sol';
import "../users/UserStorage.sol";

contract TweetController is BaseController {

    function createTweet(string memory _text) public returns(uint) {
    ContractManager _manager = ContractManager(managerAddr);

    address _userStorageAddr = _manager.getAddress("UserStorage");
    UserStorage _userStorage = UserStorage(_userStorageAddr);
    
    // Get the user ID from the address
    uint _userId = _userStorage.addresses(msg.sender);

    // Make sure the user ID isn't null
    require(_userId != 0);

    address _tweetStorageAddr = _manager.getAddress("TweetStorage");
    TweetStorage _tweetStorage = TweetStorage(_tweetStorageAddr);

    return _tweetStorage.createTweet(_userId, _text);
  }

}
