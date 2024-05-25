#!/bin/bash

changed_tasks=($(git diff-tree --no-commit-id --name-only -r ca4fdd3fd13f9330d6783e865222550f6590c059 | grep '\.yml$'))
      if [[ ! -z "$changed_tasks" ]]; then
        chmod 700 ansible
        cd ansible
        echo "$ANSIBLE_VAULT_PASSWORD" > .vault_password.txt
        #check for role
        for updated_task in "${changed_tasks[@]}"; do
          basename=$(basename "$updated_task")
          role=$(echo "$updated_task" | awk -F/ '{print $3}')
          if [ "$role" != "containers" ] && [ "$basename" = "main.yml" ]; then
            echo $updated_task
            echo "The following roles have been updated: $role"
            echo "Running Ansible playbook..."
            #ansible-playbook deploy-homelab.yml --tags "$role" --vault-password-file .vault_password.txt
          elif [ "$role" = "containers" ] && [ "$basename" != "main.yml" ]; then
            echo $updated_task
            echo "The following task file has been updated: $updated_task"
            echo "Running Ansible playbook..."
            tags="${basename%.*}_install"
            echo $tags
            #ansible-playbook deploy-homelab.yml --tags "$tags" --vault-password-file .vault_password.txt
          fi
        done
      else
        echo "No changes detected in task files. Skipping Ansible playbook execution."
      fi
