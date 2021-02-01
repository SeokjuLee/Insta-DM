### Seokju Lee
############################################################################################################


SCENE=/home/rcv/seokju/cityscapes_256/image/cologne_000078_000000_0

PRETRAINED=checkpoints/models-release/CS


############################################################################################################


### Unified Visual Odometry ###
CUDA_VISIBLE_DEVICES=0,1 python demo.py \
--data $SCENE \
--pretrained-disp $PRETRAINED/resnet18_disp_cs.tar \
--pretrained-ego-pose $PRETRAINED/resnet18_ego_cs.tar \
--pretrained-obj-pose $PRETRAINED/resnet18_obj_cs.tar \
--mni 3 \
--name demo \
--save-fig \
