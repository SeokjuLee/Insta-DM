### Seokju Lee
############################################################################################################


### Dataset directory ###
TRAIN_SET=/seokju/KITTI/kitti_256


### Cityscapes model ###
PRETRAINED=checkpoints/models-release/KITTI
# PRETRAINED=checkpoints/models-release/CS+KITTI


############################################################################################################


### For training ###
CUDA_VISIBLE_DEVICES=0,1 python train.py $TRAIN_SET \
--pretrained-disp $PRETRAINED/resnet18_disp_kt.tar \
--pretrained-ego-pose $PRETRAINED/resnet18_ego_kt.tar \
--pretrained-obj-pose $PRETRAINED/resnet18_obj_kt.tar \
-b 4 -p 2.0 -c 1.0 -s 0.1 -o 0.02 -mc 0.1 -hp 0 -dm 0 -mni 2 \
--epoch-size 1000 \
--with-ssim --with-mask --with-auto-mask \
--with-gt \
--name insta_dm_kt \


# ### For debugging ###
# CUDA_VISIBLE_DEVICES=2,3 python train.py $TRAIN_SET \
# --pretrained-disp $PRETRAINED/resnet18_disp_kt.tar \
# --pretrained-ego-pose $PRETRAINED/resnet18_ego_kt.tar \
# --pretrained-obj-pose $PRETRAINED/resnet18_obj_kt.tar \
# -b 1 -p 2.0 -c 1.0 -s 0.1 -o 0.02 -mc 0.1 -hp 0 -dm 0 -mni 2 \
# --epoch-size 1000 \
# --with-ssim --with-mask --with-auto-mask \
# --with-gt \
# -j 0 --name debug --debug-mode \
# --seed 0 \
