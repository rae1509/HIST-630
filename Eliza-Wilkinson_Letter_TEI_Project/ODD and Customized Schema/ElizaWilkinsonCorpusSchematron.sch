<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:ns uri="http://www.tei-c.org/ns/1.0" prefix="tei"/>

    <sch:pattern>
        <sch:rule context="tei:teiHeader/@resp">
           <sch:assert test=". = '#CHG'">This @resp attribute must be #CHG.</sch:assert>
        </sch:rule>
        
        <sch:rule context="persName">
            <sch:let name="StandoffpersonIndex"       value="doc('https://raw.githubusercontent.com/rae1509/HIST-630/main/Eliza-Wilkinson_Letter_TEI_Project/Text-Markup/Eliza_Wilkinson_Letter_1.xml')"/>
           <sch:let name="personIDs" value="$StandoffpersonIndex//tei:person/@xml:id"/>
           <sch:let name="error" value="."/>
           <sch:assert test="/@ref = $personIDs">
               <sch:value-of select="$error"/>Every persName element with a @ref attribute should have an @xml:id.
               <sch:value-of select="personIDs"/> 
           </sch:assert>
        </sch:rule> 
                
        <sch:rule context="placeName">
            <sch:let name="StandoffplaceIndex"       value="doc('https://raw.githubusercontent.com/rae1509/HIST-630/main/Eliza-Wilkinson_Letter_TEI_Project/Text-Markup/Eliza_Wilkinson_Letter_1.xml')"/>
           <sch:let name="placeIDs" value="$StandoffplaceIndex//tei:place/@xml:id"/>
           <sch:let name="error" value="."/>
           <sch:assert test="/@ref = $placeIDs">
             <sch:value-of select="$error"/> Every placeName element with a @ref attribute should have an @xml:id.
             <sch:value-of select="placeIDs"/> 
           </sch:assert>
        </sch:rule>
                    
         <sch:rule context="orgName">
             <sch:let name="StandofforgIndex"       value="doc('https://raw.githubusercontent.com/rae1509/HIST-630/main/Eliza-Wilkinson_Letter_TEI_Project/Text-Markup/Eliza_Wilkinson_Letter_1.xml')"/>
           <sch:let name="orgIDs" value="$StandofforgIndex//tei:org/@xml:id"/>
           <sch:let name="error" value="."/>
           <sch:assert test="/@ref = $orgIDs">
             <sch:value-of select="$error"/> Every orgName element with a @ref attribute should have an @xml:id.
             <sch:value-of select="orgIDs"/> 
           </sch:assert>
         </sch:rule> 
    </sch:pattern>
    
    
</sch:schema>
