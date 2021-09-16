const utils = require('./utils')
const { assertVMException } = utils

const UserStorage = artifacts.require('UserStorage')
const UserController = artifacts.require('UserController')


contract('users', () => {

      it("can't create user without controller", async () => {
            const storage = await UserStorage.deployed()

            try {
              const tx = await storage.createUser(
                0x0,
                "tristan",
                "Tristan",
                "Edwards",
                "I like building stuff",
                "example@example.com"
              )
              assert.fail();
            } catch (err) {
              assertVMException(err);
            }
      })

      it("can create user with controller", async () => {
            const controller = await UserController.deployed()
        
            const tx = await controller.createUser(
              "tristan",
              "Tristan",
              "Edwards",
              "I like building stuff",
              "example@example.com"
            )
        
            assert.isOk(tx)
          })

      it("can get user", async () => {
            const storage = await UserStorage.deployed()
            const userId = 1

            //Get the userInfo array
            const userInfo = await storage.profiles.call(userId)

            //Get the second element (the userName)
            const username = web3.utils.toAscii(userInfo[1]).replace(/\u0000/g, '')

            assert.equal(username, "tristan")
      });

})