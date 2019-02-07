#!/usr/bin/env python

import sys
import os
import json
import numpy as np
from pandas import *

# import the relevant code
import localcider
from localcider.sequenceParameters import SequenceParameters

# create an empty list 
list_of_SeqObjs = []

with open("FUS_mammals.seq") as f:
	#for each ortholog in the file
	for seq in f:
		try:
			list_of_SeqObjs.append(SequenceParameters(seq))
		except localcider.SequenceFileParserException:
      	# if we encounter a file parsing error just skip that sequence
      	continue

# for each 
for obj in list_of_SeqObjs:
   print obj.get_kappa()