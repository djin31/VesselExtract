# VesselExtract
[U-net](https://arxiv.org/abs/1505.04597) based CNN for segmenting blood vessel and thereafter removal of vessels from fundus image to allow better diagnostic models using classifiers trained on top of this cleaned up version of fundus as well as classifiers trained to analyse the vessel maps to identify clinical features associated with vessel shapes, like vessel tortuosity.

## Training Data
Training Data is obtained from [DRIVE](https://www.isi.uu.nl/Research/Databases/DRIVE/) and [STARE](http://cecas.clemson.edu/~ahoover/stare/) datasets. For STARE dataset the target vessel map annotated by Valentina Kouznetsova is used since it was more detailed.

## Data preprocessing and Dataset generation
The notebook [generate_patches](generate_patches.ipynb) is used for generating of a vast dataset of `256 X 256` patches from the images available in DRIVE and STARE datasets. The patches are generated at random. For robust training patches involving flipping of image and addition of noise are also generated.
In order to use the notebook without any changes ensure following tree structure for storing DRIVE and STARE datasets:
```
VesselExtract/
├── DRIVE
│   ├── test
│   └── training
├── STARE
│   ├── labels-vk
│   └── stare-images
├── generate_patches.ipynb
├── README.md
├── research_model.ipynb
├── run_tests.ipynb
```

## Model
The training of model for vessel segmentation is done in the notebook [research_model](research_model.ipynb). Results of vessel segmentation in presence of various clinical features is also documented.

## Tests and Vessel Removal
Various tests to evaluate the quality of vessel maps generated against the vessel maps available in the database can be found in [run_tests](run_tests.ipynb). Also an attempt to cleanup the fundus image by removing the vessel map has been done by using mean colour of local neighbourhood (`32X32, 16X16, 8X8 and 4X4 surrounding patches`) to fill up the pixels corresponding to vessels.

## Some interesting samples 
### DRIVE Test image
<img src="https://github.com/djin31/VesselExtract/blob/master/readme_images/drive.png?raw=True">

### Diabetic Retinopathy
<img src="https://github.com/djin31/VesselExtract/blob/master/readme_images/dr.png?raw=True">

### Haemorrhage
<img src="https://github.com/djin31/VesselExtract/blob/master/readme_images/haem.png?raw=True">

## MATLAB code
A MATLAB code for vessel extraction is also available in [vessel_extraction.m](vessel_extraction.m). This was taken from [here](https://in.mathworks.com/matlabcentral/fileexchange/24990-retinal-blood-vessel-extraction). However this is terribly slow and is not very accurate. Placed here as baseline.

## Citation
If you use this code for research, please cite:
```
@misc{vesselextract18,
  author = {Jindal, Deepanshu},
  title = {Vessel Extract},
  year = {2018},
  publisher = {GitHub},
  journal = {GitHub repository},
  howpublished = {\url{https://github.com/djin31/VesselExtract}}
}
```
