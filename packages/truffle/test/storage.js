const Storage = artifacts.require("Storage");

contract("Storage", () => {
  let storage = null;

  before(async () => {
    storage = await Storage.deployed();
  });

  it("Should add an element to ids array", async () => {
    await storage.add(10);
    const result = await storage.ids(0);
    assert(result.toNumber() === 10);
  });

  it("Should get an element of the ids array", async () => {
    await storage.add(20);
    const result = await storage.get(1);
    assert(result.toNumber() === 20);
  });

  it("Should get the ids array", async () => {
    const rawIds = await storage.getAll();
    const ids = rawIds.map((id) => id.toNumber());
    assert.deepEqual(ids, [10, 20]);
  });

  it("Should get the correct length", async () => {
    const length = await storage.length();
    assert(length.toNumber() === 2);
  });
});
