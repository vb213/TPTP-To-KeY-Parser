import subprocess
import sys
import os
import shutil
import re
arguments = sys.argv
parameters = arguments[1:]

fails = []

in_folder = parameters[0]
out_folder = parameters[1]
print(in_folder)

allesGut = True

def writeFile(file_name, content):
    try:
        with open(out_folder +"/"+ file_name, 'w') as file:
            file.write(content)
        print(f"Content successfully written to '{file_name}'.")
    except IOError:
        print(f"Error: Unable to write to '{file_name}'.")

def create_folder_if_not_exists(folder_path):
    if not os.path.exists(folder_path):
        os.makedirs(folder_path)
        print(f"Folder '{folder_path}' created.")
    else:
        print(f"Folder '{folder_path}' already exists.")


def compile(infilename):
    global count
    executable_path = "./TPTP_to_KeY"
    input_file = os.path.realpath(in_folder + "/" + infilename)

    # Run the executable and capture its output
    with open(input_file, 'r') as f:
        process = subprocess.Popen(executable_path, stdin=f, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    stdout, stderr = process.communicate()

    # Decode the output to a string
    stdout_str = stdout.decode('utf-8')
    stderr_str = stderr.decode('utf-8')

    # Print the output
    
    if stderr_str != "":
        print("Error: " + filename)
        print(stderr_str)
        fails.append(infilename)
    else: 
        #shutil.move(input_file, "/home/valentin/baCode/compiler/experiments/test/fof/" + filename)
        print("Parsed: " + filename)
        print(stdout_str)
        writeFile(getKeyFileNameFrom(infilename), stdout_str)


    return stdout_str, stderr_str

def getFolderPath(testCateg):
    base =  os.path.dirname(os.path.realpath(__file__))
    return base + "/" + testCateg

def getKeyFileNameFrom(filename):
    return re.sub(r'\.p|\.we', ".key", filename)

folderpath = getFolderPath(in_folder)
print("Folderpath: " + folderpath)
create_folder_if_not_exists(out_folder)
files = os.listdir(folderpath)
for filename in files:
    compile(filename)


print("Error: " + str(len(fails)) + "/" + str(len(files)))
