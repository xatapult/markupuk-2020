<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" version="3.0" name="example-pipeline">

  <p:input port="source" href="input.txt" primary="true"/>
  <p:output port="result" serialization="map{ 'indent': true() }"/>
  
  <p:input port="titledoc" href="title.txt"/>

  <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
  <!-- Load the title and make it XML: -->

  <p:wrap-sequence wrapper="title" name="load-title">
    <p:with-input port="source" pipe="titledoc@example-pipeline"/>
  </p:wrap-sequence>

  <!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
  <!-- Main pipeline: -->

  <p:wrap-sequence wrapper="text">
    <p:with-input port="source" pipe="source@example-pipeline"/>
  </p:wrap-sequence>

  <p:wrap match="/*" wrapper="doc"/>

  <p:insert match="/*" position="first-child">
    <p:with-input port="insertion" pipe="result@load-title"/>
  </p:insert>

  <p:add-attribute match="/*" attribute-name="timestamp" attribute-value="{current-dateTime()}"/>

</p:declare-step>
