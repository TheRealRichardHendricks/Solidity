pragma solidity ^0.4.0;

contract Assembly
{
    function nativeLoops() public returns(uint _r)
    {
        for(int i = 0; i < 10; i++)
        {
            _r++;
        }
    }
    
    function asmLoops() public returns(uint _r)
    {
        assembly {                                // asemblerski isecak
            let i:= 0
            loop:
                i:= add(i, 1)                     // i++
                _r:= add(_r, 1) 
                jumpi(loop, lt(i, 10))            // lt je less than(manje od, < )
        }
    }
    
    function inlineAsmLoops() public returns(uint _r)
    {
        assembly {                                // simulira rad steka
            0                                     // push(0); vrednost i
            10
            
            loop:
            
            dup2                                  // i:= add(i, 1)
            1 
            add
            swap2
            pop
            
            
            dup3                                  // _r:= add(_r, 1)
            1 
            add 
            swap3 
            pop
            
            
            dup1                                  // lt(i, 10)
            dup3
            lt
            
            
            loop                                  // jumpi(loop, lt(i, 10)) 
            pop
            
            
            pop
            pop
        }
    }
}
