#!/bin/bash

source globals.sh

singularity run --cleanenv \
    --bind $bids_dir:/home \
    --bind $scratch_dir:/scratch \
    --bind /usr/people \
    /jukebox/hasson/singularity/mriqc/mriqc-v0.15.1.simg \
    --participant-label $1 \
    --correct-slice-timing --no-sub \
    --nprocs 8 -w /scratch \
    /home /bids/derivatives/mriqc participant
