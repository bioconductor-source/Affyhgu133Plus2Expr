\name{Affyhgu133Plus2Expr}
\alias{Affyhgu133Plus2Expr}
\docType{data}
\title{
Data of human gene expression profiles from the Affymetrix Human Genome U133 Plus 2.0 Array (GPL570).
}
\description{
The data set contains 5153 human profiles on 19944 genes downloaded from NCBI GEO. Gene expression data were preprocessed and normalized consistently using fRMA. Gene expression values are further standardized using gene expression barcode approach. The biological context of each sample was recorded and manually verified based on the sample description in GEO. Expression profiles are stored in separate .rda files (with xz compression).
}
\details{

This data package contains 19944 .rda files with xz compression. Each .rda file contains the gene expression vector of length 5153 for the gene ID represented by its file name, and the vector consists of 5153 samples measurements from NCBI GEO obtained using the GPL570 platform. Gene expression data were preprocessed and normalized consistently using fRMA. Gene expression values were further standardized using gene expression barcode approach. Probesets that corresponds to the same gene are averaged, so that each gene uniquely matches to one row in the database. The biological context of each sample was also recorded and manually verified based on the sample description in GEO. The sample id, sample type, and experiment id for each sample in the gene expression compendium are also included in this data package.

}
\source{
www.ncbi.nlm.nih.gov/geo/
}
\references{
McCall M.N., Bolstad B.M., and Irizarry R.A. (2010) Frozen robust multiarray analysis (fRMA). Biostatistics 11, 242-253.

McCall, M. N., Uppal, K., Jaffee, H. A., Zilliox, M. J., & Irizarry, R. A. (2011). The Gene Expression Barcode: leveraging public data repositories to begin cataloging the human and murine transcriptomes. Nucleic acids research, 39(suppl 1), D1011-D1015.

Barrett T., et al. (2007) NCBI GEO: mining tens of millions of expression profiles - database and tools update. Nuscl. Acids Res. 35, D760-D765.
}
\examples{

## GSCA will automatically read in the necessary gene expression data according to given input.
## Thus, normally users do not need to read in the data themselves.

## To manually read in gene expression data, for example Entrez GeneID 10000:
geneid <- 10000
path <- system.file("extdata",package="Affyhgu133Plus2Expr")
load(paste0(path,"/",geneid,".rda"))
## The expression vector named "e" is read in

## To read in gene expression data of multiple Entrez GeneID:
## This function represents select() interface in most Bioconductor annotation packages
search <- function(geneid) {
exprdat <- matrix(0,nrow=length(geneid),ncol=5153)
path <- system.file("extdata",package="Affyhgu133Plus2Expr")
for (i in 1:length(geneid)) {
	load(paste0(path,"/",geneid[i],".rda"))
	exprdat[i,] <- e
}
return(exprdat)
}
## Run the function on desired genes, for example Entrez GeneID 10000,10001,10002
Exprgeneset <- search(c(10000,10001,10002))
str(Exprgeneset)
## Which returns a matrix of 3 rows and 5153 columns containing the expression profiles of the 3 genes

## To check all Entrez GeneID included in the data package:
path <- system.file("extdata",package="Affyhgu133Plus2Expr")
sub(".rda","",list.files(path))

## To check the reference table which contains
## sample id, sample type, and experiment id for each sample
data(Affyhgu133Plus2Exprtab)
str(Affyhgu133Plus2Exprtab)

## Add sample name to expression data
colnames(Exprgeneset) <- Affyhgu133Plus2Exprtab$SampleName

}
\keyword{datasets,GPL570,database,Affyhgu133Plus2Expr}

