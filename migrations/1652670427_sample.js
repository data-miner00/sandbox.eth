const Sample = artifacts.require("Sample");
const Storage = artifacts.require("Storage");

module.exports = function(_deployer) {
  _deployer.deploy(Sample);
  _deployer.deploy(Storage);
};
