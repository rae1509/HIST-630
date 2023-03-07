xquery version "3.1";
let $names := ("Regan", "Patrick", "Tristan", "Sophia")
for $name in $names
return fn:concat("Hello my name is ", $name, "!")