xquery version "3.1";

for $book in books/book

    where fn:contains ($book/title, "The")
    where fn:contains ($book/date, "1984")

    let $author := $book/author
    let $title := $book/title
    let $press := $book/publisher/press
    let $date := $book/date

return 
    <bibl>
        { fn:concat($author, ". ",  $title, ". ", $press, ". ", $date, ". " ) }
    </bibl>