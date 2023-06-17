import { ethers } from "hardhat";

async function main() {
  const greeterContract = await ethers.getContractFactory("Greeter");
  const greeter = await greeterContract.deploy("My Vyper Example");

  await greeter.deployed();

  console.log("Contract deployed to:", greeter.address);
  console.log("Contract greet():", await greeter.greet());
  console.log(
    "Contract setGreeting('Vyper is better'):",
    await greeter.setGreeting("Vyper is better")
  );
  console.log("Contract greet():", await greeter.greet());
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
