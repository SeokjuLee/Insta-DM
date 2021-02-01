### Seokju Lee
############################################################################################################


### Dataset directory ###
TRAIN_SET=/home/rcv/seokju/cityscapes_256


### Cityscapes model ###
PRETRAINED=checkpoints/models-release/CS


############################################################################################################


### For training ###
CUDA_VISIBLE_DEVICES=0,1 python train.py $TRAIN_SET \
--pretrained-disp $PRETRAINED/resnet18_disp_cs.tar \
--pretrained-ego-pose $PRETRAINED/resnet18_ego_cs.tar \
--pretrained-obj-pose $PRETRAINED/resnet18_obj_cs.tar \
-b 4 -p 2.0 -c 1.0 -s 0.1 -o 0.02 -mc 0.1 -hp 0 -dm 0 -mni 2 \
--epoch-size 1000 \
--with-ssim --with-mask --with-auto-mask \
--name insta_dm_cs \


# ### For debugging ###
# CUDA_VISIBLE_DEVICES=2,3 python train.py $TRAIN_SET \
# --pretrained-disp $PRETRAINED/resnet18_disp_cs.tar \
# --pretrained-ego-pose $PRETRAINED/resnet18_ego_cs.tar \
# --pretrained-obj-pose $PRETRAINED/resnet18_obj_cs.tar \
# -b 1 -p 2.0 -c 1.0 -s 0.1 -o 0.02 -mc 0.1 -hp 0 -dm 0 -mni 2 \
# --epoch-size 1000 \
# --with-ssim --with-mask --with-auto-mask \
# -j 0 --name debug --debug-mode \
# --seed 0 \


