#!/bin/sh
# Runs the setup.

exec <%= scope.lookupvar('boxen::config::home') %>/repo/script/setup "$@"
