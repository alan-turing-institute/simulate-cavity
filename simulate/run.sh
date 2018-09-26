#!/bin/bash

SIMULATE="simulate"
STATE="$SIMULATE/state"


QSUB=$(command -v qsub)

if [ -n "$QSUB" ]; then
    # save PBS_JOBID in state file via tee
    echo "Submitted job"
    qsub -o log.qsub.stdout -e log.qsub.stderr pbs.sh | tee $STATE/pbs_job_id
else
    echo "manual" > $STATE/pbs_job_id
    python entry.py
fi





