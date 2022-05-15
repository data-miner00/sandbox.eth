const Transaction = artifacts.require("Transaction");

contract("Transaction", () => {
  it("Should deploy smart contract properly", async () => {
    const transaction = await Transaction.deployed();

    /*
     *  deployed() does not deploy a contract by itself. It only
     *  returns a js object pointing to an already deployed smart
     *  contract.
     *
     *  Migrations are the one used to deploy a smart contract.
     */

    console.log(`  Address: ${transaction.address}`);

    // If empty means not deployed
    assert(transaction.address != "");
  });
});
