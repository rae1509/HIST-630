xquery version "3.1";
let $name := ("Regan", "Patrick", "Tristan", "Sophia")
for $name in $names
return fn:concat("Hello my name is", $name, "!")