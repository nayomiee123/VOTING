// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "./ERC20token.sol";

contract TokenGatedVoting {
    ERC20token public token;
    address public owner;
    uint256 public voteCost = 10 * 10**18;

    struct Proposal {
        uint256 id;
        string title;
        string description;
        uint256 voteCount;
    }

    Proposal[] public proposals;
    mapping(uint256 => mapping(address => bool)) public hasVoted;

    constructor(address _tokenAddress) {
        token = ERC20token(_tokenAddress);
        owner = msg.sender;
    }

    function createProposal(string memory _title, string memory _description) public {
        require(msg.sender == owner, "Only owner can create proposals");
        proposals.push(Proposal(proposals.length, _title, _description, 0));
    }

    function vote(uint256 _proposalId) public {
        require(_proposalId < proposals.length, "Invalid proposal");
        require(!hasVoted[_proposalId][msg.sender], "You already voted");

        require(token.transferFrom(msg.sender, address(this), voteCost), "Token transfer failed");

        proposals[_proposalId].voteCount += 1;
        hasVoted[_proposalId][msg.sender] = true;
    }

    function getWinner() public view returns (string memory title, uint256 votes) {
        uint256 winningVotes = 0;
        uint256 winnerId = 0;

        for (uint256 i = 0; i < proposals.length; i++) {
            if (proposals[i].voteCount > winningVotes) {
                winningVotes = proposals[i].voteCount;
                winnerId = i;
            }
        }

        return (proposals[winnerId].title, proposals[winnerId].voteCount);
    }
}
