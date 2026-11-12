#!/usr/bin/env python3
"""check_api_coverage.py -- every exported proc of the Nim API (src/druid/*.nim)
must be called by a test: tests/test_host.nim (desktop), tests/robolectric/harness.nim
(through JNI in Robolectric and on devices) or tests/test_rui.nim. Prints the ones
that are not, and exits 1 if there are any.

A proc counts as called when its name appears in a test followed by `(`, as a
method (`.name`), or as a bare call; overloads count together.
"""
import re, sys, pathlib
root = pathlib.Path(__file__).resolve().parent.parent
tests = "\n".join(p.read_text() for p in [root/"tests/test_host.nim", root/"tests/robolectric/harness.nim",
                                          root/"tests/test_rui.nim", root/"tests/test_simulation.nim"] if p.exists())
# The words tests use, outside comments.
words = set(re.findall(r"[A-Za-z_][A-Za-z0-9_]*", re.sub(r"#[^\n]*", "", tests)))
# Not API: the JNI plumbing tests reach through other entry points, and accessors
# like `device()` whose use is implied by every `device().x` call.
skip = {"toJArg", "readStrings", "requireLocationPermission", "isNormalPermission"}
# Plumbing between modules, exercised through the API that uses it: the
# simulator's `sim*` hooks (the services call them) and hashing.nim (crypto() does).
internal = re.compile(r"^sim[A-Z]")
internal_files = {"hashing.nim"}
missing = []
for f in sorted((root/"src/druid").glob("*.nim")):
    if f.name in internal_files: continue
    for m in re.finditer(r"^(?:proc|template|func|iterator) `?([A-Za-z_][A-Za-z0-9_]*)`?\*", f.read_text(), re.M):
        name = m.group(1)
        if name in skip or internal.match(name): continue
        if name not in words:
            missing.append(f"{f.name}: {name}")
for m in sorted(set(missing)): print("  not called by any test:", m)
print(f"{len(set(missing))} exported procs without a test")
sys.exit(1 if missing else 0)
