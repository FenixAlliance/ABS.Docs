# Working with the BlockChains Service on the Alliance Business Suite.

Built-in to the Alliance Business Platform is the ability to connect your business applications to both public/private Ethereum nodes while simplifying smart contract management and interaction with nodes like Geth, Parity, Quorum, Besu, and more.

## Features
- [New, Alpha] NFTs Support.
- ABS Wallet Service integration.
- HD Wallet creation and management.
- Alliance Business Model integration.
- JSON RPC / IPC Ethereum core methods.
- Geth management API (admin, personal, debugging, miner).
- Parity management API.
- Quorum integration.
- Besu integration.
- Simplified smart contract interaction for deployment, function calling, transaction and event filtering and decoding of topics.
- Blockchain processing.
- ABI to .Net type encoding and decoding, including attribute-based for complex object deserialisation (nethereum-abi-encoding.md).
- Rules engine.
- HD Wallet integration.
- Transaction, RLP, and message signing, verification, and recovery of accounts.
- Integrated TestRPC testing to simplify TDD and BDD (Specflow) development.
- Key storage using Web3 storage standard, compatible with Geth and Parity.
- Simplified account life cycle for both managed by a third-party client (personal) or stand-alone (signed transactions).
- Low-level Interception of RPC calls.
- Code generation of smart contracts services.

## Roadmap
The following features are to be expected in the near future:

- [ ] ABS SDK Support.
- [ ] Unity 3D Integration (ABS SDK).


## Working with NFT Support
NFT stands for non-fungible token. This quote from ethereum.org explains it well:

_"NFTs are tokens that we can use to represent ownership of unique items. They let us tokenize things like art, collectibles, even real estate. They can only have one official owner at a time and they're secured by the Ethereum blockchain – no one can modify the record of ownership or copy/paste a new NFT into existence."_

### What is an NFT standard or ERC-721?
The ERC-721 is the most common NFT standard. If your Smart Contract implements certain standardized API methods, it can be called an ERC-721 Non-Fungible Token Contract.

These methods are specified in the EIP-721. Open-sourced projects like OpenZeppelin have simplified the development process by implementing the most common ERC standards as a reusable library.

### What is minting an NFT?
By minting an NFT, you publish a unique token on a blockchain. This token is an instance of your Smart Contract.

Each token has a unique token URI, which contains metadata of your asset in a JSON file that conforms to a certain schema. The metadata is where you store information about your NFT, such as name, image, description, and other attributes.

An example of the JSON file for the "ERC721 Metadata Schema" looks like this:

```json 
{
	"attributes": [
		{
			"trait_type": "Shape",
			"value": "Circle"
		},
		{
			"trait_type": "Mood",
			"value": "Sad"
		}
	],
	"description": "A sad circle.",
	"image": "https://i.imgur.com/Qkw9N0A.jpeg",
	"name": "Sad Circle"
}
```

### How is NFT's metadata stored?
There are three main ways to store an NFT's metadata.


First, store the information on-chain. In other words, you can extend your ERC-721 and store the metadata on a blockchain, which can be costly.

The second method is to use IPFS. And the third way is to simply have your API return the JSON file.

The Alliance Business Suite can use a combination of these methods when creating NFTs, preventing actors to temper the underlying JSON file.

### How to View the NFT in your Metamask Wallet

You need to start by downloading the mobile version of Metamask. Then, log into your account.

Your Wallet Account should be connected to MetaMask to view your NFTs, and the network should point to your Alliance Business Suite.

You should see an NFTs tab along with an add NFT button. Click on the button and enter the address of your Smart Contract along with the ids that you have minted. If you have followed the tutorial, you should start with an id of 1.

<IMG  src="https://www.freecodecamp.org/news/content/images/2021/10/IMG_0376.jpeg"  alt="IMG_0376"/>
