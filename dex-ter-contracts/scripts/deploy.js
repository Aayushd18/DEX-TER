// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const { ethers } = require("hardhat");

async function main() {

  // deploying the OneX Token Contract
  const _oneXContract = await ethers.getContractFactory("OneX")
  const oneXContract = await _oneXContract.deploy()
  await oneXContract.deployed()
  console.log("OneX Contract Address: ", oneXContract.address)

  // deploying the DuoX Token Contract
  const _duoXContract = await ethers.getContractFactory("DuoX")
  const duoXContract = await _duoXContract.deploy()
  await duoXContract.deployed()
  console.log("DuoX Contract Address: ", duoXContract.address)

  // deploying the TriX Token Contract
  const _triXContract = await ethers.getContractFactory("TriX")
  const triXContract = await _triXContract.deploy()
  await triXContract.deployed()
  console.log("TriX Contract Address: ", triXContract.address)

  // deploying the SquadX Token Contract
  const _squadXContract = await ethers.getContractFactory("SquadX")
  const squadXContract = await _squadXContract.deploy()
  await squadXContract.deployed()
  console.log("SquadX Contract Address: ", squadXContract.address)

  // deploying the PentX Token Contract
  const _pentXContract = await ethers.getContractFactory("PentX")
  const pentXContract = await _pentXContract.deploy()
  await pentXContract.deployed()
  console.log("PentX Contract Address: ", pentXContract.address)

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .catch((error) => {
    console.error(error);
    process.exitCode = 1;
  }
);
