# DLS Tutorial

## Abstract

[DLS (Data Logging Service)]( http://etherlab.org/en/dls) and
[TestManager](http://etherlab.org/en/testmanager) are open-source software
from [EtherLab](http://etherlab.org/en/components.php) to monitor and debug
realtime controling application, typically industrial automation processes.

This tutorial explains how to install and setup DLS & TestManager.

After reading this document, you should better understand how DLS and
TestManager work and be able to use them for you own applications.

### Target audience
Any software developper with basic Linux skills, who wants to learn DLS &
TestManager for the very first time.


## Download links

* [dls-tutorial.pdf](https://github.com/sblanchet/dls-tutorial/blob/master/dls-tutorial.pdf)




## Rebuilding the document

* This tutorial document is written with LaTeX.

* These are the instructions to regenerate the PDF from the sources:
```bash
git clone https://github.com/sblanchet/dls-tutorial.git
cd dls-tutorial
make
```

* It generates the [dls-tutorial.pdf](https://github.com/sblanchet/dls-tutorial/blob/master/dls-tutorial.pdf) document.

* The building has been tested only on Debian 9.0.
