# setup.py

from setuptools import setup, find_packages

setup(
    name="PythonToModelica",
    version="0.1.0",
    packages=find_packages(where="src"),
    package_dir={"": "src"},
    install_requires=[
        "numpy>=1.21.0",
    ],
    extras_require={
        "dev": [
            "pytest>=6.2.5",
            "pytest-cov>=2.12.1",
            "tensorflow>=2.2.0",
        ],
    },
    author="AnHeuermann",
    description="A package convert Python data types to Modelica strings.",
    long_description=open('README.md').read(),
    long_description_content_type='text/markdown',
    url="https://github.com/AnHeuermann/PythonToModelica",
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: BSD License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.9',
)
