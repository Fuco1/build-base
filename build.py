#!/usr/bin/env python

from subprocess import call

def build_version(version_parts):
    return '.'.join(version_parts)

def run():
    with open('VERSION') as f:
        version = f.readlines()[0].strip();

    call(['docker', 'pull', 'ubuntu:xenial'])
    call(['docker', 'build', '-t', 'fuco1/build-base:' + version, '.'])
    version_parts = version.split('.')
    del version_parts[-1]
    while len(version_parts) > 0:
        call(['docker', 'tag', 'fuco1/build-base:' + version, 'fuco1/build-base:' + build_version(version_parts)])
        del version_parts[-1]

if __name__ == '__main__':
    run()
