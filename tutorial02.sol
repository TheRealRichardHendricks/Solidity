pragma solidity ^0.4.0;   //biras verziju u kojoj ces raditi... 0.4.25 je trenutno najnovija 

interface Regulator  //interfejs kao u Javi ili C#
{
    function checkValue(uint amount) returns (bool);
    function loan() returns (bool);
}

contract Bank is Regulator   //nema kljucne reci implements vec je tu ponovo samo IS....kontrakt Bank implementira interfejs Regulator
{
    uint internal myInternalValue;  //internal=protected...ovde ide private, internal, public....ne treba za zadatak, stoji primera radi.
    
    uint private value;
    
    function Bank (uint amount)  //konstruktor
    {
        value = amount;
    }
    
    function deposit (uint amount)
    {
        value += amount;
    }
    function withdraw (uint amount)
    {
        if(checkValue(amount))
        {
            value -= amount;
        }
    }
    function balance() returns(uint)
    {
        return value;
    }
    
    function checkValue(uint amount) returns (bool)   //implementacija apstraktne funkcije iz intefejsa
    {
        return amount >= value;
    }
    function loan() returns (bool)
    {
        return value > 0;
    }
    
    
    //primer apstrakcije...ne treba za zadatak
    function loanExample() returns (bool); //u Soliditiju ne postoji kljucna rec abstract...apstraktne kotrakte pravimo ovako....s tim da u kontraktu koji nasledjuje apstraktni kontrakt, sve apstraktne funkcije MORAJU imati implementaciju, inace ce javljati gresku!
}

contract MyFirstContract is Bank(10)  //is=extends...to jest MyFirstContract nasledjuje Bank kljucnom recju is....Bank(10) poziva default konstruktor i tu odmah kreira objekat contracta Bank sa stanjem na racunu 10...
{
    string private name;  //ovde ide prvo tip pa onda opseg
    uint private age;
    
    function setName (string newName)  //mora newName, nema this.name=name
    {
        name = newName;
    }
    function getName() returns (string)   //geter se najvaljuje kljucnom recju returns
    {
        return name;
    }
    
    function setAge (uint newAge)
    {
        age = newAge;
    }
    function getAge() returns (uint)
    {
        return age;
    }
    
    
    //primer
    function loanExample() returns (bool)  //implementacija apstraktne funkcije
    {
        return true;
    }
}
