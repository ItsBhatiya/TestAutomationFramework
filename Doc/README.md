# Westwing web automation document

### Prerequisites

1. Install python 3.x

   **Note :** I've used python version 3.2.1

2. To install  pip refer  : https://www.liquidweb.com/kb/install-pip-windows/ 

3. pip install robotframework 

   **Note :** I've used robotframework lib version 3.2.1

4. pip install robotframework-seleniumlibrary

   **Note :** I've used robotframework-seleniumlibrary lib version 4.5.0

5. Download Chrome Driver: http://chromedriver.chromium.org/downloads
    
   **Note :** should have compaitable webdriver installed according to the latest browser version used for executing the script

### Command to run test cases
1. To run entire test suite: **robot -d Report/ TestSuite/west_wing_now.robot**
2. To run single test case using tag name: **robot -i TC -d Report/ TestSuite/west_wing_now.robot**

### Reporting and analysis
1.	After the execution is completed, a log file will be generated along with report and an xml file.
2.	You can refer the log.html/report.html files for analysis.