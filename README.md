# mlearnpy2
CentOS 7 / RHEL 7 machine learning setup with Python 2.7

GPU support is not included, as this setup is tailored to a headless VM/bare metal server setup.

# Prerequisites
1. CentOS 7.4 x89_64 (previous versions of 7.x _*might*_ work as long as they're x86_64)
1. Decent amount of Linux devops expertise, because this comes with nearly no documentation and a lot of precursory knowledge is assumed...

This repository of utilities does not come with an installer.  It is also assumed you will know how to copy these files, where to put them, and how to use them--simply based on how they are named.  DO NOT blindly copy these over existing files.  If you don't know what you're doing, get help from a friend who does.

# Setup
1. clone this repo somewhere on your target Linux host (`/var/tmp`?)
1. add this to end of your .bashrc file
```bash
# Python VirtualEnvWrapper
if [[ "`which virtualenvwrapper.sh`" != '' ]]
then
   export WORKON_HOME=~/mypy
   source "`which virtualenvwrapper.sh`"
   workon mypy
fi
```
1. execute the `./reassemble.sh` bash script from within the top level of the repo source tree
1. copy the home-tommy-mypy/ directory to your homedir and rename it to "mypy"
1. configure virtualenvwrapper to use the mypy python installation (step 2)
1. make a symlink called /home/tommy and point it at your homedir (sorry, but that's how the custom python was compiled in this case)
1. copy files from usr--bin.tar.xz to your /usr/bin directory (when in doubt, don't overwrite pre-existing files!)
1. copy files from usr--lib--python2.7--site-packages.tar.xz to /usr/lib/python2.7/site-packages (when in doubt, don't overwrite!)
1. carefully install the rpm packages, taking great care not to break your system.
1. leave the other \*.sh files alone.  They're to assist me in rolling up a new release — not for you ;-)

## Freezing (saving) your models...
...Requires the h5 RPMs and their dependencies to be installed.  That list of rpm packages is found in the rpms subdirectory at the top of this repository's file tree.  `yum install` these packages, and see https://keras.io/getting-started/faq/#how-can-i-save-a-keras-model for further details on saving your models.

## Packages included, listed in no particular order
- cython
- gensim
- h5py, h5py-wrapper, h5json, h5config, h5browse, h5df
- keras
- jupyter notebook (terminal disabled)
- lasagne
- matplotlib
- networkx
- nolearn
- numpy
- pandas
- pandas2sklearn
- pandas-transformers
- plotly
- prophet (fbprophet)
- pylds
- pymc
- pystan
- pytorch
- pytz
- scikit-learn (sklearn)
- scipy
- seaborn
- six
- skflow
- sklearn-compiledtrees
- sklearn-contrib-lightning
- sklearn-deap
- sklearn-evaluation
- sklearn-pandas
- spark-sklearn
- spyder IDE (use X-forwarding over ssh)
- statsmodels
- tensorflow
- theano
- virtualenvwrapper
- pyodbc (requires unixODBC package (.rpm) to be installed)
- nltk
- leven
- python-levenshtein
...and all their dependencies

## pip freeze output
```
(see contents of pip-freeze text file at the root of the code tree)
```
