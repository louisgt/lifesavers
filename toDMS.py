#!/usr/bin/env python

import sys
import re
import math
import numpy as np
import csv

AA_dict = {'A':2,'C':3,'D':4,'E':5,'F':6,'G':7,'H':8,'I':9,'K':10,'L':11,'M':12,'N':13,'P':14,'Q':15,'R':16,'S':17,'T':18,'V':19,'W':20,'Y':21}

def file_len(fname):
    with open(fname) as f:
        for i, l in enumerate(f):
            pass
    return i + 1

def main():
	line_count = file_len(sys.argv[1])
	seqlen = line_count/19
	current_pos = "1"
	current_wt = "M"
	with open(sys.argv[1]) as csvfile:
		with open("DMS_matrix.tsv",'w') as DMS_matrix:
			writer = csv.writer(DMS_matrix, delimiter='\t',escapechar=' ',quoting=csv.QUOTE_NONE)
			writer.writerow(["Gene_NUM",0,seqlen])
			reader = csv.DictReader(csvfile)
			selectList = ["DMS",current_pos]
			for row in reader:
				if(row['pos']==current_pos):
					#no change in position
					selectList.append(row['select'])
				else:
					selectList.insert(AA_dict[current_wt],"0")
					writer.writerow([' '.join(selectList)])
					current_pos = row['pos']
					current_wt = row['wt_aa']
					selectList = ["DMS",current_pos,row['select']]
			selectList.insert(AA_dict[current_wt],"0")
			writer.writerow([' '.join(selectList)])

main()