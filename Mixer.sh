#!/bin/bash

export COMORMENT=/home/mdr
export SINGULARITY_BIND="$COMORMENT/mixer/reference:/REF:ro"
export SIF=$COMORMENT/mixer/singularity
export MIXER_COMMON_ARGS="--ld-file /REF/ldsc/1000G_EUR_Phase3_plink/1000G.EUR.QC.@.run4.ld --bim-file /REF/ldsc/1000G_EUR_Phase3_plink/1000G.EUR.QC.@.bim"
export PYTHON="singularity exec --home $PWD:/home $SIF/mixer.sif python"

for i in {1..20}
do
    export REP="rep$i"
    export EXTRACT="--extract /REF/ldsc/1000G_EUR_Phase3_plink/1000G.EUR.QC.prune_maf0p05_rand2M_r2p8.$REP.snps"
    $PYTHON /tools/mixer/precimed/mixer.py fit1 $MIXER_COMMON_ARGS $EXTRACT --trait1-file AD.sumstats.gz --out AD.fit.$REP
    $PYTHON /tools/mixer/precimed/mixer.py fit1 $MIXER_COMMON_ARGS $EXTRACT --trait1-file BSP.sumstats.gz --out BSP.fit.$REP
    $PYTHON /tools/mixer/precimed/mixer.py fit2 $MIXER_COMMON_ARGS $EXTRACT --trait1-file AD.sumstats.gz --trait2-file BSP.sumstats.gz --trait1-params AD.fit.$REP.json --trait2-params BSP.fit.$REP.json --out AD_vs_BSP.fit.$REP
    
    $PYTHON /tools/mixer/precimed/mixer.py test1 $MIXER_COMMON_ARGS --trait1-file AD.sumstats.gz --load-params AD.fit.$REP.json --out AD.test.$REP
    $PYTHON /tools/mixer/precimed/mixer.py test1 $MIXER_COMMON_ARGS --trait1-file BSP.sumstats.gz --load-params BSP.fit.$REP.json --out BSP.test.$REP
    $PYTHON /tools/mixer/precimed/mixer.py test2 $MIXER_COMMON_ARGS --trait1-file AD.sumstats.gz --trait2-file BSP.sumstats.gz --load-params AD_vs_BSP.fit.$REP.json --out AD_vs_BSP.test.$REP

done
