<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" version="3.0">

  <p:input port="source" href="input.xml"/>
  <p:output port="result" serialization="map{'indent':  true()}"/>
  
  <p:variable name="output-directory" select="'tmp'"/>

  <p:for-each>
    <p:with-input select="/*/doc"/>
    <p:output pipe="result-uri@store-the-document"/>
    
    <p:store href="{$output-directory}/{/*/@filename}" name="store-the-document"/>

  </p:for-each>

  <p:wrap-sequence wrapper="result-uris"/>

</p:declare-step>
