pragma solidity ^0.4.0;   //biras verziju u kojoj ces raditi... 0.4.25 je trenutno najnovija 

interface Regulator  //interfejs kao u Javi ili C#
{
    function checkValue(uint amount) returns (bool);
    function loan() returns (bool);
}

contract Bank is Regulator   //nema kljucne reci implements vec je tu ponovo samo IS....kontrakt Bank implementira interfejs Regulator
{
    uint private value;
    address private owner;  //address je data type(tip podataka kao int, string itd.) i ima veze sa ethereum blockchainom
    
    modifier ownerFunc
    {
        require (owner == msg.sender);  //error handling...bolje require nego throw jer nije dobar throw ovde i verovatno ce ga skloniti u kasnijim verzijama
        _;  //OVO OBAVEZNO
    }
    
    function Bank (uint amount)  //konstruktor
    {
        value = amount;
        owner = msg.sender;
    }
    
    function deposit (uint amount) ownerFunc   //dodali smo error handling, tako da ce svaki put pri pozivu ove funkcije raditi proveru da li je owner ispravan, to jest niko sem vlasnika racuna u banci ne moze da modifikuje ove podatke, tj niko sem ownera nece moci da menja ovu funkciju, a to sam u ovom slucaju ja jer je kreiran owner sa moje adrese
    {
        value += amount;
    }
    function withdraw (uint amount) ownerFunc
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
}

//U Soliditiju postoje 4 nacina za handlovanje gresaka...kreirali smo poseban contract da bismo ih uporedili na primeru
contract TestThrows
{
    function testAssert()
    {
        assert(false); //ovo vraca gresku logicno....assert zahteva bool argument
        //assert(1 == 2);  //moze i ovako nekako da se zapise nije vazno
    }
    
    function testRequire()
    {
        require(2 == 1);  //i require zahteva bool argument
    }
    
    function testRevert()
    {
        revert();  //revert ne zahteva argumente
    }
    
    function testThrow()
    {
        throw;  //ni throw ne zahteva argumente, s tim da je throw vise metoda nego funkcija kao revert
    }
}
