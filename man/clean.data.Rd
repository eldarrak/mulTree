% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clean.data.R
\name{clean.data}
\alias{clean.data}
\title{Cleaning phylogenetic data}
\usage{
clean.data(taxa, data, tree)
}
\arguments{
\item{taxa}{A \code{vector} of taxa to keep or a \code{numerical} or \code{character} value refering to the column in \code{data} containing the taxa list.}

\item{data}{A \code{data.frame} or \code{matrix}.}

\item{tree}{A \code{phylo} or \code{multiPhylo} object.}
}
\value{
A \code{list} containing the cleaned data and tree(s) and information on the eventual dropped tips and rows.
}
\description{
Cleans a table/tree to match with a given table/tree
}
\examples{
##Create a set of different trees
trees_list <- list(rtree(5, tip.label = LETTERS[1:5]),
     rtree(4, tip.label = LETTERS[1:4]), rtree(6, tip.label = LETTERS[1:6]))
class(trees_list) <- "multiPhylo"
##Creates a data frame
dummy_data <- data.frame(taxa_list = LETTERS[1:5], var1 = rnorm(5),
     var2 = c(rep('a',2), rep('b',3)))

##Cleaning the trees and the data
cleaned <- clean.data(taxa = "taxa_list", data = dummy_data,
     tree = trees_list)
##The taxa that where dropped (tips and rows):
c(cleaned$dropped_tips, cleaned$dropped_rows)
##The cleaned trees:
cleaned$tree
##The cleaned data set:
cleaned$data

}
\author{
Thomas Guillerme & Kevin Healy
}

