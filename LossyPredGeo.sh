#!/bin/bash

dirs=( "/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/Shiva_00035_vox12.ply"   "/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/Frog_00067_vox12.ply"  "/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/House_without_roof_00057_vox12.ply"  "/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/Arco_Valentino_Dense_vox12.ply"  "/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/Egyptian_mask_vox12.ply"  "/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/Facade_00009_vox12.ply"      )

#/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_multiQP/octree-raht/lossy-geom-lossy-attrs

cfgs=("/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg/predgeom-raht/lossy-geom-lossy-attrs/shiva_00035_vox12"   "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg/predgeom-raht/lossy-geom-lossy-attrs/frog_00067_vox12"  "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg/predgeom-raht/lossy-geom-lossy-attrs/house_without_roof_00057_vox12"  "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg/predgeom-raht/lossy-geom-lossy-attrs/arco_valentino_dense_vox12"  "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg/predgeom-raht/lossy-geom-lossy-attrs/egyptian_mask_vox12"  "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg/predgeom-raht/lossy-geom-lossy-attrs/facade_00009_vox12"    )


dirs=(  "/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/Arco_Valentino_Dense_vox12.ply"  )



rates=("/r01" "/r02" "/r03" "/r04" "/r05" "/r06" "/r07" "/r08" "/r09" "/r10" "/r11" "/r12" "/r13" "/r14" "/r15"  )



for idx in "${!dirs[@]}";
do
  for ridx in {0..14}; do
  make -f  $PWD/scripts/Makefile.tmc13-step -C "OutputPredGeo2${rates[$ridx]}"  VPATH="${cfgs[$idx]}${rates[$ridx]}"  ENCODER=$PWD/build/tmc3/tmc3  DECODER=$PWD/build/tmc3/tmc3  SRCSEQ=${dirs[$idx]}  VERBOSE=1 PCERROR=/home/datnguyen/Projects/mpeg-pcc-dmetric-master/test/pc_error

done



{
for idx in "${!dirs[@]}";
do
	for ridx in {0..14}; do
	scripts/collect-tmc13.pl  "${cfgs[$idx]}${rates[$ridx]}" ${pcs[$idx]}  0   "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/OutputPredGeo2${rates[$ridx]}/${pcs[$idx]}"  ${dirs[$idx]}
	done
done
}> TestPredGeo.txt

