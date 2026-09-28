# E-Commerce Web Automation Framework

Robot Framework + Selenium + Python automation suite for automationexercise.com.

## Setup
python -m venv venv
venv\Scripts\Activate.ps1
pip install -r requirements.txt

## Run
robot --outputdir reports tests/smoke
robot --outputdir reports tests/regression
robot --outputdir reports tests/negative

## Run all
\run_all_tests.bat  

## Structure
See project folder layout — tests/, resources/ (pages + keywords),
libraries/ (Python validation, CSV data, logging), testdata/, config/.
