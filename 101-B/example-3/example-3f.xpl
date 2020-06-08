<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" version="3.0">

  <p:input port="source" href="input.xml"/>
  <p:output port="result"/>
  
  <p:variable name="output-directory" select="'tmp'"/>

  <p:viewport match="/*/doc">
    <p:if test="/*/@enabled">
      <p:store href="{$output-directory}/{/*/@filename}" />
      <p:identity>
        <p:with-input pipe="result-uri"/>
      </p:identity>
    </p:if>
  </p:viewport>

</p:declare-step>
