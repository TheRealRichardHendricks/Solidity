pragma solidity ^0.4.0;

library Strings
{
    function concat(string _base, string _value) internal returns(string)
    {
        //zelimo kastovati string u bajt..to mozemo jer se ta dva tipa cuvaju identicno u memoriji
        //bytes _baseBytes = bytes(_base); za ovo ce javiti gresku jer ovde mora da mu se eksplicitno navede "storage type" of bytes, to jest kako i gde ce ih pamtiti
        bytes memory _baseBytes = bytes(_base); //postoji 3 storage tipa: storage, memory, stack
        bytes memory _valueBytes = bytes(_value);
        
        string memory _tmpValue = new string(_baseBytes.length + _valueBytes.length);
        bytes memory _newValue = bytes(_tmpValue);
        
        uint i;
        uint j;
        
        for(i=0;i<_baseBytes.length;i++)
        {
            _newValue[j++] = _baseBytes[i];
        }
        for(i=0;i<_valueBytes.length;i++)
        {
            _newValue[j++] = _valueBytes[i];
        }
        
        return string(_newValue);
    }
    
    function strpos(string _base, string _value) returns(int)   //vraca poziciju pocetka stringa _value u stringu _base
    {
        bytes memory _baseBytes = bytes(_base);
        bytes memory _valueBytes = bytes(_value);
        
        assert(_valueBytes.length == 1);
        
        for(uint i=0;i<_valueBytes.length;i++)
        {
            if(_baseBytes[i] == _valueBytes[0])
            {
                return (int)i;
            }
        }
        
        return -1;
    }
}
