# Blockchain Powered Voting App

## Description

The application proposed is a secure and innovative platform to transform the traditional voting process by integrating the blockchain technology with a simple, yet effective, interface. The system provides a verifiable and tamper-proof record of votes, while ensuring the integrity of the voting process. It addresses the voting accessibility issue of disabled or isolated individuals, the transparency of the voting process, as all votes are viewed as public, immutable transactions on a public, well-known blockchain and security of the voting process. The decentralized voting system is deployed on the Ethereum-compatible Volta network, provided by energyweb and it leverages smart contracts to ensure the transparency, security and integrity of the voting process. 

The user registration is facilitated by using Metamask as wallet. Metamask is an Ethereum wallet which provides a user-friendly and secure interface, therefore easing the participation in the election process. 

The smart contract used in the application is written in Solidity, a curly-bracket language designed for Ethereum. It is responsible of voter authentication, candidate registration, voting and results retrieval and it is also responsible of enforcing the election’s rules, such as no multiple voting, or voting within the timelimit. The smart contract implementation also allows for retrieving the candidates list and their respective vote counts. 

The interface of the application is developed using HTML and JavaScript in order to provide an intuitive experience. 

This voting system highlights the potential of blockchain technology in improving the integrity of the democratic process of voting. It underscores the power of using smart contracts in complex processes, while also reducing the need of intermediaries and single points of failure. Using the Volta network, the application makes use of its scalability and cost-effective environment for decentralized applications (dApps). 

To install all dependencies, run
```shell
npm install
```

To compile and deploy the smart contract use:
```shell
npx hardhat compile
npx hardhat run --network volta scripts/deploy.js
```

After the contract is deployed, the contract binary interface (ABI) must be copied from /artifacts/contracts/Voting.json (artifacts generated at deploy) to main.js file
To run the project follow the instructions:
```shell
# Before running the private key and contract address need to be pasted in the .env file
# The contract address must also be copied in the main.js file

# To start the project, which will run on localhost:3000
npm start

# You can also use the following command
node index.js
```
