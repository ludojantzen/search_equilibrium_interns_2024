#!/bin/bash
#SBATCH --job-name=genfoam

#SBATCH --output=gFHR_Serpent.o

#SBATCH --error=gFHR_Serpent.error

#SBATCH --partition=savio2

#SBATCH --time=03:00:00

#SBATCH --nodes=1

#SBATCH --ntasks-per-node=1

#SBATCH--cpus-per-task=20

# QoS: 

#SBATCH --qos=savio_normal

#
# Account:

#SBATCH -A ac_advreactors

# run command

module purge
module load gcc/12.1.0  openmpi/4.1.4-gcc cmake/3.22.0

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/global/home/groups/co_nuclear/gd_library/code/lib
export LIBRARY_PATH=$LIBRARY_PATH:/global/home/groups/co_nuclear/gd_library/code/lib
export CPATH=$CPATH:/global/home/groups/co_nuclear/gd_library/code/include

export SERPENT_EXE="/global/home/groups/co_nuclear/HxF_tools/serpent2.2.0_HxF_dev/sss2"
export SERPENT_DATA="/global/home/groups/co_nuclear/serpent/xsdata/endfb7"
export SERPENT_ACELIB="sss_endfb7u.xsdata"
export SERPENT_DECLIB="sss_endfb7.dec"
export SERPENT_NFYLIB="sss_endfb7.nfy" 


python3 search_equilibrium.py>>log
