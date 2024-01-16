import re

def map_branch_name(branch_name):
    if branch_name == "main":
        return "qa"
    
    elif branch_name == "develop":
        return "test"
    
    elif re.match(r'(feature|bugfix|task|hotfix)/\w+', branch_name):
        return f"{branch_name[0]}-{branch_name.split('/')[1][0:4]}"
    
    else:
        print("There is no mapping for this branch name format, please try again")
        
workspace_name = map_branch_name("fds/test")
print(workspace_name)