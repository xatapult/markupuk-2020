<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" version="3.0">

  <!-- This pipeline will not run... -->

  <p:input port="source" href="input.xml"/>
  <p:output port="result"/>

  <p:variable name="output-directory" select="'tmp'"/>

  <p:for-each>
    <p:with-input select="/*/doc"/>

    <p:store href="{$output-directory}/{/*/@filename}"/>

  </p:for-each>

</p:declare-step>
