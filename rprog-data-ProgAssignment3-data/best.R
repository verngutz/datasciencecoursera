best <- function(state, outcome) {
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  statedata <- data[data$State == state,]
  if(nrow(statedata) == 0) {
    stop("invalid state")
  }
  toColumn <- new.env()
  toColumn[["heart attack"]] <- 11
  toColumn[["heart failure"]] <- 17
  toColumn[["pneumonia"]] <- 23
  column <- toColumn[[outcome]]
  if(is.null(column)) {
    stop("invalid outcome")
  }
  ordering <- order(as.numeric(statedata[, column]))
  rowOfBest <- ordering[1]
  statedata[rowOfBest,]$Hospital.Name
}