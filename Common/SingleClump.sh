#Second Step of Common Analysis
#p valus <5e-8 from step1 was created as file_Significant.csv
for lines in $(cat PhenoList);do
plink --bfile /share/home1/Vinceyang/dyt_data/GWAS/data/1000G_Phase_3/EUR/EUR.1kg.phase3.v5a \
--clump ${lines}_Significant.csv \
--clump-p1 5e-8 \
--clump-p2 1e-6 \
--clump-r2 0.1 \
--clump-kb 500 \
--clump-field P \
--indep-pairwise 500 50 0.2 \
--clump-snp-field ID \
--out ${lines}_clumped
wait
done
