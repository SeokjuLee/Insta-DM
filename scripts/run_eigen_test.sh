### Seokju Lee
############################################################################################################


DATA_ROOT=/seokju2/KITTI/kitti_raw/
TEST_FILE=kitti_eval/test_files_eigen.txt
RESULTS_DIR=outputs/eigen_test/
PRED_FILE=outputs/eigen_test/predictions.npy


############################################################################################################


# DISP_NET=/seokju3/Insta_DM/checkpoints/models-release/KITTI/resnet18_disp_kt.tar
DISP_NET=/seokju3/Insta_DM/checkpoints/models-release/CS+KITTI/resnet18_disp_cs+kt.tar


############################################################################################################


### (1) Predict depth and save results to "$RESULTS_DIR/predictions.npy" ###
CUDA_VISIBLE_DEVICES=0,1 python3 ./kitti_eval/save_depth.py --img-height 256 --img-width 832 \
--pretrained-dispnet $DISP_NET --dataset-dir $DATA_ROOT --dataset-list $TEST_FILE --output-dir $RESULTS_DIR


### (2) Evaluate depth with GT ###
python3 ./kitti_eval/eval_depth.py --kitti_dir $DATA_ROOT --pred_file $PRED_FILE --test_file_list $TEST_FILE

