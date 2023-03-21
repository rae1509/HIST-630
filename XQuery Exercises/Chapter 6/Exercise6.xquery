xquery version "3.1";
 

let $names := ("Shinpei Goto", "Gentaro Kodama", "Kenjiro Den")

let $contruct-english-list :=
        function ($list as xs:string*) as xs:string
        {fn:concat(fn:string-join (fn:subsequence ($list, 1, 2), ", "),", and ", fn:subsequence($list, 3))
        }

return $contruct-english-list ($names)