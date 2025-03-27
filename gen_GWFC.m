clear;
clc;

%% SPM12, GIFTI and DPABI are required before running this code.

%% load rsfMRI data and maskout the subcortical structures.
img=spm_vol('\HCP_1200\100206\fmri.nii.gz'); % read your prerpcessed rsfMRI data. 
data=spm_read_vols(img);
img3=spm_vol('\HCP_1200\100206\MNINonLinear\ROIs\wmparc.2.nii.gz'); % read wmparc segmentation provided by HCP. We use this segementation to identify subcortical structures and exclude them from calculation.
tmp=spm_read_vols(img3);
subcor_mask=logical(tmp>0).*logical(tmp<72);
data=reshape(data,[],size(data,4));
data(subcor_mask>0,:)=0;
data=y_IdealFilter(data',0.72,[0.01 0.1])'; % band filter the data.
data=single(reshape(data,size(subcor_mask,1),size(subcor_mask,2),size(subcor_mask,3),size(data,2)));

%% calculation of GWFC for left hemisphere
surfW=gifti('\HCP_1200\100206\MNINonLinear\100206.L.white.164k_fs_LR.surf.gii'); % read white matter left surface file provided by HCP
surfG=gifti('\HCP_1200\100206\MNINonLinear\100206.L.midthickness.164k_fs_LR.surf.gii'); % read mid-thickness left surface file provided by HCP
V=surfG.vertices-surfW.vertices;
V=normalize(V,2,'norm'); % find the normal direction to the surface
tmp=gifti('\HCP_1200\100206\MNINonLinear\100206.L.thickness.164k_fs_LR.shape.gii'); % read left cortical thickness  measurment provided by HCP for excluding zero thickness vertices provided by HCP
tmplate_L=tmp;
thk=tmp.cdata;
g=fun_mni2cor2(surfG.vertices,img(1).mat);
g1=g(:,1); g2=g(:,2); g3=g(:,3);
w=fun_mni2cor2(surfW.vertices-V,img(1).mat);
w1=w(:,1); w2=w(:,2); w3=w(:,3);
sig_g=zeros(size(V,1),size(data,4));
sig_w=zeros(size(V,1),size(data,4));
for j=1:size(data,4)
    sig_g(:,j)=interp3(linspace(1,size(data,2),size(data,2)),linspace(1,size(data,1),size(data,1)),linspace(1,size(data,3),size(data,3)),squeeze(data(:,:,:,j)),g2,g1,g3); % extract BOLD signals on the GM vertices.
    sig_w(:,j)=interp3(linspace(1,size(data,2),size(data,2)),linspace(1,size(data,1),size(data,1)),linspace(1,size(data,3),size(data,3)),squeeze(data(:,:,:,j)),w2,w1,w3); % extract BOLD signals on the WM vertices.
end
cor=zeros(size(V,1),1);
parfor j=1:length(cor)
    cor(j)=corr(sig_g(j,:)',sig_w(j,:)');
end
cor(isnan(cor))=0;
cor(thk==0)=0;
tmplate=tmplate_L;
tmplate.cdata=cor;
y_Write(cor,tmplate,'gwfc.lh.gii');

%% calculation of GWFC for right hemisphere
surfW=gifti('\HCP_1200\100206\MNINonLinear\100206.R.white.164k_fs_LR.surf.gii'); % read white matter right surface file provided by HCP
surfG=gifti('\HCP_1200\100206\MNINonLinear\100206.R.midthickness.164k_fs_LR.surf.gii'); % read mid-thickness right surface file provided by HCP
V=surfG.vertices-surfW.vertices;
V=normalize(V,2,'norm');
tmp=gifti('\HCP_1200\100206\MNINonLinear\100206.R.thickness.164k_fs_LR.shape.gii'); % read right cortical thickness measurment provided by HCP for excluding zero thickness vertices
tmplate_R=tmp;
thk=tmp.cdata;
g=fun_mni2cor2(surfG.vertices,img(1).mat);
g1=g(:,1); g2=g(:,2); g3=g(:,3);
w=fun_mni2cor2(surfW.vertices-V,img(1).mat);
w1=w(:,1); w2=w(:,2); w3=w(:,3);
sig_g=zeros(size(V,1),size(data,4));
sig_w=zeros(size(V,1),size(data,4));
for j=1:size(data,4)
    sig_g(:,j)=interp3(linspace(1,size(data,2),size(data,2)),linspace(1,size(data,1),size(data,1)),linspace(1,size(data,3),size(data,3)),squeeze(data(:,:,:,j)),g2,g1,g3);% extract BOLD signals on the GM vertices.
    sig_w(:,j)=interp3(linspace(1,size(data,2),size(data,2)),linspace(1,size(data,1),size(data,1)),linspace(1,size(data,3),size(data,3)),squeeze(data(:,:,:,j)),w2,w1,w3);% extract BOLD signals on the WM vertices.
end
cor=zeros(size(V,1),1);
parfor j=1:length(cor)
    cor(j)=corr(sig_g(j,:)',sig_w(j,:)');
end
cor(isnan(cor))=0;
cor(thk==0)=0;
tmplate=tmplate_R;
tmplate.cdata=cor;
y_Write(cor,tmplate,'\gwfc.rh.gii');
