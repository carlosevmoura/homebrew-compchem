#!/usr/bin/env python

from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext
from os.path import join

import numpy

ext_modules = [Extension("orbkit.cy_grid",
                sources=["orbkit/cy_grid.pyx"],
                include_dirs=[numpy.get_include()]
                ),
               Extension("orbkit.cy_core",
                sources=["orbkit/cy_core.pyx",
                         "orbkit/c_grid-based.c",
                         "orbkit/c_support.c"],
                include_dirs=[numpy.get_include()],
                depends=[join('orbkit', '*.h')]
                ),
               Extension("orbkit.cy_overlap",
                sources=["orbkit/cy_overlap.pyx",
                         "orbkit/c_non-grid-based.c",
                         "orbkit/c_support.c"],
                include_dirs=[numpy.get_include()],
                depends=[join('orbkit', '*.h')]
                ),
                # detCI@ORBKIT
               Extension("orbkit.detci.cy_occ_check",
                sources=["orbkit/detci/cy_occ_check.pyx"],
                include_dirs=[numpy.get_include()]
                ),
               Extension("orbkit.detci.cy_ci",
                sources=["orbkit/detci/cy_ci.pyx"],
                include_dirs=[numpy.get_include()]
                )
]

for e in ext_modules:
    e.cython_directives = {'language_level': "3"} # all are Python-3

setup(
    cmdclass = {'build_ext': build_ext},
    ext_modules = ext_modules
)
