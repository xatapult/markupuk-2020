<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" version="3.0">

  <p:input port="source" href="input.txt"/>
  <p:output port="result" serialization="map{ 'indent': true() }"/>

  <p:wrap-sequence wrapper="text"/>

  <p:wrap match="/*" wrapper="doc"/>

  <p:insert match="/*" position="first-child">
    <p:with-input port="insertion">
      <title>Hi there!</title>
    </p:with-input>
  </p:insert>

  <p:add-attribute match="/*" attribute-name="timestamp" attribute-value="{current-dateTime()}"/>

</p:declare-step>
