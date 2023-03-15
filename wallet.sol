//SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract wallet2{
    mapping(address=>uint) public paisa;

    function deposit()  public payable{
        paisa[msg.sender]+=msg.value;
    }
    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function withDrawAll(address payable to) public {
        uint  balance = paisa[msg.sender];
        paisa[msg.sender]=0;
        to.transfer(balance);      
    }

    function withdrawSome(address payable to,uint amnt) public{
        if(amnt<paisa[msg.sender])
        {
            paisa[msg.sender]-=amnt;
            to.transfer(amnt);
        }
        
    }
}
