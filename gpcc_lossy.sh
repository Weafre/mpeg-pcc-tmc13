#!/bin/bash
#dirs=(  "/home/datnguyen/Projects/Datasets/TestPCs/10bits/phil_0010.ply"  "/home/datnguyen/Projects/Datasets/TestPCs/10bits/ricardo_0010.ply"  "/home/datnguyen/Projects/Datasets/TestPCs/10bits/redandblack_vox10_1510.ply"  "/home/datnguyen/Projects/Datasets/TestPCs/10bits/loot_vox10_1000.ply"  "/home/datnguyen/Projects/Datasets/TestPCs/10bits/MPEG_Thaidancer_vox10.ply"   "/home/datnguyen/Projects/Datasets/TestPCs/10bits/MPEG_boxer_vox10.ply"  "/home/datnguyen/Projects/Datasets/TestPCs/10bits/MPEG_CAT1_Frog_00067_vox10.ply"  "/home/datnguyen/Projects/Datasets/TestPCs/10bits/MPEG_CAT1_Arco_Valentino_Dense_vox10.ply"  "/home/datnguyen/Projects/Datasets/TestPCs/10bits/MPEG_CAT1_Shiva_00035_vox10.ply"  "/home/datnguyen/Projects/Datasets/TestPCs/10bits/PAULO_bumbameuboi.ply"  "/home/datnguyen/Projects/Datasets/TestPCs/10bits/PAULO_romanoillamp.ply"   )
#dirs=("../Datasets/TestPCs/10bits/phil_0010.ply"  "../Datasets/TestPCs/10bits/ricardo_0010.ply"   "../Datasets/TestPCs/10bits/andrew_0010.ply"   "../Datasets/TestPCs/10bits/redandblack_vox10_1510.ply"  "../Datasets/TestPCs/10bits/loot_vox10_1000.ply"  "../Datasets/TestPCs/10bits/soldier_vox10_0569.ply")
dirs=( "/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/redandblack_vox10_1550.ply"  "/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/loot_vox10_1200.ply"  "/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/longdress_vox10_1300.ply"  "/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/soldier_vox10_0690.ply" "/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/Shiva_00035_vox12.ply"   "/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/Frog_00067_vox12.ply"  "/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/House_without_roof_00057_vox12.ply"  "/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/Arco_Valentino_Dense_vox12.ply"  "/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/Egyptian_mask_vox12.ply"  "/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/Facade_00009_vox12.ply"      )

#/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_multiQP/octree-raht/lossy-geom-lossy-attrs

cfgs=("/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_multiQP/predgeom-raht/lossy-geom-lossy-attrs/redandblack_vox10_1550"  "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_multiQP/predgeom-raht/lossy-geom-lossy-attrs/loot_vox10_1200"  "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_multiQP/predgeom-raht/lossy-geom-lossy-attrs/longdress_vox10_1300"  "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_multiQP/predgeom-raht/lossy-geom-lossy-attrs/soldier_vox10_0690" "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_multiQP/predgeom-raht/lossy-geom-lossy-attrs/shiva_00035_vox12"   "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_multiQP/predgeom-raht/lossy-geom-lossy-attrs/frog_00067_vox12"  "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_multiQP/predgeom-raht/lossy-geom-lossy-attrs/house_without_roof_00057_vox12"  "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_multiQP/predgeom-raht/lossy-geom-lossy-attrs/arco_valentino_dense_vox12"  "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_multiQP/predgeom-raht/lossy-geom-lossy-attrs/egyptian_mask_vox12"  "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_multiQP/predgeom-raht/lossy-geom-lossy-attrs/facade_00009_vox12"    )
pcs=(  "redandblack_vox10_1550.ply"  "loot_vox10_1200.ply"  "longdress_vox10_1300.ply"  "soldier_vox10_0690.ply" "Shiva_00035_vox12.ply"   "Frog_00067_vox12.ply"  "House_without_roof_00057_vox12.ply"  "Arco_Valentino_Dense_vox12.ply"  "Egyptian_mask_vox12.ply"  "Facade_00009_vox12.ply"  )





rates=("/r01" "/r02" "/r03" "/r04" "/r05" "/r06" "/r07" "/r08" "/r09" "/r10" "/r11" "/r12" "/r13" "/r14" "/r15"  )
#rates=("/r01" "/r02" "/r03" "/r04" "/r05" "/r06"  )

#/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_multiQP/predgeom-raht/lossy-geom-lossy-attrs
# for idx in "${!dirs[@]}";
# do
# 	for ridx in {0..14}; do
# 	make -f  $PWD/scripts/Makefile.tmc13-step -C "OutputPredGeo${rates[$ridx]}"  VPATH="${cfgs[$idx]}${rates[$ridx]}"  ENCODER=$PWD/build/tmc3/tmc3  DECODER=$PWD/build/tmc3/tmc3  SRCSEQ=${dirs[$idx]}  VERBOSE=1 PCERROR=/home/datnguyen/Projects/mpeg-pcc-dmetric-master/test/pc_error

# 	#scripts/collect-tmc13.pl  "${cfgs[$idx]}${rates[$ridx]}" ${pcs[$idx]}  0   "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/Output${rates[$ridx]}/${pcs[$idx]}"  ${dirs[$idx]} > bdbible.txt
# 	done
# done

{
for idx in "${!dirs[@]}";
do
	for ridx in {0..14}; do
	scripts/collect-tmc13.pl  "${cfgs[$idx]}${rates[$ridx]}" ${pcs[$idx]}  0   "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/OutputPredGeo${rates[$ridx]}/${pcs[$idx]}"  ${dirs[$idx]}
	done
done
}> PredOctree.txt

#/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_multiQP/trisoup-raht/lossy-geom-lossy-attrs

#cfgs=("/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_multiQP/trisoup-raht/lossy-geom-lossy-attrs/redandblack_vox10_1550"  "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_multiQP/trisoup-raht/lossy-geom-lossy-attrs/loot_vox10_1200"  "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_multiQP/trisoup-raht/lossy-geom-lossy-attrs/longdress_vox10_1300"  "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_multiQP/trisoup-raht/lossy-geom-lossy-attrs/soldier_vox10_0690" "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_multiQP/trisoup-raht/lossy-geom-lossy-attrs/shiva_00035_vox12"   "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_multiQP/trisoup-raht/lossy-geom-lossy-attrs/frog_00067_vox12"  "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_multiQP/trisoup-raht/lossy-geom-lossy-attrs/house_without_roof_00057_vox12"  "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_multiQP/trisoup-raht/lossy-geom-lossy-attrs/arco_valentino_dense_vox12"  "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_multiQP/trisoup-raht/lossy-geom-lossy-attrs/egyptian_mask_vox12"  "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_multiQP/trisoup-raht/lossy-geom-lossy-attrs/facade_00009_vox12"    )
#
#for idx in "${!dirs[@]}";
#do
#	for ridx in {0..6}; do
#	make -f  $PWD/scripts/Makefile.tmc13-step -C "OutputGeoTrisoup${rates[$ridx]}"  VPATH="${cfgs[$idx]}${rates[$ridx]}"  ENCODER=$PWD/build/tmc3/tmc3  DECODER=$PWD/build/tmc3/tmc3  SRCSEQ=${dirs[$idx]}  VERBOSE=1 PCERROR=/home/datnguyen/Projects/mpeg-pcc-dmetric-master/test/pc_error
#	done
#done



 # {
 # for idx in "${!dirs[@]}";
 # do
 # 	for ridx in {0..6}; do
 # 	scripts/collect-tmc13.pl  "${cfgs[$idx]}${rates[$ridx]}" ${pcs[$idx]}  0   "/home/datnguyen/Projects/mpeg-pcc-tmc13v14/OutputGeoTrisoup${rates[$ridx]}/${pcs[$idx]}"  ${dirs[$idx]}
 # 	done
 # done
 # }> GeoTrisoup2.txt

# make -f  $PWD/scripts/Makefile.tmc13-step -C OutputGeoTrisoup/r06/  VPATH="/home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_multiQP/trisoup-raht/lossy-geom-lossy-attrs/arco_valentino_dense_vox12/r06"  ENCODER=$PWD/build/tmc3/tmc3  DECODER=$PWD/build/tmc3/tmc3  SRCSEQ="/home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/Arco_Valentino_Dense_vox12.ply"  VERBOSE=1 PCERROR=/home/datnguyen/Projects/mpeg-pcc-dmetric-master/test/pc_error

# scripts/collect-tmc13.pl  /home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg/predgeom-raht/lossless-geom-lossy-attrs/loot_vox10_1200 loot_vox10_1200 0 /home/datnguyen/Projects/mpeg-pcc-tmc13v14/Output/r02/loot_vox10_1200.ply  /home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/Arco_Valentino_Dense_vox12.ply

# scripts/collect-tmc13-dyna.pl  /home/datnguyen/Projects/mpeg-pcc-tmc13v14/cfg_multiQP/octree-raht/lossy-geom-lossy-attrs/loot_vox10_1200 loot_vox10_1200 0 /home/datnguyen/Projects/mpeg-pcc-tmc13v14/OutputGeoOctree/r02/loot_vox10_1200.ply  /home/datnguyen/Projects/Datasets/MPEG_MVUB_CAT_9_12bits/Static_Objects_and_Scenes/Cat1_quantized/loot_vox10_1200.ply
