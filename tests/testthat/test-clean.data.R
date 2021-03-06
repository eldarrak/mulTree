# TEST clean.data
context("clean.data")

# Testing clean.tree.table
require(caper)
tree <- rtree(6, tip.label = LETTERS[1:6])
data <- data.frame(taxa_list = LETTERS[2:5], var1 = rnorm(4), var2 = c(rep('a',1), rep('b',3)))
taxa <- c("B", "C", "D")
test <- clean.tree.table(tree, data, taxa, 1)
test_that("clean.tree.table works", {
    # Errors
    expect_error(
    	clean.tree.table(TRUE)
    	)
    # Output is a list...
    expect_is(
    	test, "list"
    	)
    # ... of 4 elements.
    expect_equal(
    	length(test), 4
    	)
    # First element is a tree...
    expect_is(
    	test[[1]], "phylo"
    	)
    # ...with three taxa.
    expect_equal(
    	Ntip(test[[1]]), 3
    	)
    # Second element is a table...
    expect_is(
    	test[[2]], "data.frame"
    	)
    # ...with three rows.
    expect_equal(
    	nrow(test[[2]]), 4
    	)
    # Third element contains "F" and "A"
    expect_equal(
    	sort(test[[3]]), c("A", "E", "F")
    	)
    # Forth element contains NA
    expect_equal(
    	test[[4]], NA
    	)
})

#Testing clean.data
trees_list <- list(rtree(5, tip.label = LETTERS[1:5]), rtree(4, tip.label = LETTERS[1:4]), rtree(6, tip.label = LETTERS[1:6])) ; class(trees_list) <- "multiPhylo"
dummy_data <- data.frame(taxa_list = LETTERS[1:5], var1 = rnorm(5), var2 = c(rep('a',2), rep('b',3)))
cleaned <- clean.data(taxa = "taxa_list", data = dummy_data, tree = trees_list)
test_that("clean.data works", {
    # Output is a list...
    expect_is(
    	cleaned, "list"
    	)
    # ... of 4 elements.
    expect_equal(
    	length(cleaned), 4
    	)
    # First element are trees...
    expect_is(
    	cleaned[[1]], "multiPhylo"
    	)
    # ...with 4 taxa each.
    expect_equal(
    	unique(unlist(lapply(cleaned[[1]], Ntip))), 4
    	)
    # Second element is a table...
    expect_is(
    	cleaned[[2]], "data.frame"
    	)
    # ...with five rows.
    expect_equal(
    	nrow(cleaned[[2]]), 5
    	)
    # Third element contains "F"
    expect_equal(
    	cleaned[[3]], "F"
    	)
    # Forth element contains "E"
    expect_equal(
    	cleaned[[4]], "E"
    	)
})

