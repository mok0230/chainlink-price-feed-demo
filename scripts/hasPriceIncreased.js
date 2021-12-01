const EthUsdTracker = require("../artifacts/contracts/EthUsdTracker.sol/EthUsdTracker.json");

async function main() {
  const [signer] = await ethers.getSigners();

  console.log('EthUsdTracker', EthUsdTracker);

  const contract = await ethers.getContractAt(EthUsdTracker.abi, "0xb6455202577bd699A4d96fFAFA414F8041951857", signer);

  console.log("contract", contract);
  console.log("contract.hasPriceIncreased()", await contract.hasPriceIncreased());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
});