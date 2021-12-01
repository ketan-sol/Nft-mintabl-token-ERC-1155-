// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC1155, Ownable {

    uint256[] supply = [10, 20, 30];
    uint256[] minted = [0, 0, 0];
    constructor() ERC1155("https://xyz.mysite.com/tokens{id}") {}

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function mint(uint256 id, uint256 amount)
        public
        
    {
        require(id <= supply.length, "Token doesnt exist");
        require(id > 0, "Token doesnt exist");
        uint256 index = id - 1;         //tokenid starts  from 1 while array starts from 0
        require(minted[index] + amount <= supply[index], "Not enough supply");
        _mint(msg.sender, id, amount, '');
        minted[index] = minted[index] + amount;
    }

}
