@echo off
echo ============================================
echo Starting Full Test Suite Execution
echo ============================================

call venv\Scripts\activate

echo.
echo --- Running Smoke Tests ---
robot --outputdir reports\smoke tests\smoke

echo.
echo --- Running Negative Tests ---
robot --outputdir reports\negative tests\negative

echo.
echo --- Running Regression Tests ---
robot --outputdir reports\regression tests\regression

echo.
echo ============================================
echo All Test Suites Completed
echo Combined logs available in: logs\execution.log
echo Individual reports available in: reports\smoke, reports\negative, reports\regression
echo ============================================

rebot --outputdir reports --output combined.xml --name "Full Suite" reports\smoke\output.xml reports\negative\output.xml reports\regression\output.xml

echo.
echo Combined report generated: reports\report.html
pause