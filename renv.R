# Copying from Kaggle/docker-rstats: https://github.com/Kaggle/docker-rstats/blob/main/package_installs.R

library(devtools)
options(repos = c("CRAN" = "http://cran.us.r-project.org"))
options(Ncpus = parallel::detectCores())

# Set download method, to avoid the default behavior of using
# R's internal HTTP implementation, which doesn't support HTTPS connections.
# https://stackoverflow.com/questions/45061272/r-and-ssl-curl-on-ubuntu-linux-failed-ssl-connect-in-r-but-works-in-curl
options(download.file.method = "libcurl")

# renv::load()
# renv::activate()

# utils
install.packages('renv', dependencies=TRUE, repos='http://cran.rstudio.com/')

# data
install.packages('tidyverse', dependencies=TRUE, repos='http://cran.rstudio.com/')
install.packages('multidplyr', dependencies=TRUE, repos='http://cran.rstudio.com/')

# blogging                 
install.packages('gt', dependencies=TRUE, repos='http://cran.rstudio.com/')
install.packages('distill', dependencies=TRUE, repos='http://cran.rstudio.com/')
install.packages('postcards', dependencies=TRUE, repos='http://cran.rstudio.com/')

# tidymodels
install.packages('tidymodels', dependencies=TRUE, repos='http://cran.rstudio.com/')
install.packages('finetune', dependencies=TRUE, repos='http://cran.rstudio.com/')
install.packages('stacks', dependencies=TRUE, repos='http://cran.rstudio.com/')
install.packages('vip', dependencies=TRUE, repos='http://cran.rstudio.com/')
install.packages('themis', dependencies=TRUE, repos='http://cran.rstudio.com/')
install.packages('infer', dependencies=TRUE, repos='http://cran.rstudio.com/')
install.packages('corrr', dependencies=TRUE, repos='http://cran.rstudio.com/')
install_github("curso-r/treesnip")

# Bayesian packages
install.packages('rstan', dependencies=TRUE, repos='http://cran.rstudio.com/')
install.packages('rstanarm', dependencies=TRUE, repos='http://cran.rstudio.com/')

# ML packages
install.packages('glmnet', dependencies=TRUE, repos='http://cran.rstudio.com/')
install.packages('xgboost', dependencies=TRUE, repos='http://cran.rstudio.com/')
install.packages('lightgbm', dependencies=TRUE, repos='http://cran.rstudio.com/')
install_github("davpinto/fastknn")
install_github("mukul13/rword2vec")
# Installing catboost: https://github.com/Kaggle/docker-rstats/blob/main/package_installs.R
# Following direct installation instructions instead: https://tech.yandex.com/catboost/doc/dg/installation/r-installation-binary-installation-docpage/
# latest releases: https://github.com/catboost/catboost/releases
install_url('https://github.com/catboost/catboost/releases/download/v0.26.1/catboost-R-Linux-0.26.1.tgz', INSTALL_opts = c("--no-multiarch"))



