#!/bin/bash

mkdir -p ./test-reports/ 2>/dev/null

flutter pub global activate junitreport 
flutter pub global activate dart_dot_reporter
curl -kL https://bootstrap.pypa.io/get-pip.py | python
pip install junit2html

flutter test --machine > machine.json
flutter pub global run junitreport:tojunit --input machine.json --output ./test-reports/TEST-results.xml
echo 'Tests done.'
flutter pub global run dart_dot_reporter machine.log
junit2html ./test-reports/TEST-results.xml ./test-reports/index.html
