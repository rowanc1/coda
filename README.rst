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
    current_version = 0.0.3
    files = coda README.rst tests/coda-tests.sh

**current_version** is the current version string, to be updated when coda is run

**files** is a list of relative paths to files that contain the *current_version*
string. When coda is run, every occurrence of *current_version* in all the
*files* will be replaced with the new version string.

Usage
=====

New Release
-----------
When you are ready for a new release, specify if the release is :code:`major`, :code:`minor`, or
a :code:`patch`, and optionally :code:`beta` if this is an unstable, beta release:

.. code:: bash

    coda patch          # 1.0.0 -> 1.0.1
    coda minor          # 1.0.0 -> 1.1.0
    coda major          # 1.0.0 -> 2.0.0

    coda patch beta     # 1.0.0 -> 1.0.1b0
    coda minor beta     # 1.0.0 -> 1.1.0b0
    coda major beta     # 1.0.0 -> 2.0.0b0

From Beta
---------
When you are in beta, there are two options: :code:`beta` bumps to a new beta version
and :code:`release` removes the beta tag for a stable release.

.. code:: bash

    coda beta           # 1.0.1b0 -> 1.0.1b1
    coda beta           # 1.0.1b1 -> 1.0.1b2
    coda release        # 1.0.1b2 -> 1.0.1

Notes
-----
- coda must be run from within the same directory as the .bumpversion.cfg file.
- coda passes the :code:`--commit` tag to bumpversion, so if you are within a git or
  Mercurial project the new version number will be automatically committed (with git,
  this can be undone using :code:`git reset HEAD~1`). Please ensure that you have committed
  all changes before using coda to bump the version.
- coda passes the :code:`--tag` tag to bumpversion. This tags the commit with the
  version number locally. This tag will only be transfered to the remote server if it is
  explicitly pushed with :code:`git push origin --tags`

The syntax chosen for beta version numbers follows recommendations from
`PEP 440 <https://www.python.org/dev/peps/pep-0440/>`_. This syntax is
compatible with the PyPI pre-release support (i.e. :code:`pip install --pre mypackage`).
However, like bumpversion, coda just acts on text files; it's not specific to any
programming language.

Bugs
====

If you run into any problems with coda, please make an
`issue <https://github.com/3ptscience/coda/issues>`_




