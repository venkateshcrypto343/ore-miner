#!/bin/bash

#add your solana rpc endpoint
DEFAULT_RPC_URL="....."
#add your solana pubkey path
DEFAULT_KEY="/root/.config/solana/id.json"
#define solana gas fee
DEFAULT_FEE=10000000
#define how many cpu threads used
DEFAULT_THREADS=10

RPC_URL=${1:-$DEFAULT_RPC_URL}
KEY=${2:-$DEFAULT_KEY}
FEE=${3:-$DEFAULT_FEE}
THREADS=${4:-$DEFAULT_THREADS}

COMMAND="ore --rpc ${RPC_URL} --keypair ${KEY} --priority-fee ${FEE} mine --threads ${THREADS}"

while true; do
  echo "Starting the process..."
  eval $COMMAND
  [ $? -eq 0 ] && break
  echo "Restart in 5 seconds..."
  sleep 5
done
