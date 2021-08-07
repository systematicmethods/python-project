# python-project
Create Python projects with the following structure


``` 
├── src/module_name/
│   ├── __init__.py
│   ├── module_name.py
│   └── helpers.py
│
├── tests/
│   ├── module_name_tests.py
│   └── helpers_tests.py
│
├── .gitignore
├── LICENSE
├── README.md
├── requirements.txt
└── setup.py
└── Dockerfile
└── build.sh
└── env.sh

```
```bash
cd <your empty project>
<this_project_path>/bin/create_py_project.sh <your module name>
```
