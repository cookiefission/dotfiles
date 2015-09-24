#!/bin/zsh

function running_jobs_count() {
    local job_count
    job_count="$(jobs | wc -l | sed -e 's/^[[:space:]]*//')"
    echo "%F{2}Jobs: ${job_count}%f | "
}
