xquery version "3.1";

declare variable $sentence := "When in the course of human events events";

declare function local:is-duplicate ($phrase as xs:string?) as xs:string

{

let $tokens:= fn:lower-case($phrase) => fn:tokenize (" ")
let $first-word := $tokens [1]
let $next-word := $tokens [2]
return 
    if (fn:empty(($next-word)))then "There is no duplicate."
    else if ($first-word eq $next-word)then 
    fn:concat ("Found a duplicate'", $first-word," ' after word", $first-word ! position (), "of the phrase.")
    else
    let $new-phrase := fn:string-join($tokens[position() = 2 to last ()], " ")
    return local:is-duplicate($new-phrase)
    
   };
    
 local:is-duplicate($sentence)
  