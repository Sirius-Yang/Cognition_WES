#Step 1
#For example, pheno is "EduYears_Caucasian.csv"
for i in {1..22};do
docker run -v /home/dnanexus/:/home/dnanexus/ -w /home/dnanexus/ wzhou88/saige:1.1.6 step1_fitNULLGLMM.R \
    --sparseGRMFile=/home/dnanexus/GRM/UKB_GRM_relatednessCutoff_0.05_5000_randomMarkersUsed_unrelated_2nd_relatednessCutoff_0.05_5000_randomMarkersUsed.sparseGRM.mtx \
    --sparseGRMSampleIDFile=/home/dnanexus/GRM/UKB_GRM_relatednessCutoff_0.05_5000_randomMarkersUsed_unrelated_2nd_relatednessCutoff_0.05_5000_randomMarkersUsed.sparseGRM.mtx.sampleIDs.txt \
	--plinkFile=/home/dnanexus/sample_qc_final/ukb_wes_chr${i}_sample_qc_final_unrelated \
    --useSparseGRMtoFitNULL=FALSE   \
	--useSparseGRMforVarRatio=TRUE \
    --phenoFile=/home/dnanexus/Collapse/Cognition/EduYears_Caucasian.csv \
	--covarColList=Sex,Age,PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10 \
	--qCovarColList=Sex  \
    --phenoCol=IF \
    --sampleIDColinphenoFile=eid \
	--isCovariateOffset=FALSE \
    --traitType=quantitative       \
	--nThreads=500   \
    --isCateVarianceRatio=TRUE	\
    --outputPrefix=/home/dnanexus/Collapse/Cognition/s1_EduYears_chr${i}_10PC_both	\
    --IsOverwriteVarianceRatioFile=TRUE	&
