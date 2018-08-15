pragma solidity ^0.4.0;

contract Transaction  //primer bez ikakvih dodatnih funkcija, samo za slanje etera u wallet
{
    //each contract has an ethereum address!!!   preko this address se cekira adesa ovog konkretnog kontrakta
    
    
    event SenderLogger(address);
    event ValueLogger(uint);
    
    address private owner;
    
    modifier isOwner
    {
        require(owner == msg.sender);
        _;
    }
    
    modifier validValue
    {
        assert(msg.value >= 1 ether);   //za transakcije manje od ove ce javljati gresku
        _;
    }
    
    function Transaction()  //konstruktor
    {
        owner = msg.sender;
    }
    
    function () payable isOwner validValue  //fallback function je ovo
    {
        SenderLogger(msg.sender);
        ValueLogger(msg.value);
    }
}
