# Capture barnch name in variable from parameters
export BRANCH_NAME=$1

# Capture the output of terraform workspace list into an array
echo "terraform workspace list"
terraform workspace list
workspace_list=($(terraform workspace list))
echo $workspace_list

# Check if the search string exists in the workspace list
found=false

echo "Branch name: $BRANCH_NAME"
export workspace_name=$(python ../../.github/workflows/utils/branch_mapping.py "$BRANCH_NAME")

for item in "${workspace_list[@]}"; do
    if [[ "$item" == $workspace_name ]]; then
        found=true
        break
    fi
done

if [ "$found" = true ]; then
    terraform workspace select $workspace_name
    echo "Switching to workspace '$workspace_name'."
else
    echo "Creating and switching to workspace '$workspace_name'."
    terraform workspace new $workspace_name
fi
terraform workspace list
