xquery version "3.1";

declare context item := document {

<books>
    <book>
        <title>The Great Cat Massacre and Other Epidsodes in French Cultural History</title>
        <author>Robert Darnton</author>
        <date>1984</date>
        <publisher>
            <city>New York</city>
            <press>Basic Books</press>
        </publisher>
        <identifier type= "ISBN-10">0394729277</identifier>
        <identifier type="ISBN-13">978-0465012749</identifier>
    </book>
    <book>
        <title>The Enemy at the Gate: Hapsburgs, Ottomans, and the Battle for Europe</title>
        <author>Andrew Wheatcroft</author>
        <date>2008</date>
        <publisher>
            <city>New York</city>
            <press>Basic Books</press>
        </publisher>
        <identifier type= "ISBN 10">2008938931</identifier>
        <identifier type= "ISBN-13">978-0465020812</identifier>
    </book>
    <book>
        <title>The Congress of Vienna and its Legacy</title>
        <authro>Mark Jarrett</authro>
        <date>2013</date>
        <publisher>
            <city>London</city>
            <press>I.B. Tauris</press>
        </publisher>
        <identifier type= "ISBN-13">978-1784530563</identifier>
    </book>
    <book>
        <title>Warriors Don't Cry</title>
        <author>Melba Patillo Beals</author>
        <date>1994</date>
        <publisher>
            <city>New York</city>
            <press>Washington Square Press</press>
        </publisher>
        <identifier type= "ISBN-10">0671866397</identifier>
        <identifier type= "ISBN-13">978-0671866396</identifier>
    </book>
    <book>
        <title>Elecotral Capitalism: The Party System in New York's Gilded Age</title>
        <author>Jeffrey D. Broxmeyer</author>
        <date>2020</date>
        <publisher>
            <city>Philadelphia</city>
            <press>University of Pennsylvania Press</press>
        </publisher>
        <identifier type= "ISBN-13">978-0812252361</identifier>
    </book>
</books>
} ;

/books/book[fn:contains(./title, "Great")]
