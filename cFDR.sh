python /home/mdr/pleiofdr/python_convert/sumstats.py csv --auto --sumstats traitfolder/AD_full_version.txt --out traitfolder/AD_fdr.csv --force
python2.7 /home/mdr/pleiofdr/python_convert/sumstats.py mat --sumstats traitfolder/AD_fdr.csv --ref 9545380.ref --out traitfolder/AD_fdr.mat

python /home/mdr/pleiofdr/python_convert/sumstats.py csv --auto --sumstats traitfolder/BSP_full_version.txt --out traitfolder/BSP_fdr.csv --force
python2.7 /home/mdr/pleiofdr/python_convert/sumstats.py mat --sumstats traitfolder/BSP_fdr.csv --ref 9545380.ref --out traitfolder/BSP_fdr.mat

/home/mdr/MATLAB/bin/matlab  -nodisplay -nosplash < runme.m
