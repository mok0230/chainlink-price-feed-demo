const EthUsdTracker = require("../artifacts/contracts/EthUsdTracker.sol/EthUsdTracker.json");

async function main() {
  const CONTRACT_ADDRESS = "0xb7A363Fe1C464F95DC3D135d33C2De74f1F75c26";
  
  const [signer] = await ethers.getSigners();

  console.log('EthUsdTracker', EthUsdTracker);

  const contract = await ethers.getContractAt(EthUsdTracker.abi, CONTRACT_ADDRESS, signer);

  console.log("contract", contract);
  console.log("contract.hasPriceIncreased()", await contract.hasPriceIncreased());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
});