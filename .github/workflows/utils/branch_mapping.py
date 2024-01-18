import re
import sys

def map_branch_name(branch_name):
    if branch_name == "main":
        return "qa"
    
    elif branch_name == "develop":
        return "test"
    
    elif re.match(r'(feature|bugfix|task|hotfix)/\w+', branch_name):
        """
        takes first letter of branch and concats it using hyphen with the branch description
        i.e. feature/test (branch name) -> f-test (workspace name)
        """
        return f"{branch_name[0]}-{branch_name.split('/')[1]}" 
        
    
    else:
        print("There is no mapping for this branch name format, please try again")
        exit(1)
        
workspace_name = map_branch_name(sys.argv[1])
print(f"Workspace nameworkspace_name: {workspace_name}")