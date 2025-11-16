#!/usr/bin/env python3
"""
Script to fix a manager file for jnim 0.5.2 compatibility
"""
import sys
import re

def fix_manager(content, manager_name):
    """Fix a manager file for jnim 0.5.2"""

    # Remove the type definition (it's in core.nim)
    content = re.sub(
        r'type\s+' + manager_name + r'\*\s*=\s*ref\s+object\s*\n(.*?\n)*?\n',
        '# Type is defined in core.nim as ' + manager_name + '\n# We just add methods here\n\n',
        content,
        flags=re.MULTILINE
    )

    # Replace .toJString with newJVMObject()
    content = re.sub(r'(\w+)\.toJString\b', r'newJVMObject(\1)', content)

    return content

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print("Usage: fix_manager.py <file> <manager_name>")
        sys.exit(1)

    filepath = sys.argv[1]
    manager_name = sys.argv[2]

    with open(filepath, 'r') as f:
        content = f.read()

    fixed = fix_manager(content, manager_name)

    with open(filepath, 'w') as f:
        f.write(fixed)

    print(f"Fixed {filepath}")
