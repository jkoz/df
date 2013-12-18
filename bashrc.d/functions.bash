# useage fetchmailrc_tptai_at_tma_com_vn | fetchmailrc -k -f -
fetchmailrc_tptai_at_tma_com_vn () {
    stty -echo
    read pw
    stty echo
    config="\n"
    config="${config}set daemon 60\n"
    config="${config}set logfile /dev/null\n"
    config="${config}set no bouncemail\n"
    config="${config}poll pop3.tma.com.vn proto POP3\n"
    config="${config}user tptai pass ${pw} is ${USER} options ssl preconnect \"date\"\n"
    config="${config}mda \"/usr/bin/procmail -d %T\"\n"
    echo $config
}
