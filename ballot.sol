pragma solidity ^0.4.2;

contract Ballot{
		address owner;
		string title;
		event Voted(address user);

		struct Proposal{
			bytes32 name;
			uint voteCount;
		}

		Proposal[] proposals;
		mapping(address=>bool)voters;

		function Ballot(bytes32[]names,string _title){
			owner = msg.sender;
			title = _title;
			for(uint i=0; i< names.length; i++){
				proposals.push(Proposal({name:names[i],voteCount:0}));
			}
		}

		function winner()returns(bytes32 winnerName){
			uint highestVote = 0;
			for (uint i=0; i<proposals.length;i++){
				if(proposals[i].voteCount>highestVote){
					highestVote = proposals[i].voteCount;
					winnerName = proposals[i].name;
				}
			}
		}

		function vote(uint votingFor){
			if(voters[msg.sender]) return;
				voters[msg.sender] = true;
				proposals[votingFor].voteCount++;
				Voted(msg.sender);

		}
}