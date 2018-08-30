# oneliners
and useful tips

## Line to move only folders that are selected in a txt file
```
IFS=$'\n' arr=($(cat MOCneg.txt)) ; for i in "${arr[@]}" ; do mv $i neg/$i ; done 
```

