# python-project
Create Python projects with the following structure

``` 
├── src/module_name/
│   ├── __init__.py
│   ├── module_name.py
│   └── helpers.py
│
├── tests/
│   ├── module_name_test.py
│   └── helpers_test.py
│   └── example_test.py
│
├── .gitignore
└── build.sh
└── Dockerfile
└── env.sh
├── LICENSE
└── pyproject.toml
├── requirements.txt
└── setup.cfg
└── test.sh
└── test_in_docker.sh
```
## To create a Python Module Project
```bash
cd <your empty project>
<this_project_path>/bin/create_py_project.sh -m <your module name>
```

## To test a Python Module Project after its created
```bash
cd <your empty project>
./test.sh
```
This expects:
* Docker
* Image sm/continuumio/anaconda3:2021.05 

And starts
* Docker
* Builds the module in Docker
* Runs pytest in Docker


# References
https://blog.ionelmc.ro/2014/05/25/python-packaging/#the-structure
https://docs.pytest.org/en/6.2.x/goodpractices.html#test-discovery
