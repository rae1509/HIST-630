xquery version "3.1";

let $persName:= ("Shinpei Goto", "Gentaro Kodama")
let $name:=("Kenjiro Den")
let $join-names:= function ($persName as xs:string, $name as xs:string)
as xs:string
{fn:concat($persName, "and", $name)
}

return $join-names ($persName, $name)