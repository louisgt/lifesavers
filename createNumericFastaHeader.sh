awk '{print ">Seq" NR; print $0}'

awk '/^>/{gsub(/^>/,">Seq"i++" ");}1' i=1