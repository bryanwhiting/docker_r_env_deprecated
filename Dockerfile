# Lineage:
# rocker scripts: https://github.com/rocker-org/rocker-versioned2/tree/master/scripts
### rocker/r-ver:4.1.0-cuda11.1     https://github.com/rocker-org/rocker-versioned2/blob/master/dockerfiles/Dockerfile_r-ver_4.1.0-cuda11.1
# FROM nvidia/cuda:11.1.1-cudnn8-devel-ubuntu20.04
# RUN /rocker_scripts/install_R.sh
# RUN /rocker_scripts/config_R_cuda.sh
# RUN /rocker_scripts/install_python.sh
### rocker/ml:4.1.0-cuda10.1   https://github.com/rocker-org/rocker-versioned2/blob/master/dockerfiles/Dockerfile_ml_4.1.0-cuda11.1
# FROM rocker/r-ver:4.1.0-cuda11.1
# RUN /rocker_scripts/install_rstudio.sh
# RUN /rocker_scripts/install_pandoc.sh
# RUN /rocker_scripts/install_tidyverse.sh | https://github.com/rocker-org/rocker-versioned2/blob/master/scripts/install_tidyverse.sh
### rocker/ml:latest
# FROM rocker/ml:4.1.0-cuda10.1

FROM rocker/ml:latest

# install from cran: https://stackoverflow.com/a/60767841
RUN apt-get update && apt-get install -y \
   r-cran-tidyverse \
   r-cran-rstan \
   r-cran-rstanarm \
   r-cran-glmnet 

# utils
RUN R -e "install.packages('renv', dependencies=TRUE, repos='http://cran.rstudio.com/')" 

# data processing
# RUN R -e "install.packages('tidyverse', dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('multidplyr', dependencies=TRUE, repos='http://cran.rstudio.com/')"

# blogging
RUN R -e "install.packages('gt', dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('distill', dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('postcards', dependencies=TRUE, repos='http://cran.rstudio.com/')" 

# tidymodels
RUN R -e "install.packages('tidymodels',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('finetune', dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('stacks', dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('vip', dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('themis', dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('infer', dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('corrr', dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('textrecipes', dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('poissonreg', dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN installGithub.r curso-r/treesnip

# bayesian
# RUN R -e "install.packages('rstan', dependencies=TRUE, repos='http://cran.rstudio.com/')" 
# RUN R -e "install.packages('rstanarm', dependencies=TRUE, repos='http://cran.rstudio.com/')" 

# modeling
# https://www.tidymodels.org/find/parsnip/
# RUN R -e "install.packages('glmnet', dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('xgboost', dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('lightgbm', dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('C50', dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('earth', dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('nnet', dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('kknn', dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('randomForest', dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('ranger', dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('rpart', dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('survival', dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('flexsurv', dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('kernlab', dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('xrf', dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('Cubist', dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN R -e "install.packages('forecast', dependencies=TRUE, repos='http://cran.rstudio.com/')" 
RUN installGithub.r curso-r/treesnip
RUN installGithub.r davpinto/fastknn
RUN installGithub.r mukul13/rword2vec
RUN R -e "devtools::install_url('https://github.com/catboost/catboost/releases/download/v0.26.1/catboost-R-Linux-0.26.1.tgz', INSTALL_opts = c(\"--no-multiarch\"))"
# RUN R -e "install.packages('keras', dependencies=TRUE, repos='http://cran.rstudio.com/')" 
# RUN R -e "keras::install_keras()" 

ADD rstudio-prefs.json /home/rstudio/.config/rstudio/rstudio-prefs.json

# zsh: https://github.com/deluan/zsh-in-docker
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.1/zsh-in-docker.sh)" -- \
    -t https://github.com/denysdovhan/spaceship-prompt \
    -a 'SPACESHIP_PROMPT_ADD_NEWLINE="false"' \
    -a 'SPACESHIP_PROMPT_SEPARATE_LINE="false"' \
    -p git \
    -p ssh-agent \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions



