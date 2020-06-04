<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" xmlns:c="http://www.w3.org/ns/xproc-step" xmlns:html="http://www.w3.org/1999/xhtml" version="3.0"
  exclude-inline-prefixes="#all" name="add-new-logo">

  <p:input port="source" href="input.zip"/>
  <p:output port="result" serialization="map{ 'indent': true() }"/>

  <!--<!-\- Get the existing manifest: -\->
  <p:archive-manifest/>

  <!-\- Change the manifest so it includes the new logo: -\->
  <p:insert match="/*" position="last-child" name="changed-manifest">
    <p:with-input port="insertion">
      <c:entry href="{ resolve-uri('additional-images/kanava.jpg', static-base-uri()) }" name="img/kanava.jpg"/>
    </p:with-input>
  </p:insert>-->

  <!-- Extract the zip file: -->
  <p:unarchive>
    <p:with-input pipe="source@add-new-logo"/>
  </p:unarchive>

  <!-- Just for now - to show the base-uri values: -->
  <p:for-each>
    <p:identity>
      <p:with-input port="source">
        <doc base-uri="{p:document-property(., 'base-uri')}" 
          content-type="{p:document-property(., 'content-type')}"/>
      </p:with-input>
    </p:identity>
  </p:for-each>
  <p:wrap-sequence wrapper="zip-demo"/>

</p:declare-step>
