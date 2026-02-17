#!/bin/bash
#Assignment 4

#1 Making a BLAST database for mystery transcripts file
makeblastdb -in database_mystery_transcripts.fasta -dbtype nucl -out nuc_database 

#2 Making a BLAST database for mystery proteins file
makeblastdb -in database_mystery_proteins.fasta -dbtype prot -out prot_database 

#3 Searching mystery nucleotide query against the mystery transcripts database
blastn -db nuc_database -query query_mystery_nucleotide.fasta -evalue 0.001 -max_hsps 5 -outfmt 7 -out blastn_mystery_nucleotides_1.out

#4 Sequence names of most similar hits from #3
awk '{print $2}' blastn_mystery_nucleotides_1.out
#T010027234997
#T010003453160
#T010027234995

#5 Printing the sequence names with an identity over 90% from the above search to a new file called most_similar.txt
awk '$3 > 90 {print $2}' blastn_mystery_nucleotides_1.out > most_similar.txt

#6 Searching mystery protein query against the mystery protein database
blastp -db prot_database -query query_mystery_protein.fasta -evalue 0.00001 -max_hsps 15 -outfmt 7 -out blastn_mystery_proteins_1.out

#7 Sequence names of most similar hits from #6
awk '{print $2}' blastn_mystery_proteins_1.out
#P010027090796
#P010027090798
#P010027073865
#P010027077695
#P010027071558
#P010027071553

#8 Species of mystery_transcripts database file
#Finding the sequences
grep -A 1 "T010027234997" database_mystery_transcripts.fasta
grep -A 1 "T010003453160" database_mystery_transcripts.fasta
grep -A 1 "T010027234995" database_mystery_transcripts.fasta
#Copied and pasted sequences into NCBI
# ANSWER = Coffea arabica

#9 Species of mystery query
#Printing the sequence
cat query_mystery_nucleotide.fasta
#Copied and pasted sequence into NCBI
# ANSWER = Gardenia jasminoides

#10 Gene of mystery query
# ANSWER = The gene is a putative catalase.