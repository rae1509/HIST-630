<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>

    <sch:pattern>
        <sch:rule context="tei:teiHeader/@resp">
           <sch:assert test=". = '#CHG'">This @resp attribute must be #CHG".</sch:assert>
        </sch:rule>
        <sch:rule context="tei:persName/@ref">
            <sch:let name="personIndex"
value="doc('https://github.com/rae1509/HIST-630/blob/main/Eliza-Wilkinson_Letter_TEI_Project/Standoff/Standoff_Markup_for_Wilkinson_Letter_1.xml')"></sch:let>
            <sch:let name="personURIs" value="$personIndex//tei:person/@ref"></sch:let>
            <sch:assert test="
              every $i in .
              satisfies $i = '$personURIS'">
               Every persName e;ement with a @ref attribute should have an @xml:id
            </sch:assert>
        </sch:rule> 
    </sch:pattern>
</sch:schema>