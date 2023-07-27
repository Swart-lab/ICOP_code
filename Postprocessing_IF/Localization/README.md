# ICOPs-HA and ISWI1-GFP localization

### input files
Maximum intensity projections (MIP) were created from z-stacks in LAXS software of SP8 Leica confocal fluorescence microscope. Open MIPs in Fiji sorftware (version 2.9.0/1.53t). 

### Pipeline 
open MIP from .lif file.
4C-visualize.ijm > 4C-TIFgenerator.ijm > CropScaleArrow.ijm > SavingStackSlices.ijm

### 4C-visualize.ijm
This script adjusts the brightness and constrast of all open images by the "auto" function for each chanel. Prupose is to make the signal in the 12-bit images visible.

### 4C-TIFgenerator.ijm
Select the image you want to process. Adjust brightness and contrast. This script generates a stack with the individual chanels and the overlay of chanel 1, chanel 2 and chanel 4 as slices. The stack is saved as .tif

### CropScaleArrow.ijm
Select the stack you want to process. This script automates cropping, and insertion of a scale bar and arrowrs. All steps will be saved as checkpoints in .tif format.

### SavingStackSlices.ijm
Select the stack you want to process. This script saves all slices of a stack as individual .tif files.
