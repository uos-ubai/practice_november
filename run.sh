#!/bin/bash
#SBATCH --job-name=MY_JOB                 # 작업 이름
#SBATCH --output=/gpfs/home1/[계정명]/practice/output/%j.out  # 작업 실행 결과 로그가 저장되는 경로(계정명 수정 필요)
#SBATCH --error=/gpfs/home1/[계정명]/practice/output/%j.err   # 작업 실행 실패 로그가 저장되는 경로(계정명 수정 필요)
#SBATCH --partition=gpu6                  # 사용할 파티션 이름 지정 -> gpu number(gpu1~gpu6, cpu1~gpu2)
#SBATCH --nodes=1                         # 사용할 노드 개수
#SBATCH --nodelist=n[015-021]             # 사용할 노드 이름 지정 -> node number(n001~n116)                  
#SBATCH --cpus-per-task=1                 # 하나의 태스크가 사용할 CPU 코어 개수
#SBATCH --mem=4G                          # 노드 당 사용할 메모리 크기(생략 시 파티션별 기본 메모리 크기 할당)
#SBATCH --time=24:00:00                    # 최대 실행 시간(기본 최대 48시간 실행 가능)

##SBATCH --reservation=ubai_edu            # 예약 이름(실습을 위해 사전 예약된 노드에서 작업 실행)

##SBATCH --gres=gpu:2                      # 사용할 gpu 수 (##이므로 해당 명령어 비활성화)

echo "start at: $(date)"                   # 접속한 날짜 표기
echo "node: $HOSTNAME"                     # 접속한 노드 번호 표기
echo "jobid: $SLURM_JOB_ID"                # jobid 표기

# Load env (python 환경)
source ~/miniconda3/etc/profile.d/conda.sh     

# 가상환경 활성화 (설치한 가상환경 이름으로 변경 필요, test -> 가상환경 이름)
conda activate test                 

# python 스크립트 실행
python predict.py
