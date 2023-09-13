# Non-rigid infrared and visible image registration by enhanced affine transformation
Chaobo Min*, Yan Gu, Yingjie Li, Feng Yang

Pattern Recognition 106 (2020) 107377

https://doi.org/10.1016/j.patcog.2020.107377

Abstract:
Image registration is a prerequisite for infrared (IR) and visible (VIS) image fusion. In practical applica- tion, most scenes are not planar and there is significant distinctness between IR and VIS cameras. There- fore, for non-rigid IR and VIS image registration, non-linear transformation is more applicable than affine transformation. Typically, non-linear transformation is modeled with point feature. However, this can de- grade the generalization ability of transformation model and increase computational complexity. Aim at this problem, we propose an enhanced affine transformation (EAT) for non-rigid IR and VIS image regis- tration. In this paper, image registration is transformed into point set registration and then the optimal EAT model constructed by global deformation is estimated from local feature. At first, a Gaussian-fields- based objective function is established and simplified by using the potential correspondence between an image pair. With the combination of affine and polynomial transformation, the EAT model is then pro- posed to describe the regular pattern of non-rigid and global deformation between an image pair. Finally, a coarse-to-fine strategy based on quasi-Newton method is designed and applied to determine the op- timal transformation coefficients from edge point feature of IR and VIS images, in order to accomplish non-rigid image registration. The qualitative and quantitative comparisons on synthesized point sets and real images demonstrate that the proposed method is superior over the state-of-the-art methods in the accuracy and efficiency of image registration.

Requirements: Matlab 2014

Please all files and then run A0_image_r_main_released.m.
