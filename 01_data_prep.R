library(data.table)

DT <- fread("train_categorical.csv",nrow=1000, stringsAsFactors = F)

DT_binary<-apply(DT,2, function(x){ifelse(is.na(x) | x == '', 1, 0)})

image(DT_binary, axes = FALSE, col = grey(seq(0, 1, length = 256)))

col_na <-apply(DT_binary, 2, function(x){ifelse(sum(x == 0), TRUE, FALSE)})

DT_gesta <- DT_binary[, col_na]
image(as.matrix(DT_gesta), axes = FALSE, col = grey(seq(0, 1, length = 256)))
