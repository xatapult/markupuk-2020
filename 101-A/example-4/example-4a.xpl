<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" version="3.0" name="example-pipeline">

  <p:input port="source" href="input.txt"/>
  <p:output port="result" serialization="map{ 'indent': true() }"/>

  <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
  <!-- Load the title and make it XML: -->

  <p:wrap-sequence wrapper="title" name="load-title">
    <p:with-input port="source">
      <p:document href="title.txt"/>
    </p:with-input>
  </p:wrap-sequence>

  <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
  <!-- Main pipeline: -->

  <p:wrap-sequence wrapper="text">
    <p:with-input port="source">
      <p:pipe port="source" step="example-pipeline"/>
    </p:with-input>
  </p:wrap-sequence>

  <p:wrap match="/*" wrapper="doc"/>

  <p:insert match="/*" position="first-child">
    <p:with-input port="insertion">
      <p:pipe port="result" step="load-title"/>
    </p:with-input>
  </p:insert>

  <p:add-attribute match="/*" attribute-name="timestamp" attribute-value="{current-dateTime()}"/>

</p:declare-step>
