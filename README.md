# Gray-White-Matter-Boundary
The matlab scripts are for calcualting two new metrics of functional activity that complement traditional structural assessments, and which quantify the similarities and differences in BOLD signals between GM and WM points (voxels) that are near, and aligned perpendicular, to the GM-WM boundary. These features are characterized in two ways. First, we introduce gray-white matter functional connectivity (GWFC) by calculating the Pearson correlation between the BOLD signals of those two points, which reflects the fidelity of signal transmission across the boundary. High values of GWFC indicate the BOLD signal in WM closely follows the time course of neighboring GM.  Second, we propose the gray-white BOLD power ratio (GWBPR), represented as the ratio of the fractional amplitude of low-frequency fluctuations (fALFF) between these two points, to capture how much of the power of the GM BOLD signal is retained as it transverses the boundary. 

SPM, DPABI and GIFTI toolboxes are required for running the matlab script.
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

In this folder, two Matlab scripts are included,and the current version only compatible with data downloaded from Human conectome (HCP) database. The Gen_GWFC.m is used for calculating the GWFC. Some iage data need to be prepared from HCPand the gen_GWBPR is used for calculating the GWBPR.


