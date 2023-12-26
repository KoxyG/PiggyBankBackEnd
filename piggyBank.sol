// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


contract PiggyBank {

    event Deposit(uint amount);
    event Withdraw(uint amount);
    
    address payable[]  myPiggy;
    address public owner = msg.sender;


    function deposit () external payable {
        require(msg.value > .0001 ether, "cannot deposit zero amount");

         myPiggy.push(payable(msg.sender));

         emit Deposit(msg.value);
    }

    function withdraw() external {
        require(msg.sender == owner, "You are not the owner, stop stealing!");

       payable(owner).transfer(address(this).balance);

       emit Withdraw(address(this).balance);

        // reset the state. of the contract
        myPiggy = new address payable[](0);
    }

    function getBalance() external view returns(uint) {
        return(address(this).balance);
    }
}

