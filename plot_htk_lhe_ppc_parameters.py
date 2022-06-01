#!/usr/bin/env python
# coding: utf-8

# code for performing positive pixel count annotation of tiles 

import histomicstk as htk
import numpy as np
import scipy as sp
import skimage.io
import skimage.measure
import skimage.color
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
get_ipython().run_line_magic('matplotlib', 'inline')

plt.rcParams['figure.figsize'] = 10, 10
plt.rcParams['image.cmap'] = 'gray'
titlesize = 24

#load data
input_dir_n_0 = ""
input_dir_n_1 = ""
input_dir_i_0 = ""
input_dir_i_1 = ""

input_image_file_n0_1 = input_dir_n_0 + "0_42054_x_12000_y_14624_a_100.000.png"
im_n0_1 = skimage.io.imread(input_image_file_n0_1)[:, :, :3]
input_image_file_n0_2 = input_dir_n_0 + "0_42058_x_13712_y_18912_a_100.000.png"
im_n0_2 = skimage.io.imread(input_image_file_n0_2)[:, :, :3]

input_image_file_n0_1 = input_dir_n_1 + "0_42165_x_28736_y_13472_a_100.000.png"
im_n1_1 = skimage.io.imread(input_image_file_n0_1)[:, :, :3]
input_image_file_n0_2 = input_dir_n_1 + "0_42470_x_18688_y_15296_a_100.000.png"
im_n1_2 = skimage.io.imread(input_image_file_n0_2)[:, :, :3]

input_image_file_i0_1 = input_dir_i_0 + "0_42402_x_28512_y_23296_a_100.000.png"
im_i0_1 = skimage.io.imread(input_image_file_i0_1)[:, :, :3]
input_image_file_i0_2 = input_dir_i_0 + "0_42405_x_32112_y_25088_a_100.000.png"
im_i0_2 = skimage.io.imread(input_image_file_i0_2)[:, :, :3]

input_image_file_i1_1 = input_dir_i_1 + "0_42432_x_34064_y_13200_a_100.000.png"
im_i1_1 = skimage.io.imread(input_image_file_i1_1)[:, :, :3]
input_image_file_i1_2 = input_dir_i_1 + "0_42476_x_26240_y_15328_a_100.000.png"
im_i1_2 = skimage.io.imread(input_image_file_i1_2)[:, :, :3]

import histomicstk.segmentation.positive_pixel_count as ppc

template_params = ppc.Parameters(
    hue_value=0.625,
    hue_width=0.1,
    saturation_minimum=0.05,
    intensity_upper_limit=0.9,
    intensity_weak_threshold=0.4,
    intensity_strong_threshold=0.3,
    intensity_lower_limit=0.1,
)

f, axarr = plt.subplots(4,4)

axarr[0,0].imshow(im_n0_1)
axarr[0,0].title.set_text('id:42054 x:12000 y:14624')
label_image = ppc.count_image(im_n0_1, template_params)[1]
axarr[0,1].imshow(im_n0_1)
axarr[0,1].title.set_text('annotation')
axarr[0,1].imshow(label_image, cmap='jet', alpha=0.4)

axarr[1,0].imshow(im_n0_2)
axarr[1,0].title.set_text('id:42058 x:13712 y:18912')
label_image = ppc.count_image(im_n0_2, template_params)[1]
axarr[1,1].imshow(im_n0_2)
axarr[1,1].title.set_text('annotation')
axarr[1,1].imshow(label_image, cmap='jet', alpha=0.4)

axarr[2,0].imshow(im_n1_1)
axarr[2,0].title.set_text('id:42165 x:28736 y:13472')
label_image = ppc.count_image(im_n1_1, template_params)[1]
axarr[2,1].imshow(im_n1_1)
axarr[2,1].title.set_text('annotation')
axarr[2,1].imshow(label_image, cmap='jet', alpha=0.4)

axarr[3,0].imshow(im_n1_2)
axarr[3,0].title.set_text('id:42470 x:18688 y:15296')
label_image = ppc.count_image(im_n1_2, template_params)[1]
axarr[3,1].imshow(im_n1_2)
axarr[3,1].title.set_text('annotation')
axarr[3,1].imshow(label_image, cmap='jet', alpha=0.4)

axarr[0,2].imshow(im_i0_1)
axarr[0,2].title.set_text('id:42402 x:28512 y:23296')
label_image = ppc.count_image(im_i0_1, template_params)[1]
axarr[0,3].imshow(im_i0_1)
axarr[0,3].title.set_text('annotation')
axarr[0,3].imshow(label_image, cmap='jet', alpha=0.4)

axarr[1,2].imshow(im_i0_2)
axarr[1,2].title.set_text('id:42405 x:32112 y:25088')
label_image = ppc.count_image(im_i0_2, template_params)[1]
axarr[1,3].imshow(im_i0_2)
axarr[1,3].title.set_text('annotation')
axarr[1,3].imshow(label_image, cmap='jet', alpha=0.4)

axarr[2,2].imshow(im_i1_1)
axarr[2,2].title.set_text('id:42432 x:34064 y:13200')
label_image = ppc.count_image(im_i1_1, template_params)[1]
axarr[2,3].imshow(im_i1_1)
axarr[2,3].title.set_text('annotation')
axarr[2,3].imshow(label_image, cmap='jet', alpha=0.4)

axarr[3,2].imshow(im_i1_2)
axarr[3,2].title.set_text('id:42476 x:26240 y:15328')
label_image = ppc.count_image(im_i1_2, template_params)[1]
axarr[3,3].imshow(im_i1_2)
axarr[3,3].title.set_text('annotation')
axarr[3,3].imshow(label_image, cmap='jet', alpha=0.4)

plt.setp(plt.gcf().get_axes(), xticks=[], yticks=[]);

f.set_size_inches(12, 12)
#output
f.savefig('', dpi=300)
