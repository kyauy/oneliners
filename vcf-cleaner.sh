#!/usr/bin/env/ bash

### 
# VCF Cleaner, mostly for SeqNext VCF
# mobidic
# 03/10/2018
##

for i in raw_vcf/*.vcf ; do 
echo $i
  if grep -q contig $i 
    then 
      echo contig is found in VCF Header 
    else 
      sed -i '/=VCF/r doc/contig_hg19.txt' $i 
  fi

sed -i "s/ //g" $i 
sed -i "s/\tS1/\t$(basename "$i" | cut -d. -f1)/g"  $i

mkdir vcf_clean/$(basename "$i" | cut -d. -f1)
cp doc/captainAchab_inputs.json vcf_clean/$(basename "$i" | cut -d. -f1)
sed -i "s/S1/$(basename "$i" | cut -d. -f1)/g" vcf_clean/$(basename "$i" | cut -d. -f1)/captainAchab_inputs.json

awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' $i > vcf_clean/$(basename "$i" | cut -d. -f1)/$(basename "$i" | cut -d. -f1).vcf

done
