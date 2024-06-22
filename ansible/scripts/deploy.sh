#!/bin/bash
changed_tasks=($(git diff --name-only $1 $2 | grep '\.yml$'))
chmod 700 ansible
cd ansible
if [ ! -z "$changed_tasks" ]; then
    for task in "${changed_tasks[@]}"; do
        basename=$(basename "$task")
        role=$(echo "$task" | awk -F/ '{print $3}')
        role_task=$(echo "$task" | awk -F/ '{print $4}')
        if [[ "$basename" != "deploy-homelab.yml" && "$basename" != "main.yml" && "$basename" != "all.yml" && "$basename" != "all.example.yml" && "$basename" != ".gitlab-ci.yml" && "$role_task" != "defaults" && "$role_task" != "meta" && "$role_task" != "vars" && "$role_task" != "templates" ]] ; then
            if [[ "$role" = "containers" ]]; then
                tags=${basename%.*}_install
                ansible-playbook deploy-homelab.yml --tags "$tags" --vault-password-file ~/.vault_password.txt
            # else
            #     tags=${role%.*}_install
            #     ansible-playbook deploy-homelab.yml --tags "$tags" --vault-password-file ~/.vault_password.txt
            fi
        fi
    done
else
    echo "No changes detected in task files. Skipping Ansible playbook execution."
fi