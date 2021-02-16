# JuliaLangAdventures

# Installing Julia on Linux

You can get Julia installed in 3 very simple steps. Note that we don't use a package manager, like ```apt```, because those tend to include older versions, and we want to benefit from the latest stable release:

* Download the current stable release from [Julia's official website](https://julialang.org/downloads/#current_stable_release). At the time of writing the link points to 
```
https://julialang-s3.julialang.org/bin/linux/x64/1.5/julia-1.5.3-linux-x86_64.tar.gz
```
* Expand the tar file with the following command 
```
tar -xvzf julia-1.5.3-linux-x86_64.tar.gz
```
* Move the installation directory to ```/opt/```, with the following command 
```
sudo mv julia-1.5.3/ /opt/
```
* Create a link to the julia executable in ```/usr/local/bin```, which is supposed to be in your ```$PATH```, with the following command 
```
sudo ln -s /opt/julia-1.5.3/bin/julia /usr/local/bin/julia
```
