#!/usr/bin/env python

import sys
from subprocess import call

def build_version(version_parts):
    return '.'.join(version_parts)

def run():
    with open('VERSION') as f:
        version = f.readlines()[0].strip();

    extra_args = sys.argv
    extra_args.pop(0)

    call(['docker', 'build'] + extra_args + ['-t', 'fuco1/build-base:' + version, '.'])

    version_parts = version.split('.')
    del version_parts[-1]
    while len(version_parts) > 0:
        call(['docker', 'tag', 'fuco1/build-base:' + version, 'fuco1/build-base:' + build_version(version_parts)])
        del version_parts[-1]

if __name__ == '__main__':
    run()
