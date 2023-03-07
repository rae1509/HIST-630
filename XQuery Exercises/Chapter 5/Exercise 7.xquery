xquery version "3.1";

for $book in books/book 
  
    let $name := $book/author

return 
    <greetings>
      {if ($name eq "Mark Jarrett") then
      fn:concat("Hallo ", $name, "!")
      else fn:concat ("Hi there ", $name, "!")
      }
    </greetings>