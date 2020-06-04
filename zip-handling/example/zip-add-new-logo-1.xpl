<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" xmlns:c="http://www.w3.org/ns/xproc-step" xmlns:html="http://www.w3.org/1999/xhtml" version="3.0"
  exclude-inline-prefixes="#all" name="add-new-logo">

  <p:input port="source" href="input.zip"/>
  <p:output port="result" serialization="map{ 'indent': true() }"/>

  <!-- Get the existing manifest: -->
  <p:archive-manifest/>

</p:declare-step>
