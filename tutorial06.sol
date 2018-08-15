pragma solidity ^0.4.0;

contract DataTypes
{
    bool myBool = false;  //ili true
    
    int8 myInt = -128;  //signed integer duzine 8 bajtova  (od 127 do -128)
    int256 myInt1;  //oznaceni integer(i pozitivni i negativni brojevi) duzine 256 bajtova
    uint128 myUint1;  //neoznaceni integer(samo pozitivni brojevi) duzine 128 bajtova
    uint8 myUint = 255;  //unsigned integer duzine 8 bajtova  (od 0 do 255)
    
    string myString;
    uint8[] myStringArr;
    
    byte myValue;
    bytes1 myValue1;  //postoji bytes0
    bytes32 myValue32;  //max, nema bytes33
    
//    fixed myFixed;  //fixed point number NIJE ISTO sto i floating point number
//    fixed256x8 myFixed1 = 1;  //255.0
//    ufixed myFixed2 = 1;
// nisu skroz implmentirani jos uvek


    enum Action {ADD, REMOVE, UPDATE}
    
    Action myAction = Action.ADD;
//    Action myAction1 = 0;   //za ovo javlja gresku, nema te int konverzije kao u C#, Javi itd.


    
    address myAddress;
    
    function assignAddress()
    {
        myAddress = msg.sender;  //dobija vrednost adrese korisnika koji salje etre
        //ima i neke ugradjene metode, kao na primer
        myAddress.balance;
        myAddress.transfer(10);
    }
 
 
 //nizovi
 
    uint[] myIntArr = [1,2,3]; 
    
    function arrFunc()
    {
        myIntArr.push(4);  //1,2,3,4
        myIntArr.length;  //4
        myIntArr[0];  //1
    }
    
    uint[10] myFixedArr;  //za vise od 10 clanova javlja OutOfBounds Exception
    
    
    
 //strukture
 
    struct Account
    {
        uint balance;
        uint dailyLimit;
    }
    
    Account myAccount;
    
    function structFunc() 
    {
        myAccount.balance;
        myAccount.dailyLimit = 100;
    }
    
    
    
 //mapping
 
    mapping (address => Account) _accounts;
    
    function () payable
    {
        _accounts[msg.sender].balance == msg.value;
    }
    
    function getBalance() returns(uint)
    {
        return _accounts[msg.sender].balance;
    }
}
