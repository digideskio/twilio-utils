#!/bin/sh

#
# Script to clean out generated GNU auto* gunk.
#

set -e

echo "cleaning up"
rm -rf autom4te*.cache scripts aclocal.m4 configure config.log config.status .deps stamp-h1 a.out.dSYM
rm -f config.h.in config.h.in~ config.h
rm -f scripts
find . \( -name Makefile -o -name Makefile.in \) -print0 | xargs -0 rm -f
rm -f svnrev.c
rm -f *.o
rm -f twilio-utils-?.?.?.tar.gz
rm -f {smslen,twimsg,twiping,twilog}{,.1}
