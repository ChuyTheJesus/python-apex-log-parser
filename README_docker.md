# Chuys JSON keyValue Switcher

Chuy's JSON keyValue Switcher is a command line tool that runs within a docker image, and 
modifies a given json file, based on a specified criteria. The criteria are:

* If any key in the JSON file solely contains alphabetical characters, switch said
    key with it's corresponding value pair.
* For all other keys that are not solely alphabetical, leave them as they are.

Once the json file is modified, it is then output to the command line.


## Usage

After unzipping the project, run the following commands in the given order,

```bash
cd Python-Developer-Challenge
bash runDocker.sh build
```

which will navigate to the unzipped directory if you have not already, 
and build the docker image. Then run the command,  

```bash
bash runDocker.sh run <json-file-path>
```

which will in turn run the docker image with the given json file path as 
the input json file. Make sure to include the full system file path with 
reference to the home directory i.e. 

```bash
bash runDocker.sh run /Users/g2i6026/Desktop/AppDevelopment/<json-file-name>
```

## Run Unit Tests

If you want to run the unit test on Chuys JSON keyValue Switcher, run the 
command below,

```bash
bash runDocker.sh test
```

## CLI Help

To see available CLI commands, run the following help command,

```bash
bash runDocker.sh help
```
