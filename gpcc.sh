#!/bin/bash
#dirs=(  "../Datasets/TestPCs/10bits/phil_0010.ply"  "../Datasets/TestPCs/10bits/ricardo_0010.ply"  "../Datasets/TestPCs/10bits/redandblack_vox10_1510.ply"  "../Datasets/TestPCs/10bits/loot_vox10_1000.ply"  "../Datasets/TestPCs/10bits/MPEG_Thaidancer_vox10.ply"   "../Datasets/TestPCs/10bits/MPEG_boxer_vox10.ply"  "../Datasets/TestPCs/10bits/MPEG_CAT1_Frog_00067_vox10.ply"  "../Datasets/TestPCs/10bits/MPEG_CAT1_Arco_Valentino_Dense_vox10.ply"  "../Datasets/TestPCs/10bits/MPEG_CAT1_Shiva_00035_vox10.ply"  "../Datasets/TestPCs/10bits/PAULO_bumbameuboi.ply"  "../Datasets/TestPCs/10bits/PAULO_romanoillamp.ply"   )



dirs=("../Datasets/TestPCs/10bits/phil_0010.ply"  "../Datasets/TestPCs/10bits/ricardo_0010.ply"   "../Datasets/TestPCs/10bits/andrew_0010.ply"   "../Datasets/TestPCs/10bits/redandblack_vox10_1510.ply"  "../Datasets/TestPCs/10bits/loot_vox10_1000.ply"  "../Datasets/TestPCs/10bits/soldier_vox10_0569.ply")
#dirs=("../Datasets/TestPCs/10bits/basketball322.ply" "../Datasets/TestPCs/10bits/exercise_vox11_00000013.ply" "../Datasets/TestPCs/10bits/model_vox11_00000051.ply.ply" "../Datasets/TestPCs/10bits/dancer_vox11_00000136.ply")
#dirs=("../Datasets/TestPCs/TCSVT_CNeT/10bits/redandblack_vox10_1550.ply"  "../Datasets/TestPCs/TCSVT_CNeT/10bits/phil_0010.ply" "../Datasets/TestPCs/TCSVT_CNeT/9bits/redandblack_vox10_1550.ply"  "../Datasets/TestPCs/TCSVT_CNeT/9bits/phil_0010.ply" "../Datasets/TestPCs/TCSVT_CNeT/8bits/redandblack_vox10_1550.ply"  "../Datasets/TestPCs/TCSVT_CNeT/8bits/phil_0010.ply" "../Datasets/TestPCs/TCSVT_CNeT/7bits/redandblack_vox10_1550.ply"  "../Datasets/TestPCs/TCSVT_CNeT/7bits/phil_0010.ply"  )

#dirs=("../Datasets/TestPCs/TCSVT_CNeT/9bits2/redandblack_vox10_1550.ply"  "../Datasets/TestPCs/TCSVT_CNeT/9bits2/loot_vox10_1200.ply" )

dirs=(   "../Datasets/TestPCs/10bits/redandblack_vox10_1510.ply"  "../Datasets/TestPCs/10bits/loot_vox10_1000.ply"  "../Datasets/TestPCs/10bits/MPEG_Thaidancer_vox10.ply"   "../Datasets/TestPCs/10bits/MPEG_boxer_vox10.ply" )
for entry in "${dirs[@]}";
do
 # for entry in "$search_dir"*
 # do
  echo "ENCODING: $entry"

  build/tmc3/tmc3 --mode=0 --compressedStreamPath="output/bitstream.ply.bin"  --mergeDuplicatedPoints=0 --convertPlyColourspace=1 --trisoupNodeSizeLog2=0  --neighbourAvailBoundaryLog2=8 --intra_pred_max_node_size_log2=6 --planarEnabled=1  --uncompressedDataPath=$entry --levelOfDetailCount=12 --intraLodPredictionSkipLayers=0  --adaptivePredictionThreshold=64 --qpChromaOffset=0 --qp=4  --bitdepth=8  --attribute=color
#  python -m utils.ds_down_sample $entry none
  #echo "Decoding: $entry"
build/tmc3/tmc3 --mode=1 --compressedStreamPath="output/bitstream.ply.bin"  --mergeDuplicatedPoints=0 --convertPlyColourspace=1 --trisoupNodeSizeLog2=0  --neighbourAvailBoundaryLog2=8 --intra_pred_max_node_size_log2=6 --planarEnabled=1  --uncompressedDataPath=$entry --levelOfDetailCount=12 --intraLodPredictionSkipLayers=0  --adaptivePredictionThreshold=64 --qpChromaOffset=0 --qp=4  --bitdepth=8  --attribute=color --reconstructedDataPath="output.ply.bin.decoded.ply"

 # done
done

#pc.points=pc.points[['x', 'y', 'z', 'red', 'green', 'blue']];


