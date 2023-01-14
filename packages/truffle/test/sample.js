const Sample = artifacts.require("Sample");

contract("Sample", () => {
  it("Should return hello world", async () => {
    const sample = await Sample.deployed();
    const result = await sample.hello();

    assert(result === "Hello World");
  });

  it("Should set the value of data variable", async () => {
    const sample = await Sample.deployed();
    await sample.set("this");
    const result = await sample.get();
    assert(result === "this");
  });
});
