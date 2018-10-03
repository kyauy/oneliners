# oneliners
and useful tips

## Line to move only folders that are selected in a txt file
```
IFS=$'\n' arr=($(cat MOCneg.txt)) ; for i in "${arr[@]}" ; do mv $i neg/$i ; done 
```

### Molludic match metrics in oneliners
```
for i in': for i in *hs_metrics.txt ; do SAMPLEID=$(basename "$i" | cut -d_ -f1 | cut -d. -f1) ; echo "SAMPLE" > ${SAMPLEID}_kd_sample.txt ; echo ${SAMPLEID} >> ${SAMPLEID}_kd_sample.txt ; grep -v "#" $i | head -3 | tail -2 > ${SAMPLEID}_tmp_hsmetrics.txt ; grep -v "#" ${SAMPLEID}_insertsize_metrics.txt | head -3 | tail -2  | paste ${SAMPLEID}_tmp_hsmetrics.txt -  > ${SAMPLEID}_tmp_kd_metrics.txt ; python3 /home/kevin/MoLLuDiC/matchkdmetrics.py ${SAMPLEID}_tmp_kd_metrics.txt | head -n2 > ${SAMPLEID}_tmp_kd_allmetrics.txt ; paste ${SAMPLEID}_kd_sample.txt ${SAMPLEID}_tmp_kd_allmetrics.txt > ${SAMPLEID}_kdTree_metrics.txt ; done
```

### Captain Achab Launcher
```
for i in /home/kevin/inputNGS/EXOME_V5/vcftest/{AJI,PR,M4,M9,M10,MAI}*.vcf
do
FAMILY=$(basename "$i" | cut -d. -f1)
grep -A 1 $FAMILY /home/thomas/EXOME_V5/familly.txt > tmp.txt
CASE=`awk -F "#" 'NR=2{print $1}' tmp.txt`
DAD=`awk -F "#" 'NR=2{print $2}' tmp.txt`
MUM=`awk -F "#" 'NR=2{print $3}' tmp.txt`
cp /home/kevin/Achabilarity/json/captainAchab_git_trio_inputs.json /home/kevin/Achabilarity/json/AJI/captainAchab_${CASE}_inputs.json
sed -i "s/XXX/${FAMILY}/g" /home/kevin/Achabilarity/json/AJI/captainAchab_${CASE}_inputs.json
sed -i "s/YYY/${}/g" /home/kevin/Achabilarity/json/AJI/captainAchab_${CASE}_inputs.json
usr/local/bin/singularity run -B /softs/ /home/kevin/Achabilarity/20180817_achabilarity.simg -i /home/kevin/Achabilarity/json/AJI/captainAchab_${CASE}_inputs.json   
done
```
### Captain Achab JSON
```
{
"captainAchab.workflowType":"CaptainAchab",
"captainAchab.srunLow":"",
"captainAchab.outDir": "/home/kevin/Achabilarity/output/",
"captainAchab.sampleID": "XXX",
"captainAchab.inputVcf": "/home/kevin/inputNGS/EXOME_V5/vcf/YYY.vcf",
"captainAchab.newHope": true,
"captainAchab.keepFiles":false,
"captainAchab.withPhenolyzer":true,
"captainAchab.checkTrio": "--trio",
"captainAchab.caseSample": "XXX",
"captainAchab.fatherSample": "YYY",
"captainAchab.motherSample": "ZZZ",
"captainAchab.diseaseFile": "",
"captainAchab.genesOfInterest": "",
"captainAchab.filterList":"",
"captainAchab.cnvGeneList":"/home/kevin/inputNGS/EXOME_V5/cnv/XXX.annotated.forachab.bed",       
"captainAchab.allelicFrequency": 0.012,
"captainAchab.mozaicRate":0.2,                                                          
"captainAchab.mozaicDP":5,                                                              
"captainAchab.customInfo":"",
"captainAchab.customVCF":"",                                                            
"captainAchab.humanDb": "/softs/annovar/humandb",                                       
"captainAchab.customXref": "/softs/annovar/humandb/gene_customfullxref.txt",            
"captainAchab.fastaGenome":"/softs/annovar/humandb/hg19.fa",                            
"captainAchab.phenolyzerExe": "/softwares/phenolyzer",                                  
"captainAchab.mpaExe": "/softwares/MPA/MPA.py",                                         
"captainAchab.tableAnnovarExe": "/softs/annovar/table_annovar.pl",                      
"captainAchab.achabExe": "/softwares/Captain-ACHAB/achab.pl",                           
"captainAchab.refAnnotateVariation":"/softs/annovar/annotate_variation.pl",             
"captainAchab.refCodingChange":"/softs/annovar/coding_change.pl",                       
"captainAchab.refConvert2Annovar":"/softs/annovar/convert2annovar.pl",                  
"captainAchab.refRetrieveSeqFromFasta":"/softs/annovar/retrieve_seq_from_fasta.pl",     
"captainAchab.refVariantsReduction":"/softs/annovar/variants_reduction.pl",             
"captainAchab.gatkExe":"/softwares/gatk-4.0.4.0/gatk",                                  
"captainAchab.bcftoolsExe":"/usr/local/bin/bcftools",                                   
"captainAchab.perlPath":"/usr/bin/perl",                                                
"captainAchab.pythonPath":"/usr/bin/python3",                                           
"captainAchab.memory":"9000",                                                           
"captainAchab.cpu":"1",                                                                 
"write_to_cache": true,                                                                 
"read_from_cache": true                                                                 
}                                                                                         
          
```

### VCF cleaner for SeqNext 

```bash

#!/usr/bin/env/ bash

###
# VCF Cleaner, mostly for SeqNext VCF
# mobidic
# 03/10/2018
##

##contig=<ID=chr1,length=249250621>
##contig=<ID=chr2,length=243199373>
##contig=<ID=chr3,length=198022430>
##contig=<ID=chr4,length=191154276>
##contig=<ID=chr5,length=180915260>
##contig=<ID=chr6,length=171115067>
##contig=<ID=chr7,length=159138663>
##contig=<ID=chr8,length=146364022>
##contig=<ID=chr9,length=141213431>
##contig=<ID=chr10,length=135534747>
##contig=<ID=chr11,length=135006516>
##contig=<ID=chr12,length=133851895>
##contig=<ID=chr13,length=115169878>
##contig=<ID=chr14,length=107349540>
##contig=<ID=chr15,length=102531392>
##contig=<ID=chr16,length=90354753>
##contig=<ID=chr17,length=81195210>
##contig=<ID=chr18,length=78077248>
##contig=<ID=chr19,length=59128983>
##contig=<ID=chr20,length=63025520>
##contig=<ID=chr21,length=48129895>
##contig=<ID=chr22,length=51304566>
##contig=<ID=chrX,length=155270560>
##contig=<ID=chrY,length=59373566>
##contig=<ID=chrM,length=16571>

for i in raw_vcf/*.vcf ; do
echo $i
 if grep -q contig $i
   then
     echo contig is found in VCF Header
   else
     sed -i '/=VCF/r doc/contig_hg19.txt' $i
 fi

sed -i "s/ //g" $i

awk '{if($0 !~ /^#/) print "chr"$0; else print $0}' $i > vcf_clean/$(basename "$i" | cut -d. -f1).vcf

done
```
