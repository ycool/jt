#! /usr/bin/python

# a script to remove output of notebook. In case it is too big, it crashes
# notebook instance.

# usage
# cat notebook.ipynb | notebook_clean.py > notebook_clean.ipynb

import sys
from IPython.nbformat.current import read, write

json_in = read(sys.stdin, 'json')

for sheet in json_in.worksheets:
    for cell in sheet.cells:
        if "outputs" in cell:
            cell.outputs = []
        if "prompt_number" in cell:
            cell.prompt_number = ''

write(json_in, sys.stdout, 'json')
