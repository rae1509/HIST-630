<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet xmlns:oxy="http://www.oxygenxml.com/schematron/validation"
                xmlns:saxon="http://saxon.sf.net/"
                xmlns:tei="http://www.tei-c.org/ns/1.0"
                xmlns:xhtml="http://www.w3.org/1999/xhtml"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0"
                xml:base="file:/C:/Users/murrr/GitHub/Eliza-Wilkinson_Letter_TEI_Project/ODD%20and%20Customized%20Schema/ElizaWilkinsonCorpusSchematron.sch_xslt_cascade"><!--Implementers: please note that overriding process-prolog or process-root is 
    the preferred method for meta-stylesheets to use where possible. -->
   <xsl:param name="archiveDirParameter"/>
   <xsl:param name="archiveNameParameter"/>
   <xsl:param name="fileNameParameter"/>
   <xsl:param name="fileDirParameter"/>
   <xsl:variable name="document-uri">
      <xsl:value-of select="document-uri(/)"/>
   </xsl:variable>
   <!--PHASES-->
   <!--PROLOG-->
   <xsl:output xmlns:iso="http://purl.oclc.org/dsdl/schematron" method="xml"/>
   <!--XSD TYPES FOR XSLT2-->
   <!--KEYS AND FUNCTIONS-->
   <!--DEFAULT RULES-->
   <!--MODE: SCHEMATRON-SELECT-FULL-PATH-->
   <!--This mode can be used to generate an ugly though full XPath for locators-->
   <xsl:template match="*" mode="schematron-select-full-path">
      <xsl:apply-templates select="." mode="schematron-get-full-path"/>
   </xsl:template>
   <!--MODE: SCHEMATRON-FULL-PATH-->
   <!--This mode can be used to generate an ugly though full XPath for locators-->
   <xsl:template match="*" mode="schematron-get-full-path">
      <xsl:variable name="sameUri">
         <xsl:value-of select="saxon:system-id() = parent::node()/saxon:system-id()"
                       use-when="function-available('saxon:system-id')"/>
         <xsl:value-of select="oxy:system-id(.) = oxy:system-id(parent::node())"
                       use-when="not(function-available('saxon:system-id')) and function-available('oxy:system-id')"/>
         <xsl:value-of select="true()"
                       use-when="not(function-available('saxon:system-id')) and not(function-available('oxy:system-id'))"/>
      </xsl:variable>
      <xsl:if test="$sameUri = 'true'">
         <xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
      </xsl:if>
      <xsl:text>/</xsl:text>
      <xsl:choose>
         <xsl:when test="namespace-uri()=''">
            <xsl:value-of select="name()"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:text>*:</xsl:text>
            <xsl:value-of select="local-name()"/>
            <xsl:text>[namespace-uri()='</xsl:text>
            <xsl:value-of select="namespace-uri()"/>
            <xsl:text>']</xsl:text>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="$sameUri = 'true'">
         <xsl:variable name="preceding"
                       select="count(preceding-sibling::*[local-name()=local-name(current())       and namespace-uri() = namespace-uri(current())])"/>
         <xsl:text>[</xsl:text>
         <xsl:value-of select="1+ $preceding"/>
         <xsl:text>]</xsl:text>
      </xsl:if>
   </xsl:template>
   <xsl:template match="@*" mode="schematron-get-full-path">
      <xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
      <xsl:text>/</xsl:text>
      <xsl:choose>
         <xsl:when test="namespace-uri()=''">@<xsl:value-of select="name()"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:text>@*[local-name()='</xsl:text>
            <xsl:value-of select="local-name()"/>
            <xsl:text>' and namespace-uri()='</xsl:text>
            <xsl:value-of select="namespace-uri()"/>
            <xsl:text>']</xsl:text>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="text()" mode="schematron-get-full-path">
      <xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
      <xsl:text>/</xsl:text>
      <xsl:text>text()</xsl:text>
      <xsl:variable name="preceding" select="count(preceding-sibling::text())"/>
      <xsl:text>[</xsl:text>
      <xsl:value-of select="1+ $preceding"/>
      <xsl:text>]</xsl:text>
   </xsl:template>
   <xsl:template match="comment()" mode="schematron-get-full-path">
      <xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
      <xsl:text>/</xsl:text>
      <xsl:text>comment()</xsl:text>
      <xsl:variable name="preceding" select="count(preceding-sibling::comment())"/>
      <xsl:text>[</xsl:text>
      <xsl:value-of select="1+ $preceding"/>
      <xsl:text>]</xsl:text>
   </xsl:template>
   <xsl:template match="processing-instruction()" mode="schematron-get-full-path">
      <xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
      <xsl:text>/</xsl:text>
      <xsl:text>processing-instruction()</xsl:text>
      <xsl:variable name="preceding"
                    select="count(preceding-sibling::processing-instruction())"/>
      <xsl:text>[</xsl:text>
      <xsl:value-of select="1+ $preceding"/>
      <xsl:text>]</xsl:text>
   </xsl:template>
   <!--MODE: SCHEMATRON-FULL-PATH-2-->
   <!--This mode can be used to generate prefixed XPath for humans-->
   <xsl:template match="node() | @*" mode="schematron-get-full-path-2">
      <xsl:for-each select="ancestor-or-self::*">
         <xsl:text>/</xsl:text>
         <xsl:value-of select="name(.)"/>
         <xsl:if test="preceding-sibling::*[name(.)=name(current())]">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1"/>
            <xsl:text>]</xsl:text>
         </xsl:if>
      </xsl:for-each>
      <xsl:if test="not(self::*)">
         <xsl:text/>/@<xsl:value-of select="name(.)"/>
      </xsl:if>
   </xsl:template>
   <!--MODE: SCHEMATRON-FULL-PATH-3-->
   <!--This mode can be used to generate prefixed XPath for humans 
	(Top-level element has index)-->
   <xsl:template match="node() | @*" mode="schematron-get-full-path-3">
      <xsl:for-each select="ancestor-or-self::*">
         <xsl:text>/</xsl:text>
         <xsl:value-of select="name(.)"/>
         <xsl:if test="parent::*">
            <xsl:text>[</xsl:text>
            <xsl:value-of select="count(preceding-sibling::*[name(.)=name(current())])+1"/>
            <xsl:text>]</xsl:text>
         </xsl:if>
      </xsl:for-each>
      <xsl:if test="not(self::*)">
         <xsl:text/>/@<xsl:value-of select="name(.)"/>
      </xsl:if>
   </xsl:template>
   <!--MODE: GENERATE-ID-FROM-PATH -->
   <xsl:template match="/" mode="generate-id-from-path"/>
   <xsl:template match="text()" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.text-', 1+count(preceding-sibling::text()), '-')"/>
   </xsl:template>
   <xsl:template match="comment()" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.comment-', 1+count(preceding-sibling::comment()), '-')"/>
   </xsl:template>
   <xsl:template match="processing-instruction()" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.processing-instruction-', 1+count(preceding-sibling::processing-instruction()), '-')"/>
   </xsl:template>
   <xsl:template match="@*" mode="generate-id-from-path">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:value-of select="concat('.@', name())"/>
   </xsl:template>
   <xsl:template match="*" mode="generate-id-from-path" priority="-0.5">
      <xsl:apply-templates select="parent::*" mode="generate-id-from-path"/>
      <xsl:text>.</xsl:text>
      <xsl:value-of select="concat('.',name(),'-',1+count(preceding-sibling::*[name()=name(current())]),'-')"/>
   </xsl:template>
   <!--MODE: GENERATE-ID-2 -->
   <xsl:template match="/" mode="generate-id-2">U</xsl:template>
   <xsl:template match="*" mode="generate-id-2" priority="2">
      <xsl:text>U</xsl:text>
      <xsl:number level="multiple" count="*"/>
   </xsl:template>
   <xsl:template match="node()" mode="generate-id-2">
      <xsl:text>U.</xsl:text>
      <xsl:number level="multiple" count="*"/>
      <xsl:text>n</xsl:text>
      <xsl:number count="node()"/>
   </xsl:template>
   <xsl:template match="@*" mode="generate-id-2">
      <xsl:text>U.</xsl:text>
      <xsl:number level="multiple" count="*"/>
      <xsl:text>_</xsl:text>
      <xsl:value-of select="string-length(local-name(.))"/>
      <xsl:text>_</xsl:text>
      <xsl:value-of select="translate(name(),':','.')"/>
   </xsl:template>
   <!--Strip characters-->
   <xsl:template match="text()" priority="-1"/>
   <!--SCHEMA SETUP-->
   <xsl:template match="/">
      <xsl:apply-templates select="/" mode="M1"/>
   </xsl:template>
   <!--SCHEMATRON PATTERNS-->
   <!--PATTERN -->
   <!--RULE -->
   <xsl:template match="tei:teiHeader/@resp" priority="1003" mode="M1">

		<!--ASSERT -->
      <xsl:choose>
         <xsl:when test=". = '#CHG'"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text>This @resp attribute must be #CHG.</xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*" mode="M1"/>
   </xsl:template>
   <!--RULE -->
   <xsl:template match="persName" priority="1002" mode="M1">
      <xsl:variable name="StandoffpersonIndex"
                    select="doc('https://raw.githubusercontent.com/rae1509/HIST-630/main/Eliza-Wilkinson_Letter_TEI_Project/Text-Markup/Eliza_Wilkinson_Letter_1.xml')"/>
      <xsl:variable name="personIDs" select="$StandoffpersonIndex//tei:person/@xml:id"/>
      <xsl:variable name="error" select="."/>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="/@ref = $personIDs"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text> </xsl:text>
               <xsl:text/>
               <xsl:value-of select="$error"/>
               <xsl:text/>
               <xsl:text>Every persName element with a @ref attribute should have an @xml:id. </xsl:text>
               <xsl:text/>
               <xsl:value-of select="personIDs"/>
               <xsl:text/>
               <xsl:text> </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*" mode="M1"/>
   </xsl:template>
   <!--RULE -->
   <xsl:template match="placeName" priority="1001" mode="M1">
      <xsl:variable name="StandoffplaceIndex"
                    select="doc('https://raw.githubusercontent.com/rae1509/HIST-630/main/Eliza-Wilkinson_Letter_TEI_Project/Text-Markup/Eliza_Wilkinson_Letter_1.xml')"/>
      <xsl:variable name="placeIDs" select="$StandoffplaceIndex//tei:place/@xml:id"/>
      <xsl:variable name="error" select="."/>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="/@ref = $placeIDs"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text> </xsl:text>
               <xsl:text/>
               <xsl:value-of select="$error"/>
               <xsl:text/>
               <xsl:text> Every placeName element with a @ref attribute should have an @xml:id. </xsl:text>
               <xsl:text/>
               <xsl:value-of select="placeIDs"/>
               <xsl:text/>
               <xsl:text> </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*" mode="M1"/>
   </xsl:template>
   <!--RULE -->
   <xsl:template match="orgName" priority="1000" mode="M1">
      <xsl:variable name="StandofforgIndex"
                    select="doc('https://raw.githubusercontent.com/rae1509/HIST-630/main/Eliza-Wilkinson_Letter_TEI_Project/Text-Markup/Eliza_Wilkinson_Letter_1.xml')"/>
      <xsl:variable name="orgIDs" select="$StandofforgIndex//tei:org/@xml:id"/>
      <xsl:variable name="error" select="."/>
      <!--ASSERT -->
      <xsl:choose>
         <xsl:when test="/@ref = $orgIDs"/>
         <xsl:otherwise>
            <xsl:message xmlns:iso="http://purl.oclc.org/dsdl/schematron">
               <xsl:text> </xsl:text>
               <xsl:text/>
               <xsl:value-of select="$error"/>
               <xsl:text/>
               <xsl:text> Every orgName element with a @ref attribute should have an @xml:id. </xsl:text>
               <xsl:text/>
               <xsl:value-of select="orgIDs"/>
               <xsl:text/>
               <xsl:text> </xsl:text>
            </xsl:message>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates select="@*|*" mode="M1"/>
   </xsl:template>
   <xsl:template match="text()" priority="-1" mode="M1"/>
   <xsl:template match="@*|node()" priority="-2" mode="M1">
      <xsl:apply-templates select="@*|*" mode="M1"/>
   </xsl:template>
</xsl:stylesheet>
