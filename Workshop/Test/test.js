"use strict";

function Player (name, age, _rank) {
	var rank; // private
	this.name = name; // public
	this.age = age; // public
	rank = _rank;
	this.playerInfo = function () {
		console.log("PlayerInfo - Name: ", this.name, ", Age: ", this.age, ", Rank: ", rank);
	};
}

Player.prototype.info = function() { // static
	console.log("info - Name: ", this.name, ", Age: ", this.age, ", Rank: ", this.rank);
};

var bob = new Player("Bob", 23, 5);
bob.playerInfo();
bob.info();
console.log(bob.name, bob.rank);