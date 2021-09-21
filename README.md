# https://github.com/rocker-org/ml
# https://github.com/rocker-org/rocker-versioned2
# Site: https://bryanwhiting.github.io/blogv2/
# Github: https://github.com/bryanwhiting/blogv2

Run Docker
```
docker run \
  -v /Users/bryanwhiting/github/blogv2:/home/rstudio/blogv2 \
  -e PASSWORD=mu \
  -p 8787:8787 \
  --name distill_blog2 \
  bryanwhiting/r_env

docker run \
  -v /Users/bryanwhiting/github/blogv2:/home/rstudio/blogv2 \
  -v /Users/bryanwhiting/gitlab/ldstxt:/home/rstudio/ldstxt \
  -p 80:8787 \
  -e DISABLE_AUTH=true \
  -e PASSWORD=mu \
  --name ldstxt \
  bryanwhiting/r_env:latest
```

Build docker image:
```
docker build -t bryanwhiting/r_env:latest .
```

Enable git
```
source .gitconfig
```

Build the site:
```
setwd('/home/rstudio/blogv2/blog')
rmarkdown::render_site(encoding = 'UTF-8')
```
  
  
