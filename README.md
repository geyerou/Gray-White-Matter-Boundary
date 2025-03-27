# Gray-White-Matter-Boundary
The matlab scripts are for calcualting two new metrics of functional activity that complement traditional structural assessments, and which quantify the similarities and differences in BOLD signals between GM and WM points (voxels) that are near, and aligned perpendicular, to the GM-WM boundary. These features are characterized in two ways. First, we introduce gray-white matter functional connectivity (GWFC) by calculating the Pearson correlation between the BOLD signals of those two points, which reflects the fidelity of signal transmission across the boundary. High values of GWFC indicate the BOLD signal in WM closely follows the time course of neighboring GM.  Second, we propose the gray-white BOLD power ratio (GWBPR), represented as the ratio of the fractional amplitude of low-frequency fluctuations (fALFF) between these two points, to capture how much of the power of the GM BOLD signal is retained as it transverses the boundary. 

SPM, DPABI and GIFTI toolboxes are required for running the matlab script. Particularly, DPABI toolbox can be used for calculating the fALFF map, which is the input for GWBPR.
1. Installing SPM (Statistical Parametric Mapping)
Download SPM: Go to the SPM website (https://www.fil.ion.ucl.ac.uk/spm/) and download the latest version of SPM. Choose the version that is compatible with your MATLAB version.
Extract Files: Extract the downloaded files to a directory on your computer that you can easily access.
Add SPM to MATLAB Path: Open MATLAB and add the SPM directory to your MATLAB path.
2. Installing DPABI (Data Processing & Analysis for Brain Imaging)
Download DPABI: Visit the DPABI website (http://rfmri.org/DPABI) and download the latest version of DPABI.
Extract Files: Extract the downloaded DPABI package to a desired directory.
Add DPABI to MATLAB Path: Similar to adding SPM, add the DPABI directory to your MATLAB path.
3. Installing GIFT (Group ICA of fMRI Toolbox)
Download GIFT: Go to the GIFT website (http://mialab.mrn.org/software/gift/) and download the latest version of GIFT.
Extract Files: Extract the GIFT package into a folder where you keep your MATLAB toolboxes.
Add GIFT to MATLAB Path: Add the GIFT directory to your MATLAB path.

This folder contains two MATLAB scripts, which are currently only compatible with preprocessed data downloaded from the Human Connectome Project (HCP) database.

The script Gen_GWFC.m is used to calculate the GWFC. To run this script, several image datasets need to be prepared from HCP, including:
1. resting-state fMRI data in NIfTI format
2. the structural segmentation map (wmparc) in NIfTI format
3. the white matter surface image in GIfTI format
4. the midthickness surface image in GIfTI format
5. the cortical thickness map in GIfTI format
All of these datasets are available for each subject in the HCP database.

The script Gen_GWBPR.m is used to compute the GWBPR. To use this script, you will need the following input data:
1. the fALFF map in NIfTI format (which can be computed using software such as DPABI) 
2. the structural segmentation map (wmparc) in NIfTI format
3. the white matter surface image in GIfTI format
4. the midthickness surface image in GIfTI format
5. the cortical thickness map in GIfTI format
6. As with the GWFC analysis, all required datasets are available for each subject in the HCP database.
