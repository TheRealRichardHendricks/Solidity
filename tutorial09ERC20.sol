pragma solidity ^0.4.0;

interface ERC20
{
    function totalSupply() constant returns(uint _totalSupply);                             //ukupna ponuda
    function balanceOf(address _owner) constant returns(uint balance);                      //bilans stanja
    function transfer(address _to, uint _value) returns(bool success);                      //transakcija
    function transferFrom(address _from, address _to, uint _value) returns(bool success);   //transakcija od
    function approve(address _spender, uint _value) returns(bool success);                  //odobrenje
    function allowance(address _owner, address _spender) constant returns(uint remaining);  //dzeparac, naknada za sumnjive racune
    event Transfer(address indexed _from, address indexed _to, uint _value);
    event Approval(address indexed _owner, address indexed _spender, uint _value);
}
