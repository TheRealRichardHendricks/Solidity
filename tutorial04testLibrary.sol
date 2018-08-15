pragma solidity ^0.4.0;

import "browser/library.sol";

//import "github.com/TheRealRichardHendricks/Solidity/MyFirstContract.sol"; //moze da se importuje i sa gita

/*contract UseLibraries is Libraries
{
   samo zbog primera 
}*/


contract TestLibrary
{
    using IntExtended for uint;  //sada svaki uint ima i funkcionalnosti iz IntExtended
    
    //using IntExtended for *; //ovo bi radilo za bilo koji tip...jer npr uint8 i uint nisu isto...ali bi takodje pokrilo i stringove itd.
    
    
    function testIncrement(uint _base) returns(uint)
    {
        return _base.increment();
    }
    
    function testDecrement(uint _base) returns(uint)
    {
        return _base.decrement();
    }
    
    function testIncrementByValue(uint _base, uint _value) returns(uint)
    {
        return _base.incrementByValue(_value);
    }
    
    function testDecrementByValue(uint _base, uint _value) returns(uint)
    {
        return _base.decrementByValue(_value);
    }
    
    function testIncrementStatic(uint _base) returns(uint)
    {
        return IntExtended.increment(_base);
    }
    
    function testDecrementStatic(uint _base) returns(uint)
    {
        return IntExtended.decrement(_base);
    }
}
