*** Settings ***
Documentation    Running With Timeout 10 minutes
Suite Setup      ${DISPLAY}
Test Timeout     2 minutes
Resource         ../resources/Keywords.robot
Resource         ../resources/Variables.robot
Resource         ../resources/Settings.robot
    