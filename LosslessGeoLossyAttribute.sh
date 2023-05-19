#!/bin/bash

dirs=( "/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/10bits_TestPCs/MPEG8i/loot/Ply/loot_vox10_1000.ply"   )



rates=("/r01" "/r02" "/r03" "/r04" "/r05" "/r06"  )

pcs=(  "loot_vox10_1000.ply"    )




cfg="/home/datnguyen/Projects/MPEG/tmc13-v14/cfg_attribute/octree-raht/lossless-geom-lossy-attrs/redandblack_vox10_1550" #all file share the same cfg file




for idx in "${!dirs[@]}";
do
  for ridx in {0..1}; do
  make -f  $PWD/scripts/Makefile.tmc13-step -C "LossyAttribute${rates[$ridx]}"  VPATH="${cfg}${rates[$ridx]}"  ENCODER=$PWD/build/tmc3/tmc3  DECODER=$PWD/build/tmc3/tmc3  SRCSEQ=${dirs[$idx]}  VERBOSE=1 PCERROR=/home/datnguyen/Projects/MPEG/mpeg-pcc-dmetric-master/test/pc_error

done
done


{
for idx in "${!dirs[@]}";
do
  for ridx in {0..1}; do
  scripts/collect-tmc13.pl  "${cfg}${rates[$ridx]}" ${pcs[$idx]}  0   "/home/datnguyen/Projects/tmc13-v14/LossyAttribute${rates[$ridx]}/${pcs[$idx]}"  ${dirs[$idx]}
  done
done
} >LossyAttribute/results.txt


# make -f  $PWD/scripts/Makefile.tmc13-step -C LossyAttribute/r01/  VPATH=/home/datnguyen/Projects/MPEG/tmc13-v14/cfg_allQP/trisoup-predlift/lossy-geom-lossy-attrs/arco_valentino_dense_vox12/r01/  ENCODER=$PWD/build/tmc3/tmc3  DECODER=$PWD/build/tmc3/tmc3  SRCSEQ="/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/Arco_Valentino_Dense_vox12.ply"  VERBOSE=1 PCERROR=/home/datnguyen/Projects/MPEG/mpeg-pcc-dmetric-master/test/pc_error













