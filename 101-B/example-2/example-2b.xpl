<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" version="3.0">
  
  <p:input port="source" href="input.xml"/>
  <p:output port="result"/>
  
  <p:variable name="id" select="upper-case(/*/@user) || '-' || p:system-property('p:episode')"/>
  
  <p:add-attribute match="/*" attribute-name="id" attribute-value="{$id}"/>
  
</p:declare-step>
