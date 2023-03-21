xquery version "3.1";

declare function local:construct-english-list
    ($list as xs:string*) as xs:string
        {fn:concat(fn:string-join (fn:subsequence ($list, 1, 2), ", "),", and ", fn:subsequence($list, 3))
        };

let $names := ("Shinpei Goto", "Gentaro Kodama", "Kenjiro Den")



return local:construct-english-list($names)