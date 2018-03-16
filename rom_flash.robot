*** Settings ***
Library     SSHLibrary    timeout=60 seconds
Library     Telnet    timeout=240 seconds
Library     Process
Library     OperatingSystem
Library     String
Suite Setup            Open Connection And Log In
Suite Teardown         SSHLibrary.Close All Connections

Resource    variables.robot
Resource    keywords.robot

*** Test Cases ***

FLASH1.1 Minnowboard ROM flash test
    SSHLibrary.Execute Command    /root/robot-mwb/rte-gpio-init-mwb.sh
    SSHLibrary.Put File    ${ROM_file}    /root/robot-mwb/${ROM_file}
    SSHLibrary.Execute Command    echo 0 > /sys/class/gpio/gpio199/value
    Sleep    1s
    ${output}=    SSHLibrary.Execute Command    flashrom -w /root/robot-mwb/${ROM_file} -p linux_spi:dev=/dev/spidev1.0,spispeed=32000
    Should Contain    ${output}    Verifying flash... VERIFIED.
    SSHLibrary.Execute Command    rm /root/test-mwb/${ROM_file}

BOOT1.1 Minnowboard boot test
    Serial setup    ${rte_ip}    ${rte_s2n_port}
    SSHLibrary.Execute Command    /root/robot-mwb/
    SSHLibrary.Execute Command    echo 1 > /sys/class/gpio/gpio199/value
    Sleep    1
    Telnet.Read Until    ${shell_prompt}
    Telnet.Close Connection


