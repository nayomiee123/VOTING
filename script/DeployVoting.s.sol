// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "forge-std/Script.sol";
import "../src/TokenGatedVoting.sol";

contract DeployVoting is Script {
    function run() external {
        
        uint256 deployerPrivateKey = 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80;

        vm.startBroadcast(deployerPrivateKey);

        
        address tokenAddress = 0x5FbDB2315678afecb367f032d93F642f64180aa3;

        // Deploy the voting contract
        TokenGatedVoting voting = new TokenGatedVoting(tokenAddress);

        vm.stopBroadcast();
    }
}
