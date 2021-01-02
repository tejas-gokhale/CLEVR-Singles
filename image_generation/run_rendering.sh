BLENDER_DIR='/home/tgokhale/work/code/clevr-tejas-raven/blender-2.79b-linux-glibc219-x86_64'
VERSION='2.79'
echo $PWD >> $BLENDER_DIR/$VERSION/python/lib/python3.5/site-packages/clevr.pth
# CUDA_VISIBLE_DEVICES=1 $BLENDER_DIR/blender --background --python render_images_random.py -- --num_images 1000 --use_gpu 1 > ./render_log.out

CUDA_VISIBLE_DEVICES=1 nohup $BLENDER_DIR/blender -noaudio --background \
--python render_images.py -- --use_gpu 1 --num_images 10000 \
--start_idx 40000 --split train \
--min_objects 1 --max_objects 1 --min_pixels_per_object 400 \
--output_scene_dir ../output/singles_train/scenes \
--output_image_dir /home/tgokhale/work/data/clevr/CLEVR_singles/images/train/ \
> ./render_singles_log.out &

# --output_image_dir ./dump \
# --output_scene_dir ./dump \