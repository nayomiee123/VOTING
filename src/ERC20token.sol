// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {ERC20} from "../lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";


contract ERC20token is ERC20 {
     uint256 public totalsupply = 1000000 * 10 ** 18;

    constructor(
        string memory _name,
        string memory _symbol
    ) ERC20 (_name, _symbol) {
        mint();
    }

    function mint() public{
        _mint(msg.sender, totalsupply);
    }

}