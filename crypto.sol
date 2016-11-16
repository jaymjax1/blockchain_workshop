pragma solidity ^0.4.2;

contract myCryptoCurrency{
	
	address owner;
	mapping(address=>uint)accounts;

	//constructor
	function myCryptoCurrency(){
		owner = msg.sender;
	}

	function register(){
		accounts[msg.sender] = 5000;
	}

	function getBalance()returns(uint){
		return accounts[msg.sender];
	}

	function transfer(address to, uint amount){
		if (accounts[msg.sender]<amount) return;
		accounts[to] += amount;
		accounts[msg.sender] -= amount;

	}

	function updateBalance(address user, uint amount){
		if(owner != msg.sender)return;
		accounts[user] =+ amount;

		}

	}




