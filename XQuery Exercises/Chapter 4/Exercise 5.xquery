xquery version "3.1";

declare context item := document {

<name>
    <forename>Regan</forename>
    <surname>Murr</surname>
</name>

};

/name/surname/fn:replace("Murr", "u", "*")