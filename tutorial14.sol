pragma solidity ^0.4.0;

contract EtherTransferTo
{
    function () public payable
    {
    }
    
    function getBalance() public returns(uint)
    {
        return address(this).balance;
    }
}

contract EtherTransferFrom
{
    EtherTransferTo private _instance;
    
    constructor() public
    {
        _instance = new EtherTransferTo();
    }
    
    function getBalance() public returns(uint)
    {
        return address(this).balance;
    }
    
    function getBalanceOfInstance() public returns(uint)
    {
        return _instance.getBalance();
    }
    
    function () public payable
    {
        address(_instance).transfer(msg.value);
    }
}
