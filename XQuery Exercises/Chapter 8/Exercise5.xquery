xquery version "3.1";

declare namespace tei="http://www.tei-c.org/ns/1.0";

declare variable $doc := 

<div xmlns="http://wwwtei-c.org/ns/1.0">

    <lg>
      <l>My Bonnie lies over the ocean</l>  
      <l>My Bonnie lies over the sea</l>
    </lg>

</div>;

declare function local:transform($originals as node()*) {
    for $original in $originals
    return
        typeswitch ($original)
            case text() return $original
            case element(tei:div) return
                <div>{ local:transform($original/node()) }</div>
            case element (tei:lg) return
                <ol>{ local:transform($original/node ()) }</ol>
            case element(tei:l) return
                <li>{ local:transform($original/node()) }</li>
            default return $original
};
     
     local:transform($doc)