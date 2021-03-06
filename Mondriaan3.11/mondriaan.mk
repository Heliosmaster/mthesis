# Mondriaan global make settings.

# ==== Setup Mondriaan library settings ====
#
# These settings need to be set correctly for compilation to succeed!
#

# Could also be manually defined.
MONDRIAANHOMEDIR = $(CURDIR) 
MONDRIAANHOMEDIR := ${MONDRIAANHOMEDIR:/tools=}
MONDRIAANHOMEDIR := ${MONDRIAANHOMEDIR:/tests=}
MONDRIAANHOMEDIR := ${MONDRIAANHOMEDIR:/extra=}
MONDRIAANHOMEDIR := ${MONDRIAANHOMEDIR:/src=}
MONDRIAANHOMEDIR := $(strip $(MONDRIAANHOMEDIR))

MONDRIAANCURRENTVERSION := 3.11
MONDRIAANMAJORVERSION := 3

# ==== Matlab support ====
#
# To enable Matlab support, please uncomment the following line and insert the correct (global) Matlab home directory and the correct suffix to Matlab MEX files for your architecture.
#

MATLABHOMEDIR := /usr/local/matlab
MEXSUFFIX := mexa64

# ==== PaToH support ====
#
# To enable PaToH support, please uncomment the following line and insert the correct (global) PaToH home directory.
#

#PATOHHOMEDIR := /usr/local/patoh
#PATOHHOMEDIR := /home/davide/projects/mthesis/patoh/build/Linux-x86_64/
PATOHHOMEDIR := /home/students/3776123/mthesis/patoh/build/Linux-x86_64/


# ==== Compiler flags ====
# Debug/verbose, standard (default), performance flags.

#CFLAGS := -Wall -ansi -pedantic -O2 -DTIME -DUNIX -DINFO -g -DMONDRIAANVERSION=\"${MONDRIAANCURRENTVERSION}\"
#CFLAGS := -Wall -O2 -DTIME -DUNIX -march=native -DMONDRIAANVERSION=\"${MONDRIAANCURRENTVERSION}\" -DINFO
#CFLAGS := -Wall -DMONDRIAANVERSION=\"${MONDRIAANCURRENTVERSION}\" -O2
CFLAGS := -Wall -O3 -march=native -ffast-math -funroll-loops -fomit-frame-pointer -std=c99 -DMONDRIAANVERSION=\"${MONDRIAANCURRENTVERSION}\"


# ==== Standard compilation options (it should not be necessary to change these) ====
ifdef MONDRIAANHOMEDIR
MONDRIAANCOMPILEINFO := ==== Mondriaan ${MONDRIAANMAJORVERSION} version ${MONDRIAANCURRENTVERSION} ====
else
MONDRIAANCOMPILEINFO := !!!! The Mondriaan GLOBAL HOME DIRECTORY has not been set in mondriaan.mk! !!!!
endif

MONDRIAANINCLUDEDIR := ${MONDRIAANHOMEDIR}/src/include
MONDRIAANLIBDIR := ${MONDRIAANHOMEDIR}/src/lib

CC := gcc

CFLAGS := ${CFLAGS} -I${MONDRIAANINCLUDEDIR}

LIBS := -L${MONDRIAANLIBDIR} -lMondriaan${MONDRIAANMAJORVERSION}

# Matlab specific settings.
# Based on Peter Carbonetto's example Makefile for creating Matlab MEX executables.
ifdef MATLABHOMEDIR
MONDRIAANCOMPILEINFO := ${MONDRIAANCOMPILEINFO} + Matlab

CFLAGS := -DUSE_MATLAB -fPIC -pthread ${CFLAGS}

MEX := ${MATLABHOMEDIR}/bin/mex
MEXCFLAGS := ${CFLAGS} -fPIC -pthread -DMATLAB_MEX_FILE -I${MATLABHOMEDIR}/extern/include
MEXFLAGS := CC='${CC}' LD='${CC}' -largeArrayDims
endif

# PaToH specific settings.
ifdef PATOHHOMEDIR
MONDRIAANCOMPILEINFO := ${MONDRIAANCOMPILEINFO} + PaToH

CFLAGS := -DUSE_PATOH -I${PATOHHOMEDIR} ${CFLAGS}

LIBS := ${LIBS} -L${PATOHHOMEDIR} -lpatoh
endif

LIBS := ${LIBS} -lm


