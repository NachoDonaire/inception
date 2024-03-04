#!/bin/bash
set -e

trap "echo 'SIGTERM received, stopping Nginx'; nginx -s quit; exit 0" SIGTERM

nginx -g "daemon off;"
