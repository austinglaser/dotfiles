################################################################################
# %CAMELCLASS% makefile                                                        #
#                                                                              #
# This file provides:                                                          #
# - %MACROCLASS%_INC           Directories to search for %CAMELCLASS% headers  #
# - %MACROCLASS%_SRC           %CAMELCLASS% source files                       #
# - %MACROCLASS%_ASM           %CAMELCLASS% assembly files                     #
# - %MACROCLASS%_DEF           %CAMELCLASS% preprocessor definitions           #
# - %MACROCLASS%_TEST          %CAMELCLASS% test directories                   #
# - %MACROCLASS%_TESTDEF       %CAMELCLASS% test defines                       #
# - %MACROCLASS%_TESTSUPPORT   %CAMELCLASS% test support directories           #
################################################################################

# --- DIRECTORIES ------------------------------------------------------------ #

%MACROCLASS%_DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

# --- HEADERS ---------------------------------------------------------------- #

%MACROCLASS%_INC :=

# --- SOURCES ---------------------------------------------------------------- #

%MACROCLASS%_SRC :=

# --- ASSEMBLY --------------------------------------------------------------- #

%MACROCLASS%_ASM :=

# --- DEFINITIONS ------------------------------------------------------------ #

%MACROCLASS%_DEF :=

# --- TESTS ------------------------------------------------------------------ #

%MACROCLASS%_TEST        :=

%MACROCLASS%_TESTDEF     :=

%MACROCLASS%_TESTSUPPORT :=
