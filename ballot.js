var abi = require("./contract-abi/Ballot");
var fs = require("fs");
var path = require("path");
var web3 = require("web3");
web3 = new web3(new web3.providers.HttpProvider("http://localhost:8545"));

fs.readFile(path.join(__dirname,'/contract-bin/Ballot.bin'),(err,contents)=>{
	if (err) return console.log(err);
	var contractObject = web3.eth.contract(abi);
	contractObject.new(["Person1","Person2"],"title",{from:web3.eth.accounts[0],data:'0x'+contents,gas:440666},(err,contract)=>{
		if(err) return console.log(err);
		if(contract.address){
			/*contract.Voted((err,result)=>{
				if(err)console.log(err);
				else console.log(result);
			});*/
			contract.vote(0,{from:web3.eth.accounts[1]});
			contract.vote(1,{from:web3.eth.accounts[2]});
			contract.vote(0,{from:web3.eth.accounts[3]});
			contract.vote(0,{from:web3.eth.accounts[4]});
			contract.vote(1,{from:web3.eth.accounts[5]});

			console.log(web3.toAscii(contract.winner.call()));
		}
	})
});
