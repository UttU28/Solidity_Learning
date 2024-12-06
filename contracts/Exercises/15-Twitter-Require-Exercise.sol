// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// 1️⃣  Use require to limit the length of the tweet to be only 280 characters
// HINT: use bytes to length of tweet

contract Twitter {

    // define our struct
    uint16 constant maxTweetLength = 280;
    struct Tweet {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    // add our code
    mapping(address => Tweet[] ) public tweets;


    function createTweet(string memory _tweet) public {
        require(bytes(_tweet).length <= maxTweetLength, "Tweet too long bruv");

        Tweet memory newTweet = Tweet({
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });
        tweets[msg.sender].push(newTweet);
    }

    function getTweet(uint _i) public view returns (Tweet memory) {
        return tweets[msg.sender][_i];
    }

    function getAllTweets(address _owner) public view returns (Tweet[] memory ){
        return tweets[_owner];
    }

}