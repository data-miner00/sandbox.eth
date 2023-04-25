import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { getSigners, unitLendingFixture } from "../testutils/fixtures";
import { Mocks, Signers } from "../testutils/types";
import { BigNumber, ethers } from "ethers";
import { expect } from "chai";
import { parseEther } from "ethers/lib/utils";

describe("Lending", () => {
  before(async function () {
    const { deployer, alice, bob } = await loadFixture(getSigners);

    this.signers = <Signers>{};
    this.signers.deployer = deployer;
    this.signers.alice = alice;
    this.signers.bob = bob;
  });

  beforeEach(async function () {
    const { lending, mockUsdc } = await loadFixture(unitLendingFixture);

    this.lending = lending;

    this.mocks = <Mocks>{};
    this.mocks.mockUsdc = mockUsdc;
  });

  describe("Deposits", function () {
    it("should revert if amount lesser than 0", function () {
      const amount = ethers.constants.Zero;
      const actual = this.lending
        .connect(this.signers.alice)
        .deposit(this.mocks.mockUsdc.address, amount);

      expect(actual).to.be.revertedWith(`NeedsMoreThanZero`);
    });

    it("should emit proper event", async function () {
      const amount: BigNumber = ethers.constants.One;

      const actual = this.lending
        .connect(this.signers.alice)
        .deposit(this.mocks.mockUsdc.address, amount);

      expect(actual)
        .to.emit(this.lending, `Deposit`)
        .withArgs(
          this.signers.alice.address,
          this.mocks.mockUsdc.address,
          amount
        );
    });

    it("should update storage variable properly", async function () {
      const previousAccountToTokenDeposits =
        await this.lending.s_accountToTokenDeposits(
          this.signers.alice.address,
          this.mocks.mockUsdc.address
        );

      const amount = parseEther("1");
      await this.lending
        .connect(this.signers.alice)
        .deposit(this.mocks.mockUsdc.address, amount);

      const currentAccountToTokenDeposits =
        await this.lending.s_accountToTokenDeposits(
          this.signers.alice.address,
          this.mocks.mockUsdc.address
        );

      expect(
        currentAccountToTokenDeposits,
        "New value should be the previous plus amount"
      ).to.be.equal(previousAccountToTokenDeposits.add(amount));
    });

    it("should revert with TransferFailed error", async function () {
      await this.mocks.mockUsdc.mock.transferFrom.returns(false);

      const amount = parseEther("1");
      const actual = this.lending
        .connect(this.signers.alice)
        .deposit(this.mocks.mockUsdc.address, amount);

      await expect(actual).to.be.revertedWithCustomError(
        this.lending,
        "TransferFailed"
      );
    });
  });
});
