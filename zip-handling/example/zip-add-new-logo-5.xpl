<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" xmlns:c="http://www.w3.org/ns/xproc-step" xmlns:html="http://www.w3.org/1999/xhtml" version="3.0"
  exclude-inline-prefixes="#all" name="add-new-logo">

  <p:input port="source" href="input.zip"/>
  <p:output port="result" serialization="map{ 'indent': true() }" sequence="true"/>

  <!-- Get the existing manifest: -->
  <p:archive-manifest/>

  <!-- Change the manifest so it includes the new logo: -->
  <p:insert match="/*" position="last-child" name="changed-manifest">
    <p:with-input port="insertion">
      <c:entry href="{ resolve-uri('kanava.jpg', static-base-uri()) }" name="img/kanava.jpg"/>
    </p:with-input>
  </p:insert>

  <!-- Extract the zip file: -->
  <p:unarchive>
    <p:with-input pipe="source@add-new-logo"/>
  </p:unarchive>
  <!-- Now we have multiple documents flowing through the pipeline...  -->

  <!-- Add a reference to the new logo to the main file: -->
  <p:for-each>
    <p:if test="ends-with(p:document-property(., 'base-uri'), '/demo.html')">
      <p:insert match="html:body" position="last-child" >
        <p:with-input port="insertion" xmlns="http://www.w3.org/1999/xhtml">
          <p>New logo:</p>
          <p>
            <img src="img/kanava.jpg" alt="New XProc logo" width="10%"/>
          </p>
        </p:with-input>
      </p:insert>
    </p:if>
  </p:for-each>

  <!-- Create a new archive and store it: -->
  <p:archive>
    <p:with-input port="manifest" pipe="result@changed-manifest"/>
  </p:archive>
  <p:store href="build/zip-result.zip"/>

  <!-- As a report, output where the new zip is stored: -->
  <p:identity>
    <p:with-input pipe="result-uri"/>
  </p:identity>

</p:declare-step>
