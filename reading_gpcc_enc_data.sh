#!/bin/bash
rates=("/r01" "/r02" "/r03" "/r04" "/r05" "/r06"  )

cfg="/home/datnguyen/Projects/MPEG/tmc13-v14/cfg_attribute/octree-raht/lossless-geom-lossy-attrs/redandblack_vox10_1550" #all file share the same cfg file

#dir="/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/10bits_TestPCs/MPEG8i/loot/Ply"

test_dirs=("/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/10bits_TrainPCs/MPEG_8i_10bit/soldier/Ply/"  )

pc_names=( "soldier10")


#test_dirs=( "/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/10bits_TestPCs/MPEG8i/loot/Ply"   )
#pc_names=( "loot10" )

for dir_idx in "${!test_dirs[@]}"; do
dir=${test_dirs[$dir_idx]}
pcs=()
names=()

for entry in "$dir"/*
do
  pcs+=($entry)
  basename=$(basename ${entry})
  names+=($basename)
done
#echo $pcs
#echo $dir
mkdir "conf2023/${pc_names[$dir_idx]}"

for ridx in {0..5}; do
mkdir "conf2023/${pc_names[$dir_idx]}${rates[$ridx]}"
for idx in "${!pcs[@]}";
do
  make -f  $PWD/scripts/Makefile.tmc13-step -C "conf2023/${pc_names[$dir_idx]}${rates[$ridx]}"  VPATH="${cfg}${rates[$ridx]}"  ENCODER=$PWD/build/tmc3/tmc3  DECODER=$PWD/build/tmc3/tmc3  SRCSEQ=${pcs[$idx]}  VERBOSE=1 PCERROR=/home/datnguyen/Projects/MPEG/mpeg-pcc-dmetric-master/test/pc_error &
  if (( $idx % 14 == 0 )); then wait; fi
done
done
wait
find conf2023/ -name "*.ply" -type f -delete


{
for ridx in {0..5}; do
for idx in "${!pcs[@]}";
do
  #scripts/collect-tmc13.pl  "${cfg}${rates[$ridx]}" ${names[$idx]}  0   "/home/datnguyen/Projects/MPEG/tmc13-v14/LossyAttribute${rates[$ridx]}/${names[$idx]}"  ${pcs[$idx]}
   scripts/collect-tmc13-dyna.pl  "${cfg}${rates[$ridx]}" ${names[$idx]}  0   "/home/datnguyen/Projects/MPEG/tmc13-v14/conf2023/${pc_names[$dir_idx]}${rates[$ridx]}/${names[$idx]}"  ${pcs[$idx]}
  done
done
}  > "conf2023/gpcc_${pc_names[$dir_idx]}.txt"

done


# make -f  $PWD/scripts/Makefile.tmc13-step -C LossyAttribute/r01/  VPATH=/home/datnguyen/Projects/MPEG/tmc13-v14/cfg_allQP/trisoup-predlift/lossy-geom-lossy-attrs/arco_valentino_dense_vox12/r01/  ENCODER=$PWD/build/tmc3/tmc3  DECODER=$PWD/build/tmc3/tmc3  SRCSEQ="/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/Arco_Valentino_Dense_vox12.ply"  VERBOSE=1 PCERROR=/home/datnguyen/Projects/MPEG/mpeg-pcc-dmetric-master/test/pc_error













