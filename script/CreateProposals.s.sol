// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "forge-std/Script.sol";
import "../src/TokenGatedVoting.sol";

contract CreateProposals is Script {
    function run() external {
        uint256 deployerPrivateKey = 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80;

        vm.startBroadcast(deployerPrivateKey);

        TokenGatedVoting voting = TokenGatedVoting(0x5FbDB2315678afecb367f032d93F642f64180aa3);

        // Create proposals
        voting.createProposal("Nursing Skills Workshop", "Run practical workshops to teach students essential nursing skills like first aid and basic patient care.");
        voting.createProposal("Volunteer Nursing Visits", "Organize volunteers to visit elderly or sick community members to provide care and companionship.");
        voting.createProposal("Community Health Awareness Campaigns", "Launch campaigns to educate the community about important health topics such as hygiene, nutrition, and disease prevention.");
        
        
        vm.stopBroadcast();
    }
}
