<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" version="3.0">

  <p:input port="source" href="input.txt"/>
  <p:output port="result"/>

  <p:wrap-sequence wrapper="text"/>
  <p:add-attribute match="/*" attribute-name="timestamp" attribute-value="{current-dateTime()}"/>

</p:declare-step>
