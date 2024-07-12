# AmbeshToken

## Overview

The `AmbeshToken` contract is an ERC20-compliant token written in Solidity. It serves as a basic example of creating a custom ERC20 token on the Ethereum blockchain using OpenZeppelin's ERC20 implementation. The contract includes functionalities for token creation, management by an admin, and token transfer and destruction.

## Description

The `AmbeshToken` contract extends the ERC20 standard and includes:
- Initialization of token name ("Ambesh") and symbol ("AMB") during deployment.
- An admin address that has exclusive rights to mint tokens to specified addresses (`createTokens`).
- A function to burn tokens (`destroyTokens`) owned by the caller.

This contract demonstrates fundamental ERC20 token functionalities such as minting, burning, and ownership management.

## Getting Started

### Executing Program

To interact with this contract, follow these steps using Remix, an online Solidity IDE:

1. **Access Remix:**
   - Go to [Remix IDE](https://remix.ethereum.org/).

2. **Create and Save File:**
   - Click on the "+" icon in the left-hand sidebar to create a new file.
   - Save the file with a .sol extension (e.g., `AmbeshToken.sol`).

3. **Code:**
   - Write the provided Solidity code into the file:

     ```solidity
       // SPDX-License-Identifier: MIT
      pragma solidity ^0.8.0;

       import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

      contract AmbeshToken is ERC20 {
     address admin;

     constructor() ERC20("Ambesh", "AMB") {
        admin = msg.sender;
        _mint(address(this), 100 * 10 ** decimals());
     }
    
     modifier onlyAdmin() {
        require(msg.sender == admin, "This does not belong to the owner");
        _;
     }

     function createTokens(address recipient, uint256 quantity) public onlyAdmin {
        uint balance = balanceOf(address(this));
        require(balance >= quantity, "Not sufficient balance");
        _transfer(address(this), recipient, quantity);
     }

     function destroyTokens(uint256 amount) public {
        _burn(msg.sender, amount);
     }

     function mint(address account, uint256 amount) public onlyAdmin {
        _mint(account, amount);
     }

     function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
     }
     }

     ```

4. **Compile Code:**
   - Switch to the "Solidity Compiler" tab in Remix.
   - Set the "Compiler" option to "0.8.0" (or another compatible version).
   - Click on "Compile AmbeshToken.sol" to compile the contract.

5. **Deploy Contract:**
   - Navigate to the "Deploy & Run Transactions" tab in Remix.
   - Select the "AmbeshToken" contract from the dropdown menu.
   - Click on the "Deploy" button to deploy the contract.

6. **Interact with Contract:**
   - Once deployed, interact with the contract:
     - Use the `createTokens` function to mint tokens to a recipient address.
     - Use the `destroyTokens` function to burn tokens owned by the caller.

## Authors

- Ambesh Dubey

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
