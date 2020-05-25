<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" version="3.0">
  
  <p:input port="source" href="input.xml"/>
  <p:output port="result"/>
  
  <p:variable name="status" select="/*/@status" href="status.xml"/>
  
  <p:add-attribute match="/*" attribute-name="status-copied" attribute-value="{$status}"/>
  
</p:declare-step>
