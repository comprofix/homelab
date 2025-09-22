#!/bin/bash
changed_tasks=($(git diff --name-only $1 $2 | grep '\.yml$'))
if [ ! -z "$changed_tasks" ]; then
    for task in "${changed_tasks[@]}"; do
        tag=$(echo "$task" | awk -F/ '{print $2}')
        if [[ "$tag" != "deploy-homelab.yml" && "$tag" != "main.yml" && "$tag" != "all.yml" && "$tag" != "all.example.yml" && "$tag" != "ISSUE_TEMPLATE" && "$tag" != "workflows"   ]] ; then
           tag=${tag%.*}_install
           ansible-galaxy install -r requirements.yml
           echo "Running playbook with tag: $tag"
           ansible-playbook main.yml --tags "$tag" --vault-password-file ~/.vault_password.txt          
        fi
    done
else
    echo "No changes detected in task files. Skipping Ansible playbook execution."
fi