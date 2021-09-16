// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "../helpers/BaseStorage.sol";

contract TweetStorage is BaseStorage {
    mapping(uint256 => Tweet) public tweets;
    mapping(uint256 => uint[]) userTweetIds;
    uint[] public tweetIds;


    struct Tweet {
        uint256 id;
        string text;
        uint256 userId;
        uint256 postedAt;
    }

    uint256 latestTweetId = 0;

    function createTweet(uint256 _userId, string memory _text)
        public
        onlyController
        returns (uint256)
    {
        latestTweetId++;

        tweets[latestTweetId] = Tweet(latestTweetId,_text,_userId,block.timestamp);
        userTweetIds[_userId].push(latestTweetId);
        tweetIds.push(latestTweetId);

        return latestTweetId;
    }

    function getTweetIdsFromUser(uint _userId) view public returns(uint[] memory) {
        return userTweetIds[_userId];
  }

  function getNumTweets() view public returns(uint _numTweets) {
    return tweetIds.length;
  }


}
