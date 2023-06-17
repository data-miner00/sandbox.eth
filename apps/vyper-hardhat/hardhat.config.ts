import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "@nomiclabs/hardhat-vyper";
import "@nomiclabs/hardhat-ethers";

const config: HardhatUserConfig = {
  vyper: {
    compilers: [{ version: "0.3.0" }],
  },
  paths: {
    artifacts: "../../dist/hardhat-vyper/artifacts",
  },
};

export default config;
