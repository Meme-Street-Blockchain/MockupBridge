async function main() {
    const [deployer] = await ethers.getSigners();
  
    console.log("Deploying contracts with the account:", deployer.address);
  
    console.log("Account balance:", (await deployer.getBalance()).toString());
  
    // const Token = await ethers.getContractFactory("Apple");
    // const token = await Token.deploy();
  
    // console.log("Token address:", token.address);
    const Vault = await ethers.getContractFactory("Vault");
    const vault = await Vault.deploy();
  
    console.log("Vault address:", vault.address);
    // const WrapSochain = await ethers.getContractFactory("WrapSochain");
    // const wrapSochain = await WrapSochain.deploy();
    
    // console.log("WrapSochain address:", wrapSochain.address);
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });