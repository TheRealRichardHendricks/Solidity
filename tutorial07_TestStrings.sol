pragma solidity ^0.4.0;

import "browser/Strings.sol";

contract TestStrings
{
    using Strings for string;
    
    function testConcat(string _base) returns(string)
    {
        return _base.concat("_rakic");  //radi, ovamo u testu sam ukucao "andrej" i vratilo je andrej_rakic
    }
    
    function needleInMaystack(string _base) returns(uint)
    {
        return _base.strpos("t");
    }
}
