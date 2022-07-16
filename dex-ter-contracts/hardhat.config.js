require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config({ path: ".env" });

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.4",
  networks: {
    mumbai: {
      url: ALCHEMY_URL,
      accounts: [PRIVATE_KEY],
    }
  },
  etherscan: {
    apiKey: POLYGON_API
  }
};
