corr <- function(directory, threshold = 0) {
  files <- list.files(directory, full.names = TRUE)
  corrs <- c()
  for(file in files) {
    dat <- read.csv(file)
    cleandat <- dat[complete.cases(dat), ]
    if(nrow(cleandat) > threshold) {
      corrs <- c(corrs, cor(x = cleandat$nitrate, y = cleandat$sulfate))
    }
  }
  corrs
}