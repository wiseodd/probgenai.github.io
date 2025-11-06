# Tips for getting set up on Killarey
# Scott Lowe, Vector Postdoc, July 2025
#
#
## Helpful links
# 
# - https://vectorinstitute.slack.com/files/UC7JF54AW/F090E6W4YF6/user_guide_to_killarney_for_vector_researchers.pdf?origin_team=TAC4QK3L3&origin_channel=D07M35YG60Y
# - https://alliancecan.ca/en/services/advanced-research-computing/account-management/apply-account
# - https://docs.alliancecan.ca/wiki/Getting_started
# - https://docs.alliancecan.ca/wiki/Killarney
# - https://docs.alliancecan.ca/wiki/Python
# - https://docs.alliancecan.ca/wiki/AI_and_Machine_Learning


## Setup cluster access
# 1.  If you do not already have a CCDB account, register here https://ccdb.computecanada.ca/security/login
# 2.  Once you are registered, log in and apply for a new role (https://ccdb.computecanada.ca/me/add_role) with your sponsor set to the CCDB user ID for your advisor. You will need to ask your advisor what their CCDB user ID is.
# 3.  Ask your supervisor to approve your request to add them as a sponsor, AND to add you to their AIP project.
# 4.  Setup DUO for CCDB: https://docs.alliancecan.ca/wiki/Multifactor_authentication#Use_a_smartphone_or_tablet
# 5.  Setup an SSH key pair for CCDB: https://docs.alliancecan.ca/wiki/SSH_Keys#Installing_your_key
# 6.  Go to https://ccdb.alliancecan.ca/me/access_services and opt-in to Killarney.
# 7.  Wait until your supervisor adds you to their AIP project.
# 8.  Confirm you have a Killarney allocation and are part of a Killarney AIP here: https://ccdb.alliancecan.ca/me/allocations
# 9.  SSH in to the cluster with `ssh username@killarney.alliancecan.ca`. Check you have a home directory, and within that have a projects directory in your home directory and what is contains, e.g. `ls -l ~/projects/` for me shows `aip-gwtaylor -> /project/6101768/`. If you don't have a directory here that is "aip-supervisorname", look at https://ccdb.alliancecan.ca/me/allocations from step 8 again.
# 9a. If you *don't* see a Killarney allocation with aip-supervisorname in it on https://ccdb.alliancecan.ca/me/allocations, then it appears your supervisor didn't actually add you to their AIP, so ask them to double-check they have actually added you to their AIP project and not an RAP or RRG, e.g. def-supervisorname. A Compute Canada RAP is not sufficient to use Killarney, it needs to be an AIP.
# 9b. If you *do* have a Killarney allocation on the CCDB allocations page, wait an hour for the settings changes to propagate through the system and then your ~/projects/ directory should create itself. If the directory doesn't create itself after an hour and you don't have a directory with your username in /project/aip-supervisorname/ then contact Vector support for help at <ops-help@vectorinstitute.ai>.


## Setup project
#
# ssh username@killarney.alliancecan.ca

# Let's make a directory for your project that is in your user space within
# your supervisor's AIP directory
PROJNAME=myproject
cd $(ls -d ~/projects/*/ | head -n 1)
mkdir -p "$USER/$PROJNAME"
cd "$USER/$PROJNAME"

#~ Setup environment
# On Vaughan we were supposed to use module load and pip install into a
# virtualenv environment. But you could get away with using a conda environment
# instead. On Compute Canada (DRAC) e.g. Killarney, you can't get away with
# this, so we need to do a pip install into a virtualenv environment.

# Load the version of python and cuda that you want to use
module load python/3.12 cuda/12.2
# Create the virtual environment
virtualenv --no-download "venv" --prompt "$PROJNAME"
# Activate it
source "venv/bin/activate"

#~~ Installing packages from an existing venv

# If you are cloning a repo or otherwise know what packages you need to install
# then we can install them in one pip command. I will assume you have your
# packages in a requirement.txt file, as is common for pip environment
# installations. You can get this from an environment on Vaughan with the
# command
#    pip freeze > requirements.txt
# (if you installed them with pip; if you installed them with conda you'll have
# to go through the output of
#    conda env export > environment.yml
# and convert this into a flat requirements.txt file.)

# There are prebuilt pypi wheels for some packages on Killarney already in a
# local wheelhouse. These are optimized for the hardware we have on Killarney,
# so they should work better then generic wheels from pypi.org. But only a
# subset of possible package versions are available. You can see what versions
# are available with the command `avail_wheels`, e.g. `avail_wheels torch`.

# You can run this long one-liner to check the available versions of every
# package in requirements.txt
while IFS= read -r line; do [[ -n "$line" && "$line" != \#* ]] && { package=$(echo "$line" | sed 's/[<>=!~].*//'); echo "~~ $package ($line) ~~"; avail_wheels "$package" 2>/dev/null || echo "Not available in wheelhouse"; echo; }; done < requirements.txt

# If it is not vital to replicate the environment exactly, I recommend
# adjusting exact version requirements (e.g. numpy==2.2.1) to something which
# is available in the wheelhouse (change to numpy==2.2.2 or numpy~=2.2.1 to
# allow installation of the 2.2.2 version in the wheelhouse). In particular,
# you may get speed-up for packages which handle data/compute
# (e.g. torch, numpy, scipy, Pillow, pandas) whereas adjusting other packages
# (e.g. timm, omegaconf, urllib3) isn't as important.

# !! Cautionary note about wandb !!
# You need to install this exact version wandb==0.18.0, and not the version
# in the local wheelhouse (0.19.6) because there is a bug on Alliance Canada:
#    https://github.com/wandb/wandb/issues/8966

# With adjustments in place, run this command to install all the packages in
# your requirements.txt file. This command should prioritize the local
# wheelhouse (--prefer-binary) where available but install from the online
# source of wheels, https://pypi.org, otherwise.
pip install -r requirements.txt --find-links https://pypi.org/simple/ --prefer-binary

# If you want to install a previous version of torch (not using the wheelhouse)
# you will need to install that with --index-url, e.g.
#    https://pytorch.org/get-started/previous-versions/
#    pip install torch==2.7.0 --index-url https://download.pytorch.org/whl/cu126
# But this --index-url will block pip from installing packages from pypi.org
# To get around this, just run the torch install command separately from the
# rest of the requirements.txt install

## Running jobs

# Run jobs with something like this:
AIP_ACCOUNT="$(ls -d ~/projects/*/ | head -n 1 | sed 's|/*$||' | sed 's|.*/||')"
sbatch \
    --account "$AIP_ACCOUNT" \
    --nodes 1 \
    --gres gpu:l40s:1 \
    --tasks-per-node 1 \
    --mem 20G \
    --cpus-per-task 4 \
    --time 4:00:00
    train.slrm

# This will run a single-GPU job on a node with an L40S GPU.

# Run interactive jobs with something like this:
srun --account="$AIP_ACCOUNT" --gres=gpu:l40s:1 --mem=12G -c 4 --time=1:00:00 --pty bash

# Note: in some parts of the Compute Canada documentation, it says to use
# the command `salloc` to run interactive jobs. This doesn't work on Killarney
# because salloc doesn't have the module load command. Use `srun ... --pty bash`.

# You can't run your jobs from your home directory, and the contents of the
# scratch directory get automatically purged when they are stale, so I
# recommend you run your jobs from a subdirectory of ~/projects/
# If you are creating temporary checkpoints that you don't need to keep
# long-term, you can write these to /scratch/$USER/projectname/


## Things to remember when running jobs
#
# 1. You have to pass the --account argument, set to your supervisor's AIP project name.
# 2. You have to pass the --time argument, set to the maximum runtime for the job. The upperbound for the time argument is 7 days (--time=7-00:00:00), but try to set the time value to be the longest you think your job could realistically take without having crashed because (a) that way you don't accidentally waste compute resources by occupying a GPU when your job is broken, (b) it is easier for SLURM to allocate jobs to resources if it has a realistic estimate of how long your job will take, (c) your job may get launched sooner if it is shorter because it can slot in next to other jobs currently using part of a node.
# 3. Try to request the smallest amount of CPUs and memory you might maximally need for your job, so it can slot in with other jobs more easily. Also your future jobs will have their priority reduced by the amount of resources you use, and that is measured based on `job_duration * max(fraction_of_GPUs_on_node_used, fraction_of_CPUs_on_node_used, fraction_of_memory_on_node_used)`. Try not use more than the following:
#      l40s : 128GB RAM per GPU, 16 CPU cores per GPU
#      h100 : 256GB RAM per GPU, 6 CPU cores per GPU
#    The hard limits are:
#      l40s : 4 GPUs, 496GB RAM, 128 CPUs
#      h100 : 8 GPUs 2000GB RAM, 48 CPUs
#    Note that the amount of memory and CPU varies by node: most l40s nodes have 64 CPUs but some have 128 CPUs, hence the recommendation is to use no more than 16 CPUs per GPU.
# 4. If you want to run a CPU-only job, run it on the l40s partition, requesting 0 GPUs. Only request as much memory and CPUs as you need - if you can leave some of these free then others will be able to use the GPUs at the same time, instead of leaving them idle.
