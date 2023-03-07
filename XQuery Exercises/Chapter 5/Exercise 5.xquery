xquery version "3.1";

for $book at $n in books/book 
    let $author := $book/author
    let $title := $book/title
    let $press := $book/publisher/press
    let $date := $book/date

return 
    <bibl n="{$n}">
        { fn:concat($author, ". ",  $title, ". ", $press, ". ", $date, ". " ) }
    </bibl>