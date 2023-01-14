const Sample = artifacts.require("Sample");
const Storage = artifacts.require("Storage");
const Crud = artifacts.require("Crud");

module.exports = function(_deployer) {
  _deployer.deploy(Sample);
  _deployer.deploy(Storage);
  _deployer.deploy(Crud);
};
