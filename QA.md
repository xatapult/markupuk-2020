# Questions and Answers

Here are answers to some of the questions I got during the webinars.

------
**As an XSLT programmer, I find XProc difficult to get used to...**

As with every new programming language, you'll need to get used to the language, of course, no way around that. But with XProc it's not only new syntax, it's also new *concepts*: Steps, ports, documents flowing through, etc. However, once get this, it will become easier. 

As a regular teacher for XSLT courses I know XSLT can be just as frustrating to learn. But once you get your head around thinking in tree structures and template matching, the rest is relatively straightforward. 

Although I haven't given a full XProc course yet, I think the main hurdle to take is thinking in *documents* flowing through *ports* through *steps*. Once you've learned that, and how to connect the ports, things will hopefully start to make more sense.

----

**What are the main differences between XProc 1.0 and 3.0?**

Well, that's a long list, too long for a simple Q&A like this. 

However, I gave  [a talk about this at XML Prague 2019](https://youtu.be/O51aE311BKU). The slides for this talk are [here](http://archive.xmlprague.cz/2019/files/presentations/excellent-xproc-3.0.pdf).

----

**What's the main difference between ports and options? When do you use what?**

XProc is a language that works on *documents* flowing through *ports* through *steps*. *Options* are parameters you can use to fine-tune your pipelines. For instance, for providing values like like `debug-on` or `output-directory`. Or, in standard steps, things like `match`, `attribute-name` and `attribute-value`.

Maybe this analogy with XSLT helps: Options are like the global parameters of your stylesheet.

----

**Is there a schema for XProc?**

Yes, of course, but it's rather hard to come by (at the moment, 2020-06):

1. Clone the [https://github.com/xproc/3.0-grammar](https://github.com/xproc/3.0-grammar) repo
1. Build it using Gradle. 
1. Get the RelaxNG schema from `build/xproc30.rng`

oXygen does not (yet?) have it on board, unfortunately.

----

**Is there a difference between `@href='duck.xml'` and `@select='doc("duck.xml")'`?**

The `href` attribute in XProc is used mainly to connect *documents* (on disk or the web or wherever) to a *port*.  The `select` attribute  computes an XPath expression and uses the result for something, for instance to set the value of a variable or option. 

Another usage for the `href` attribute is to set the context item to a document when computing the value for a variable or option. And yes, sometimes you can choose. For instance, the following two variable declarations should yield the same value:    

```xml
<p:variable name="sound" select="doc('duck.xml')/*/@quack"/>
<p:variable name="sound" select="/*/@quack" href="duck.xml"/>

```

----
**In some examples there is not much difference between an input port, an option, and a variable whose value is derived from a file. Is there a best practice for when to use which feature?**

I'm afraid not (yet). What I've tried to show you in the examples are  several ways of doing things, and yes, sometimes you pick and choose. The idea was to show you *what* was possible, not when it was most useful. Usefulness of course depends on functionality and requirements, so it's up to you to experiment, try, stumble, fail and conquer!  

----
**Is there any tool support for constructing XProc scripts (aside from tools to run the scripts)?**

Beside generic XML editors, no, not yet.

----
**How to trick oXygen in validating XProc 3.0 pipelines**

That's not for the faint of heart, but here's the recipe (I'm going to assume your know your way around oXygen enough, otherwise this explanation would become way too long):

* Make sure you have the RelaxNG schema for XProc 3.0 available, see "Is there a schema for XProc?" above.
* In oXygen, in the global options, create a new "Document Type Association" for XProc 3.0.
* On the first tab, associate it with:
  * Elements: `declare-step` and `library`
  * In namespace  `http://www.w3.org/ns/xproc`
  * With attribute `version="3.0"`
* Add a default *validation scenario* that validates against the XProc 3.0 RelaxNG schema. Watch out: Adding the schema to the  *Schema* tab doesn't seem to do the trick, I have no idea why. The only way I could get it working was by adding a default validation scneario to the association.
* Make sure your XProc 3.0 association is enabled and high enough in the ranks of associations.

This makes oXygen validate your XProc 3.0 pipelines. Unfortunately however, it seems to have XProc 1.0 support hardwired, which means that all the "help" it will give you (suggesting element/attribute names, values, etc.) comes from an XProc 1.0 schema and *not*  from the XProc 3.0 schema. So simply ignore all the hints and type in what you need. 


