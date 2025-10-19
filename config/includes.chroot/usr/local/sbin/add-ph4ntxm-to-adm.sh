#!/bin/sh
if id -u ph4ntxm >/dev/null 2>&1; then
    if ! id -nG ph4ntxm | grep -qw adm; then
        usermod -aG adm ph4ntxm
        echo "ph4ntxm added to adm"
    fi
fi
