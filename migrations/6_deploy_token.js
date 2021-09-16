const TweetherToken = artifacts.require("TweetherToken")

module.exports = (deployer) => {
  deployer.deploy(TweetherToken)
}