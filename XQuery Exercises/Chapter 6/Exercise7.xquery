xquery version "3.1";

declare namespace tei="http://www.tei-c.org/ns/1.0";

declare function local:contsruct-english-list ($persName as xs:string) 
as element (tei:persName)

{
<persName xmnls="http://www.tei-c.org/ns/1.0">
    <forename>Shinpei</forename>
    <surname>Goto</surname>
</persName>
}

local:contsruct-english-list ($persName)