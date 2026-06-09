#!/bin/bash
#SBATCH --job-name=MY_JOB                  # 사용자의 작업 이름으로 변경
#SBATCH --output=/gpfs/home1/[계정명]/practice/output/%j.out
#SBATCH --error=/gpfs/home1/[계정명]/practice/output/%j.err
#SBATCH --partition=gpu6                   # 사용할 파티션 이름으로 변경 필요 -> gpu number(gpu1 ~ gpu6)
#SBATCH --nodes=1                          # 사용할 노드 수 
#SBATCH --nodelist=n032,n033               # 사용할 노드 이름으로 변경 -> node number(n001 ~ n106)  
#SBATCH --cpus-per-task=1                  # 하나의 태스크가 사용할 CPU 코어 수

##SBATCH --gres=gpu:1                       # 사용할 gpu 수
##SBATCH --mem=128G                        # 메모리 할당량 (##이므로 해당 명령어 비활성화)
##SBATCH --time=48:00:00                   # 최대 실행 시간 (##이므로 해당 명령어 비활성화)

echo "start at: $(date)"                   # 접속한 날짜 표기
echo "node: $HOSTNAME"                     # 접속한 노드 번호 표기
echo "jobid: $SLURM_JOB_ID"                # jobid 표기

# Load env (python 환경)
source ~/miniconda3/etc/profile.d/conda.sh     

# 가상환경 활성화 (설치한 가상환경 이름으로 변경 필요, test -> 가상환경 이름)
conda activate test                        # test라는 conda 환경에서 슈퍼컴퓨팅 쓸 준비 완료

# python 스크립트 실행
python predict.py
