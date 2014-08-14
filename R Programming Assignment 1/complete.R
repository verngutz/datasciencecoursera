complete <- function(directory, id = 1:332) {
  files <- list.files(directory, full.names = TRUE)
  dat <- data.frame()
  for(i in id) {
    dat <- rbind(dat, c(i, sum(complete.cases(read.csv(files[i])))))
  }
  names(dat) <- c("id", "nobs")
  dat
}