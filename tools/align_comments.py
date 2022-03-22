#!/usr/bin/env python3
#
# Align the comments next to the code that indicate address/data to column 50
#   Useful after a find&replace unaligned these comments

import re
import os

def main():
    regex = re.compile(r"; \$[0-9A-F][0-9A-F][0-9A-F][0-9A-F]: ")
    basepath = os.path.dirname(__file__)
    for path, paths, files in os.walk(os.path.join(basepath, "..", "src")):
        for file in files:
            if file.endswith(".asm"):
                content = open(os.path.join(path, file), "rt").read().split("\n")
                new_content = []
                for line in content:
                    m = regex.search(line)
                    if m:
                        code = line[:m.span()[0]].rstrip()
                        if not ';' in code:
                            comment = line[m.span()[0]:]
                            code = code + " " * (49 - len(code))
                            line = code + " " + comment
                    new_content.append(line)
                open(os.path.join(path, file), "wt").write("\n".join(new_content))

if __name__ == "__main__":
    main()
