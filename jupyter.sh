#!/bin/bash
#SBATCH --job-name=MY_JOB                              # 수정필요
#SBATCH --partition=gpu7                               # 수정필요
#SBATCH --nodelist=n107                                # 수정필요                
#SBATCH --cpus-per-task=1                              # 수정필요
#SBATCH --gres=gpu:1 
#SBATCH -o ./output/jupyter.%N.%j.out  # STDOUT        # 수정필요
#SBATCH -e ./output/jupyter.%N.%j.err  # STDERR        # 수정필요

echo "start at:" `date`
echo "node: $HOSTNAME" 
echo "jobid: $SLURM_JOB_ID" 

module load cuda/11.8.0 

python -m jupyter lab $HOME \
        --ip=0.0.0.0 \
        --no-browser
