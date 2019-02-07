for (i in uniprot_acc$Accession) {
      print(i)
      convR = keggConv("genes",paste("uniprot:",trimws(i),sep=""))
      if(identical(convR, character(0))){
        next
      }
      linkR = keggLink("ko",convR)
      if(identical(linkR, character(0))){
         next
      }
      orthoList = keggLink("genes",linkR)
      seqList = keggGet(head(orthoList),option = "aaseq")
      while(length(orthoList)>10){
        print("trimming...")
        orthoList = tail(orthoList,-10)
        seqR = keggGet(head(orthoList),option = "aaseq")
        seqList = c(seqList,seqR)
      }
      seqR = keggGet(orthoList,option = "aaseq")
      seqList = c(seqList,seqR)
      path = paste("Documents/LLPS/human_orthologs/fasta/",trimws(i),".fa",sep="")
      print("Saving to file...")
      Biostrings::writeXStringSet(seqList,filepath = path)
}


