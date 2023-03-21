xquery version "3.1";

declare namespace tei="http://www.tei-c.org/ns/1.0";

declare function local:contsruct-tei-persName ($fullName as xs:string*) 
as element(tei:persName)

{
<persName xmlns="http://www.tei-c.org/ns/1.0">
    <forename  xmlns="http://www.tei-c.org/ns/1.0">{fn:head(fn:tokenize($fullName, " "))}</forename>
    <surname  xmlns="http://www.tei-c.org/ns/1.0">{fn:tail(fn:tokenize($fullName, " "))}</surname>
</persName>
};

let $names := ("Shinpei Goto", "Gentaro Kodama", "Kenjiro Den")

for $name in $names 
    return local:contsruct-tei-persName($name)