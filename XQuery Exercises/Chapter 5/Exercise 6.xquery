xquery version "3.1";

for $book at $n in books/book 
  
    let $year := $book/date/@year
    group by $year 
    order by $year descending

return 
    <book published = "{$year}">
        {$book/title}
    </book>