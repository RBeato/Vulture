const HDWalletProvider = require("@truffle/hdwallet-provider");
require('dotenv').config()  // Store environment-specific variable from '.env' to process.env

const mneunomic = process.env.MNENOMIC;
const infuraProjectId = process.env.INFURA_API_KEY;

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1", // localhost
      port: 7545,
      network_id: "*",
    },
    // development: {
    //   host: "192.168.1.79",
    //   port: 7545,
    //   network_id: "*",
    // },
    // testnets
    // properties
    // network_id: identifier for network based on ethereum blockchain. Find out more at https://github.com/ethereumbook/ethereumbook/issues/110
    // gas: gas limit
    // gasPrice: gas price in gwei
    // ropsten: {
    //   provider: () => new HDWalletProvider(mneunomic, "https://ropsten.infura.io/v3/" + process.env.INFURA_API_KEY),
    //   network_id: 3,
    //   gas: 3000000,
    //   gasPrice: 10000000000
    // },
    // kovan: {
    //   provider: () => new HDWalletProvider(mneunomic, "https://kovan.infura.io/v3/" + process.env.INFURA_API_KEY),
    //   network_id: 42,
    //   gas: 3000000,
    //   gasPrice: 10000000000
    // },
    // rinkeby: {
    //   provider: () => new HDWalletProvider(mneunomic, "https://rinkeby.infura.io/v3/" + infuraProjectId),
    //   network_id: 4,
    //   gas: 3000000,
    //   gasPrice: 10000000000
    // },
    // // main ethereum network(mainnet)
    // main: {
    //   provider: () => new HDWalletProvider(mneunomic, "https://mainnet.infura.io/v3/" + process.env.INFURA_API_KEY),
    //   network_id: 1,
    //   gas: 3000000,
    //   gasPrice: 10000000000
    // }
  },
  // contracts_directory: './src/contracts/',
  // contracts_build_directory: './src/abis/',
  compilers: {
    solc: {
      version: "0.8.3",
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  }
}