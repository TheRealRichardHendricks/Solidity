pragma solidity ^0.4.0;

// Nista posebno ovaj tutorijal, samo da se uporedi koliko gasa je potrebno za execute za external tj public

contract ExternalContract
{
    function externalCall(string x) external returns(uint)
    {
        return 123;
    }
    
    function publicCall(string x) public returns(uint)
    {
        return 123;
    }
}
