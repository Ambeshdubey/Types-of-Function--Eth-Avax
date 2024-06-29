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

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }
}
