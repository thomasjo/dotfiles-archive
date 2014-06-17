#!/usr/bin/env python3

"""Creates symlinks for everything in the _ directory, into ~/.

Usage:
  symlink.py [--force]
  symlink.py (-h | --help)

Options:
  -h --help  Show this screen.
  --force    Overwrites any pre-existing symlink targets in ~/.

"""

import os
import re
from docopt import docopt

def main():
  arguments = docopt(__doc__)
  create_symlinks(arguments["--force"])

def create_symlinks(force=False):
  for root, dirs, files in os.walk("_/"):
    target_root = os.path.expanduser(re.sub(r"_/", "~/", root))
    if not os.path.isdir(target_root):
      print("Creating empty directory {0}".format(target_root))
      os.mkdir(target_root)

    for f in files:
      source = os.path.join(root, f)
      target = os.path.join(target_root, f)
      if os.path.islink(target) and force:
        print("Removing existing symlink {0}".format(target))
        os.remove(target)
      else:
        print("Skipping {0}".format(source))
        continue

      print("Creating symlink {0} -> {1}".format(source, target))
      os.symlink(source, target)

if __name__ == "__main__":
  main()
