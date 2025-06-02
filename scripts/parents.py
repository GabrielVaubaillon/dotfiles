#!/bin/python

import argparse
import pathlib


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("cwd")
    args = parser.parse_args()
    cwd = pathlib.Path(args.cwd)
    for parent in cwd.parents:
        print(parent)


if __name__ == "__main__":
    main()
