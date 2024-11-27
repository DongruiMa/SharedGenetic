cd MetaXcan-master/software
conda activate MetaXcan

DATA=/home/mdr/MetaXcan-master/software/summary-gwas-imputation-master/src/data
METAXCAN=/home/mdr/MetaXcan-master/software
python $METAXCAN/SPrediXcan.py \
--model_db_path $DATA/JTI_TWAS/JTI_Brain_Putamen_basal_ganglia.db \
--covariance $DATA/JTI_TWAS/JTI_Brain_Putamen_basal_ganglia.txt.gz \
--gwas_folder $DATA/GWAS \
--gwas_file_pattern "AD_ldsc.txt" \
--snp_column SNP \
--effect_allele_column A1 \
--non_effect_allele_column A2 \
--beta_column BETA \
--pvalue_column P \
--output_file /home/mdr/MetaXcan-master/AD_JTI_Putamen_TWAS_results.csv