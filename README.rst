coda
****

.. image:: https://travis-ci.org/3ptscience/coda.svg?branch=master
    :target: https://travis-ci.org/3ptscience/coda

coda is a utility to extend `bumpversion <https://github.com/peritus/bumpversion>`_
to simplify version control during the beta development and release cycle.

::

    v1.0.0 -> v1.0.1 -> v1.0.2 -> v1.1.0b0 -> v1.1.0b1 -> v1.1.0b2 -> v1.1.0

Install
=======

To install coda to /usr/local/bin:

.. code:: bash

    make install

or

.. code:: bash

    sudo make install


coda also requires `bumpversion <https://github.com/peritus/bumpversion>`_
which can be installed through `PyPI <https://pypi.python.org/pypi/bumpversion>`_:

.. code:: bash

    pip install bumpversion

To uninstall, simply run:

.. code:: bash

    make uninstall

Setup
=====

coda only requires a simple bumpversion config file called .bumpversion.cfg with the format

::

    [bumpversion]
    current_version = 0.0.1b1
    files = coda README.rst tests/coda-tests.sh

**current_version** is the current version string, to be updated when coda is run

**files** is a list of relative paths to files that contain the *current_version*
string. When coda is run, every occurrence of *current_version* in all the
*files* will be replaced with the new version string.

Usage
=====

New Release
-----------
When you are ready for a new release, specify if the release is `major`, `minor`, or
a `patch`, and optionally `beta` if this is an unstable, beta release:

.. code:: bash

    coda patch          # 1.0.0 -> 1.0.1
    coda minor          # 1.0.0 -> 1.1.0
    coda major          # 1.0.0 -> 2.0.0

    coda patch beta     # 1.0.0 -> 1.0.1b0
    coda minor beta     # 1.0.0 -> 1.1.0b0
    coda major beta     # 1.0.0 -> 2.0.0b0

From Beta
---------
When you are in beta, there are two options: `beta` bumps to a new beta version
and `release` removes the beta tag for a stable release.

.. code:: bash

    coda beta           # 1.0.1b0 -> 1.0.1b1
    coda beta           # 1.0.1b1 -> 1.0.1b2
    coda release        # 1.0.1b2 -> 1.0.1

Notes
-----
coda must be run from within the same directory as the .bumpversion.cfg file.
Also, coda passes the `--commit` tag to bumpversion, so if you are within a git or
Mercurial project the new version number will be automatically committed (with git,
this can be undone using `git reset HEAD~1`).

The syntax chosen for beta version numbers follows recommendations from
`PEP 440 <https://www.python.org/dev/peps/pep-0440/>`_. This syntax is
compatible with the PyPI pre-release support (i.e. `pip install --pre mypackage`).
However, like bumpversion, coda just acts on text files; it's not specific to any
programming language.

Finally, keep in mind coda is a very simple utility that simply increments and
replaces version strings throughout your code. For effective version management
and beta support, make sure to also write informative release notes,
tag releases with the version number, and ensure the new version is
sufficiently tested and correctly deployed.

Bugs
====

If you run into any problems with coda, please make an
`issue <https://github.com/3ptscience/coda/issues>`_




