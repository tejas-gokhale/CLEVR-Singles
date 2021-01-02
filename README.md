# CLEVR-Singles
Dataset generation code for the CLEVR-Singles dataset from the AAAI 2021 paper "Attribute-Guided Adversarial Training" https://arxiv.org/abs/2012.01806

This codebase is directly based on the CLEVR dataset generation code from https://github.com/facebookresearch/clevr-dataset-gen 

## 1. Setting up Blender
Images are rendered by using Blender. Our code works with Blender v2.79b. It may work with other versions too, but I have not tested it. For specific instructions on installation of Blender and it's Python version, please refer to https://github.com/facebookresearch/clevr-dataset-gen/tree/master/image_generation

## 2. Running Image Generation
Once you set up blFor rendering CLEVR-Singles images, please run the following commands
``` 
cd image_generation 
bash run_rendering.sh 
```

## 3. Details of run_rendering.sh
- Line-1 sets BLENDER_DIR, i.e. the path where you have installed Blender.  Please edit this for your version and system.  
- Line-2 sets the Blender Version. 2.79 is default. 
- Blender ships with its own version of Python 3.5, and it uses its bundled Python to execute scripts. Line-3 add this directory to the Python path of Blender's bundled Python.

Image generation is run via the python script `render_image.py` as :
```
CUDA_VISIBLE_DEVICES=1 nohup $BLENDER_DIR/blender -noaudio --background --python render_images.py \
-- --use_gpu 1 --num_images 60000 \
--start_idx 0 --split train \
--min_objects 1 --max_objects 1 --min_pixels_per_object 400 \
--output_scene_dir ../output/singles_train/scenes \
--output_image_dir /home/tgokhale/work/data/clevr/CLEVR_singles/images/train/ \
> ./render_singles_log.out &
```

- `--use_gpu ` can be turned on (1) or off (0). The code runs in both modes.
- `--num_images` is the number of images you want to generation (default: 60000)
- `start_idx` is the image index you want to start from.  Note that sometimes Blender quits unexpectedly, so you may need to restart image generation from the last index. 
`--split` denotes train/val/test splits
`--min_objects` and `-max_objects` must both be set to 1.  In the original CLEVR code multiple objects are allowed in each image, but in CLEVR-Singles (as the name suggests), each object only has one object. 
`--min_pixels_per_object` should be set at 400 for the current resolution
`--output_scene_dir` and `output_image_dir` are the paths where you want to save the generated images



