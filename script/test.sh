#!/bin/bash

mkdir -p ./test-reports/ 2>/dev/null

curl -kL https://bootstrap.pypa.io/get-pip.py | python
pip install junit2html

flutter test --machine > machine.json
flutter pub run junitreport:tojunit --input machine.json --output ./test-reports/TEST-results.xml
echo 'Tests done.'
flutter pub run dart_dot_reporter machine.json
junit2html ./test-reports/TEST-results.xml ./test-reports/index.html
