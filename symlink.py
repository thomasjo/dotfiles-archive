#!/usr/bin/env python

"""
Creates symlinks for everything in the _ directory, into ~/.

Usage:
  symlink.py [--force]
  symlink.py (-h | --help)

Options:
  -h --help  Show this screen.
  --force    Overwrites any pre-existing symlink targets in ~/.

"""

from __future__ import print_function

import os
import re

from docopt import docopt


def main():
    arguments = docopt(__doc__)
    create_symlinks(arguments["--force"])


def create_symlinks(force=False):
    """
    Walks through the entire '_/' directory, and creates symlinks.

    All pre-existing targets are skipped. Re-creation of symlinks can be
    forced, but all other conflicts are always skipped.
    """
    cwd = os.getcwd()
    for root, _, files in os.walk("_/"):
        target_root = os.path.expanduser(re.sub(r"_/", "~/", root))
        if not os.path.isdir(target_root):
            print("Creating empty directory {0}".format(target_root))
            os.mkdir(target_root)

        for file in files:
            source = os.path.join(cwd, root, file)
            target = os.path.join(target_root, file)
            if os.path.islink(target):
                if force:
                    print("Removing existing symlink {0}".format(target))
                    os.remove(target)
                else:
                    print("Skipping existing symlink {0}".format(target))
                    continue
            elif os.path.exists(target):
                print("Skipping conflicting target {0}".format(target))
                continue

            print("Creating symlink {0} -> {1}".format(source, target))
            os.symlink(source, target)


if __name__ == "__main__":
    main()
