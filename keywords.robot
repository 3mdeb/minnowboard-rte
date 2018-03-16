*** Keywords ***

Serial setup
    [Arguments]    ${host}    ${s2n_port}
    # provide ser2net port where serial was redirected
    Telnet.Open Connection    ${host}    port=${s2n_port}
    Telnet.Set Encoding    errors=ignore
    Set Timeout    240

Open Connection And Log In
   SSHLibrary.Open Connection    ${rte_ip}
   SSHLibrary.Login    ${USERNAME}    ${PASSWORD}

