#----------------------------------*-sh-*--------------------------------------
# =========                 |
# \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox
#  \\    /   O peration     |
#   \\  /    A nd           | Copyright (C) 2011-2016 OpenFOAM Foundation
#    \\/     M anipulation  |
#------------------------------------------------------------------------------
# License
#     This file is part of OpenFOAM.
#
#     OpenFOAM is free software: you can redistribute it and/or modify it
#     under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     (at your option) any later version.
#
#     OpenFOAM is distributed in the hope that it will be useful, but WITHOUT
#     ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#     FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
#     for more details.
#
#     You should have received a copy of the GNU General Public License
#     along with OpenFOAM.  If not, see <http://www.gnu.org/licenses/>.
#
# File
#     etc/config/unset.csh
#
# Description
#     Clear as many OpenFOAM environment settings as possible
#
#------------------------------------------------------------------------------

# Clean standard environment variables (PATH, LD_LIBRARY_PATH, MANPATH)

unset foamClean
if ( $?WM_PROJECT_DIR ) then
    set foamClean=$WM_PROJECT_DIR/bin/foamCleanPath
    if ( ! -f "$foamClean" || ! -x "$foamClean" ) unset foamClean
endif

# The old dirs to be cleaned from the environment variables
set foamOldDirs="$WM_PROJECT_DIR $WM_THIRD_PARTY_DIR \
    $HOME/$WM_PROJECT/$LOGNAME $WM_PROJECT_SITE \
    $FOAM_SITE_APPBIN $FOAM_SITE_LIBBIN $ParaView_DIR"


#------------------------------------------------------------------------------
# Unset WM_* environment variables

unsetenv WM_ARCH
unsetenv WM_ARCH_OPTION
unsetenv WM_CC
unsetenv WM_CFLAGS
unsetenv WM_COMPILER
unsetenv WM_COMPILER_TYPE
unsetenv WM_COMPILER_LIB_ARCH
unsetenv WM_COMPILE_OPTION
unsetenv WM_CXX
unsetenv WM_CXXFLAGS
unsetenv WM_DIR
unsetenv WM_HOSTS
unsetenv WM_LABEL_OPTION
unsetenv WM_LABEL_SIZE
unsetenv WM_LDFLAGS
unsetenv WM_LINK_LANGUAGE
unsetenv WM_MPLIB
unsetenv WM_NCOMPPROCS
unsetenv WM_OPTIONS
unsetenv WM_OSTYPE
unsetenv WM_PRECISION_OPTION
unsetenv WM_PROJECT
unsetenv WM_PROJECT_DIR
unsetenv WM_PROJECT_INST_DIR
unsetenv WM_PROJECT_SITE
unsetenv WM_PROJECT_USER_DIR
unsetenv WM_PROJECT_VERSION
unsetenv WM_SCHEDULER
unsetenv WM_THIRD_PARTY_DIR


#------------------------------------------------------------------------------
# Unset FOAM_* environment variables

unsetenv FOAM_APPBIN
unsetenv FOAM_APP
unsetenv FOAM_EXT_LIBBIN
unsetenv FOAM_CODE_TEMPLATES
unsetenv FOAM_INST_DIR
unsetenv FOAM_JOB_DIR
unsetenv FOAM_LIBBIN
unsetenv FOAM_MPI
unsetenv FOAM_RUN
unsetenv FOAM_SETTINGS
unsetenv FOAM_SIGFPE
unsetenv FOAM_SIGNAN
unsetenv FOAM_SITE_APPBIN
unsetenv FOAM_SITE_LIBBIN
unsetenv FOAM_SOLVERS
unsetenv FOAM_SRC
unsetenv FOAM_TUTORIALS
unsetenv FOAM_USER_APPBIN
unsetenv FOAM_USER_LIBBIN
unsetenv FOAM_UTILITIES


#------------------------------------------------------------------------------
# Unset MPI-related environment variables

unsetenv MPI_ARCH_PATH
unsetenv MPI_BUFFER_SIZE
unsetenv OPAL_PREFIX


#------------------------------------------------------------------------------
# Unset Ensight/ParaView-related environment variables

unsetenv ENSIGHT9_READER
unsetenv CMAKE_HOME
unsetenv ParaView_DIR
unsetenv ParaView_INCLUDE_DIR
unsetenv ParaView_MAJOR
unsetenv ParaView_VERSION
unsetenv PV_PLUGIN_PATH


#------------------------------------------------------------------------------
# Unset CGAL-related environment variables

unsetenv CGAL_ARCH_PATH


#------------------------------------------------------------------------------
# Cleanup environment
# PATH, LD_LIBRARY_PATH, MANPATH

if ( $?foamClean ) then

    set cleaned=`$foamClean "$PATH" "$foamOldDirs"`
    if ( $status == 0 ) setenv PATH $cleaned

    if ($?LD_LIBRARY_PATH) then
        set cleaned=`$foamClean "$LD_LIBRARY_PATH" "$foamOldDirs"`
        if ( $status == 0 ) setenv LD_LIBRARY_PATH $cleaned

        if ( ${%LD_LIBRARY_PATH} == 0 ) unsetenv LD_LIBRARY_PATH
    endif

    if ($?MANPATH) then
        set cleaned=`$foamClean "$MANPATH" "$foamOldDirs"`
        if ( $status == 0 ) setenv MANPATH $cleaned

        if ( ${%MANPATH} == 0 ) unsetenv MANPATH
    endif

endif


unset cleaned foamClean foamOldDirs

#------------------------------------------------------------------------------
# Cleanup aliases

unalias wmSet
unalias wm64
unalias wm32
unalias wmSP
unalias wmDP

unalias wmUnset

unalias wmSchedOn
unalias wmSchedOff

unalias foam
unalias foamSite

unalias src
unalias lib
unalias app
unalias sol
unalias util
unalias tut
unalias run

unalias foamVersion
unalias foamPV


#------------------------------------------------------------------------------
