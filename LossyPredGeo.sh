#!/bin/bash

dirs=( "/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/Shiva_00035_vox12.ply"   "/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/Frog_00067_vox12.ply"  "/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/House_without_roof_00057_vox12.ply"  "/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/Arco_Valentino_Dense_vox12.ply"  "/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/Egyptian_mask_vox12.ply"  "/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/Facade_00009_vox12.ply"      )

#/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_multiQP/octree-raht/lossy-geom-lossy-attrs

cfgs=("/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_allQP/predgeom-raht/lossy-geom-lossy-attrs/shiva_00035_vox12"   "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_allQP/predgeom-raht/lossy-geom-lossy-attrs/frog_00067_vox12"  "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_allQP/predgeom-raht/lossy-geom-lossy-attrs/house_without_roof_00057_vox12"  "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_allQP/predgeom-raht/lossy-geom-lossy-attrs/arco_valentino_dense_vox12"  "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_allQP/predgeom-raht/lossy-geom-lossy-attrs/egyptian_mask_vox12"  "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_allQP/predgeom-raht/lossy-geom-lossy-attrs/facade_00009_vox12"    )


rates=("/r01" "/r02" "/r03" "/r04" "/r05" "/r06" "/r07" "/r08" "/r09" "/r10" "/r11" "/r12" "/r13" "/r14" "/r15"  )

pcs=(  "Shiva_00035_vox12.ply"   "Frog_00067_vox12.ply"  "House_without_roof_00057_vox12.ply"  "Arco_Valentino_Dense_vox12.ply"  "Egyptian_mask_vox12.ply"  "Facade_00009_vox12.ply"  )




cfgs=("/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_allQP/predgeom-raht/lossy-geom-lossy-attrs/shiva_00035_vox12"   "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_allQP/predgeom-raht/lossy-geom-lossy-attrs/frog_00067_vox12"  "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_allQP/predgeom-raht/lossy-geom-lossy-attrs/house_without_roof_00057_vox12"  "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_allQP/predgeom-raht/lossy-geom-lossy-attrs/arco_valentino_dense_vox12"  "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_allQP/predgeom-raht/lossy-geom-lossy-attrs/egyptian_mask_vox12"  "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_allQP/predgeom-raht/lossy-geom-lossy-attrs/facade_00009_vox12"    )

dirs=( "/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/Shiva_00035_vox12.ply"  )


for idx in "${!dirs[@]}";
do
  for ridx in {0..1}; do
  make -f  $PWD/scripts/Makefile.tmc13-step -C "LossyAttribute${rates[$ridx]}"  VPATH="${cfgs[$idx]}${rates[$ridx]}"  ENCODER=$PWD/build/tmc3/tmc3  DECODER=$PWD/build/tmc3/tmc3  SRCSEQ=${dirs[$idx]}  VERBOSE=1 PCERROR=/home/datnguyen/Projects/mpeg-pcc-dmetric-master/test/pc_error

done
done


{
for idx in "${!dirs[@]}";
do
  for ridx in {0..2}; do
  scripts/collect-tmc13.pl  "${cfgs[$idx]}${rates[$ridx]}" ${pcs[$idx]}  0   "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/LossyAttribute${rates[$ridx]}/${pcs[$idx]}"  ${dirs[$idx]}
  done
done
}> TestPredGeo.txt


make -f  $PWD/scripts/Makefile.tmc13-step -C LossyAttribute/r01/  VPATH=/home/datnguyen/Projects/MPEG/tmc13-v14/cfg_allQP/trisoup-predlift/lossy-geom-lossy-attrs/arco_valentino_dense_vox12/r01/  ENCODER=$PWD/build/tmc3/tmc3  DECODER=$PWD/build/tmc3/tmc3  SRCSEQ="/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/Arco_Valentino_Dense_vox12.ply"  VERBOSE=1 PCERROR=/home/datnguyen/Projects/MPEG/mpeg-pcc-dmetric-master/test/pc_error













