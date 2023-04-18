xquery version "3.1";

declare function local:is-duplicate ($phrase as xs:string?) as xs:boolean

{

let $all-letters-as-codepoints := fn:string-to-codepoints($phrase)
let $first-letter := $all-letters-as-codepoints [1]
let $last-letter := $all-letters-as-codepoints [last ()]
return 
    (: Base case 1: Words match; duplicate; so yes!:)
    if (fn:duplicate($first-letter))then true()
    (: Base case 2: Words do not match, so no; false.:)
    else if ($first-letter ne $last-letter)then false ()
    else
    let $new-letters := $all-letters-as-codepoints
    [position () = 2 to last () - 1]
    let $new-phrase := fn:codepoints-to-string ($new-letters)
    return local:is-duplicate($new-phrase)
    };
    local:is-duplicate("of")