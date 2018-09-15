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
        assembly {                                //asemblerski isecak
            let i:= 0
            loop:
                i:= add(i, 1)                     //i++
                _r:= add(_r, 1) 
                jumpi(loop, lt(i, 10))            //lt je less than(manje od, < )
        }
    }
    
    
    /** U Soliditiju ne postoji CASE paradigma
     * caseom mozemo programirati samo iz asemblera */
    
     function nativeConditional(uint _v) public returns(uint)
     {
         if(5 == _v)
         {
             return 55;
         }
         else if (6 == _v)
         {
             return 66;
         }
         return 11;
     }
     
     function asmConditional(uint _v) public returns(uint _r)
     {
         assembly {
             switch _v
             case 5 {
                 _r:= 55
             }
             case 6 {
                 _r:= 66
             }
             default {
                 _r:= 11
             }
         }
     }
     
     
     /** return u asembleru je u stvari pointer na memoriju
      * msize vraca koliko je memorije alocirano, kolika je memorija bloka za nas program */
      
      function asmReturns(uint _v) public returns(uint)
      {
          assembly {
              let _ptr:= add(msize(), 1)
              mstore(_ptr, _v)
              return(_ptr, 0x20)
          }
      }
}
