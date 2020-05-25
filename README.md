# Markup UK 2020 Xproc Webinars

This repository contains (or will soon contain) the presentations and example code for some of the XProc webinars for Markup UK 2020.

* Thursday June 4: XProc 3.0 101 - Part 1
* Monday June 8: XProc 3.0 101 - Part 2
* Thursday June 18: XProc 3.0 - Dealing with ZIP documents

**Presenter:**

[Erik Siegel](https://www.linkedin.com/in/esiegel/)

[Xatapult](http://www.xatapult.com)

[erik@xatapult.nl](mailto:erik@xatapult.nl)


-----

## Preparations:

**Example code:**
* Just clone this GIT repository somewhere
* Check for updates now and then


**XProc processor:**

* Download the Morgana XProc 3.0 processor at [https://www.xml-project.com/](https://www.xml-project.com/) 
* Unzip the zip
* Add the main Morgana directory to your system's `path`
* Add a Saxon jar file to the `MorganaXProc-IIIse_lib` sub-directory. For instance for Saxon 9: `saxon9he.jar`. The free home edition (HE) is sufficient.
* Try it: Typing `morgana` on the command line should now give you some output about it's usage

-----

## Usage 

If you're using [oXygen](https://www.oxygenxml.com/) you can use the oXygen project file `markupuk-2020.xpr` in the `/etc` sub-directory.

The presentations are there in PowerPoint and PDF format. You can find them in the `presentation` sub-directories, for instance in `/101-A/presentation`

Most if not all examples can be run directly from the command line. For instance (please try this):

* Change directory (`cd`) to  `/101-A/example-1`
* Type: `morgana example-1.xpl`
* The output should be something like:

```
=================================
MorganaXProc-IIIse 0.9.2.9-beta
Copyright 2011-2020 by <xml-project /> Achim Berndzen
=================================

<text timestamp="2020-05-25T08:44:44.94+02:00">Hi there,&#xD;
This is a piece of text to demonstrate XProc 3.0 with.</text>
```


-----

## Important links

* GIT repository for this webinar:  [https://github.com/xatapult/markupuk-2020](https://github.com/xatapult/markupuk-2020)

* Morgana XProc 3.0 processor: [https://www.xml-project.com/](https://www.xml-project.com/)

* Calabash XProc processor: [https://xmlcalabash.com/](https://xmlcalabash.com/)

* XProc specification: [https://spec.xproc.org/](https://spec.xproc.org/)
  * Main specification (last draft): [https://spec.xproc.org/master/head/xproc/](https://spec.xproc.org/master/head/xproc/)
  * Standard step library (last draft): [https://spec.xproc.org/master/head/steps/](https://spec.xproc.org/master/head/steps/)

* Introductory articles: [https://www.xml.com](https://www.xml.com/articles/?tag=xproc)

* Book: [https://xmlpress.net/publications/xproc-3-0/](https://xmlpress.net/publications/xproc-3-0/)
