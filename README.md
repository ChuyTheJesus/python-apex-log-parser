# python-apex-log-parser
A quick tool for working with Salesforce Subscriber logs.

"This was created for my own benefit when examining Salesforce logs to locate efficiency problems like repeated SQOL Queries, non-double fire safe triggers and things like that. If it proves useful, I will continue updating it and am happy to review enhancements/corrections.

With that said, it is very immature - so use at your own risk!"

This is a forked version of Royce Nobles original log parser.

## Getting Started

The only prerequisite is that you have some recent version of docker installed.

To use, simply clone the repo, navigate to the root folder and execute the following commands, i.e.:

```bash
cd python-apex-log-parser
bash log_scraper.sh build
```

which will navigate to the unzipped directory if you have not already, 
and build the docker image. Then run the command,  

```bash
bash log_scraper.sh run <path to subscriber log>
```

which will in turn run the docker image with the given log file path as the input log file. Make sure to include the full system file path with reference to the home directory i.e. 

```bash
bash log_scraper.sh run /Users/chuy/Desktop/<subscriber log file name>
```

## CLI Help

To see available CLI commands, run the following help command,

```bash
bash log_scraper.sh help
```

## Authors

* **Royce Nobles** - *Initial work* - (https://github.com/roycenobles)
* **Jesus Perez** - *containerization* *minor updates* - (https://github.com/chuythejesus)


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details