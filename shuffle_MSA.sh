# Author: louisgt
# GOAL: shuffle the character states of columns in a multiple sequence alignment (MSA)
# Use these commands to 
	# 1. Split multifasta sequences in TAB-delimited characters (keep newlines)
	# 2. Transpose matrix and get rows of strings
	# 3. shuffle the rows of the transpose
	# 4. split the rows again into TAB-delim
	# 5. transpose the matrix again back to sequence format
	# 6. (optional) add numeric header to shuffled sequences


# split sequences into TAB-delimited blocks
sed 's/.\{1\}/&	/g' sequences.fa > delim.fa

# transpose TAB-delimited columns
awk '{for (f=1;f<=NF;f++) col[f] = col[f]""$f} END {for (f=1;f<=NF;f++) print col[f]}' delim.fa > transpose.fa

# shuffle rows
ruby -lpe '$_ = $_.chars.shuffle * "" if !/^>/' transpose.fa > shuffled.fa

# split rows
sed 's/.\{1\}/& /g' shuffled.fa > split.fa

# transpose back
awk '{for (f=1;f<=NF;f++) col[f] = col[f]""$f} END {for (f=1;f<=NF;f++) print col[f]}' split.fa > shuffled_sequences.fa

# add numeric header
awk '{print ">" NR; print $0}' shuffled_sequences.fa > shuffled_MSA.fa