import sys
import json
import os

from src.tokens import SOQLQuery
from src.reader import LogReader
from src.parser import LogParser
from src.writer import JsonWriter

# Main application entry point for the Apex Log Parser
# Execute by calling from the command line and supplying 
#   param1: path to an apex subscriber log file
#   param2: path to where a json output file should be generated
def parse(logfile, outfile):
    print('logfile: ' + logfile)
    print('outfile: ' + outfile)
    
    parser = LogParser(LogReader(logfile))
    writer = JsonWriter(outfile)
    writer.write_tree(parser)

    print('SOQL Queries: ' + str(SOQLQuery.total))
    # print_json(outfile)

'''
Helper function to check if file is empty
'''
def is_file_empty(inputFile):
    return os.stat(inputFile).st_size == 0


'''
Function to print out json file contents
'''
def print_json(outputFile):
    if is_file_empty(outputFile) != True:
        print('File size is: ')
        print(os.stat(outputFile).st_size)

        with open(outputFile, 'r') as f:
            parsedJson = json.loads(f)
            print(json.dumps(parsedJson, indent=4))



if __name__ == "__main__":
    if (len(sys.argv) != 3):
        print('ERROR: call must be of the form:')
        print('python main.py [log file path] [output file path]')
    else:
        arg1 = sys.argv[1]
        arg2 = sys.argv[2]
        parse(arg1, arg2)