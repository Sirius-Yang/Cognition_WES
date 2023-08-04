#Step 2
#Based on Step1
for i in {1..22};do	
docker run -v /home/dnanexus/:/home/dnanexus/ -w /home/dnanexus/ wzhou88/saige:1.1.6 step2_SPAtests.R \
     --bedFile=/home/dnanexus/sample_qc_final/ukb_wes_chr${i}_sample_qc_final_unrelated.bed \
     --bimFile=/home/dnanexus/sample_qc_final/ukb_wes_chr${i}_sample_qc_final_unrelated.bim \
     --famFile=/home/dnanexus/sample_qc_final/ukb_wes_chr${i}_sample_qc_final_unrelated.fam \
     --SAIGEOutputFile=/home/dnanexus/Collapse/EduYears/EduYears_chr${i}_both_10pca.txt \
     --AlleleOrder=alt-first \
     --minMAF=0 \
     --minMAC=0.5 \
     --GMMATmodelFile=/home/dnanexus/Collapse/EduYears/s1_EduYears_chr${i}_10PC_both.rda \
     --varianceRatioFile=/home/dnanexus/Collapse/EduYears/s1_EduYears_chr${i}_10PC_both.varianceRatio.txt \
	 --sparseGRMFile=/home/dnanexus/GRM/UKB_GRM_relatednessCutoff_0.05_5000_randomMarkersUsed_unrelated_2nd_relatednessCutoff_0.05_5000_randomMarkersUsed.sparseGRM.mtx \
     --sparseGRMSampleIDFile=/home/dnanexus/GRM/UKB_GRM_relatednessCutoff_0.05_5000_randomMarkersUsed_unrelated_2nd_relatednessCutoff_0.05_5000_randomMarkersUsed.sparseGRM.mtx.sampleIDs.txt \
     --groupFile=/home/dnanexus/SNPEff/SnpEff_gene_group_chr${i}.txt \
     --annotation_in_groupTest="lof,missense:lof,missense" \
     --maxMAF_in_groupTest=0.00001,0.0001,0.001,0.01 \
     --is_output_markerList_in_groupTest=TRUE \
     --LOCO=FALSE \
     --is_fastTest=TRUE & 
done
