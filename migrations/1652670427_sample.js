const Sample = artifacts.require("Sample");

module.exports = function(_deployer) {
  _deployer.deploy(Sample);
};
