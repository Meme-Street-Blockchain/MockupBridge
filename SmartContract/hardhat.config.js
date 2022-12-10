require("@nomicfoundation/hardhat-toolbox");
require('dotenv').config();
/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.17",
  networks: {
    // sochain: {
    //   url: "http://192.248.170.227:8545/",
    //   accounts: [process.env.PRIV_KEY]
    // },
    bsctestnet:{
      url: "https://data-seed-prebsc-1-s2.binance.org:8545",
      accounts: [process.env.PRIV_KEY],
      gasPrice: 10000000000,
      blockGasLimit: 1000000
    }

  }, etherscan: {
    apiKey: process.env.API_KEY,
    // customChains: [
    //   {
    //     network: "sochain",
    //     chainId: 15123,
    //     urls: {
    //       apiURL: "http://192.248.170.227:4000/api",
    //       browserURL: "http://192.248.170.227:4000/"
    //     }
    //   }
    // ]
  }
};
