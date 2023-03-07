xquery version "3.1";

for $book in books/book 
  
    let $type := 
        if (xs:integer ($book/date/@year) lt 2014) then "old"
        else "new"
    
    group by $type
    
return
    <bucket type="{$type}">
        {$book/title}
    </bucket>