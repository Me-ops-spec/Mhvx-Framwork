
if [[ $EUID -ne 0 ]]
then
printf "\t\t\t \033[0;31m Welcom User How A re you .... \033[0m \n"
echo -e "\t\t \033[0;31m Error In The Permission Try Width A Super User Root \033[0m"

else

printf "\t\t\t \033[0;33m Welcom User I'n The Advenced Scan Method \n"
sleep 1

printf "\033[0;32m Entre the Domain To Start:  \033[0m"
read  domain

printf "\033[0;34m------------------------[The Scan Started On $domain]------------------------\033[0m \n" 

echo -e "\033[0;33m The Information For The Domain H'is Saved in folder result\033[0m"
touch result/report_site.txt
host $domain > report_site.txt

printf "\033[0;34m---------------------------[Starting A Port Scanner]---------------------------\033[0m \n"
touch result/port_report.txt && gnome-terminal -e "tail -F port_report.txt"
nmap -sC -sV -A -v -O -oX result/port_report.txt $domain
printf "\033[0;34m----------------------------[Starting Nikto]-------------------------------\033[0m \n"
nikto -output result/nikto_report.txt -h $domain
fi

