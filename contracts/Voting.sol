// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    Candidate[] public candidates;
    address public owner;
    address[] public voterAddresses;  // List of voter addresses
    mapping(address => bool) public hasVoted;

    uint256 public votingStart;
    uint256 public votingEnd;

    modifier onlyOwner {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    modifier votingOpen {
        require(block.timestamp >= votingStart && block.timestamp < votingEnd, "Voting is not open");
        _;
    }

    modifier hasNotVoted {
        require(!hasVoted[msg.sender], "You have already voted");
        _;
    }

    constructor(string[] memory _candidateNames, uint256 _durationInMinutes) {
        for (uint256 i = 0; i < _candidateNames.length; i++) {
            candidates.push(Candidate({ name: _candidateNames[i], voteCount: 0 }));
        }
        owner = msg.sender;
        votingStart = block.timestamp;
        votingEnd = block.timestamp + (_durationInMinutes * 1 minutes);
    }

    function addCandidate(string memory _name) public onlyOwner votingOpen {
        candidates.push(Candidate({ name: _name, voteCount: 0 }));
    }

    function vote(uint256 _candidateIndex) public votingOpen hasNotVoted {
        require(_candidateIndex < candidates.length, "Invalid candidate index");

        candidates[_candidateIndex].voteCount++;
        hasVoted[msg.sender] = true;
        voterAddresses.push(msg.sender); // Add voter address to the list
    }

    function getAllVotesOfCandidates() public view returns (Candidate[] memory) {
        return candidates;
    }

    function getVoterAddresses() public view onlyOwner returns (address[] memory) {
        return voterAddresses;
    }

    function getVotingStatus() public view returns (bool) {
        return (block.timestamp >= votingStart && block.timestamp < votingEnd);
    }

    function getRemainingTime() public view returns (uint256) {
        require(block.timestamp >= votingStart, "Voting has not started yet");
        if (block.timestamp >= votingEnd) {
            return 0;
        }
        return votingEnd - block.timestamp;
    }
}
