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

