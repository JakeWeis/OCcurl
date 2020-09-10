## =======================================================
## CurlScript.sh
## =======================================================
clear

# Create login credential files (only if not available yet)
if ! [ -f ~/.urs_cookies ]; then
  echo "EarthData Login credentials:"
  read -p "Username: " uid
  read -s -p "Password: " pwrd
  touch ~/.netrc
  echo "machine urs.earthdata.nasa.gov login $uid password $pwrd" > ~/.netrc
  chmod 0600 ~/.netrc
  touch ~/.urs_cookies
  clear
fi

# Create output directory if it does not exist
if ! [ -d $outputfolder ]; then
  mkdir $outputfolder
fi

# Find all files
filename=$"*"$tempres$"*"$product$"*"$spatres$".nc";
cd $outputfolder
(curl -d "sensor=$sensortype&sdate=$startdate&edate=$enddate&dtype=$datatype&addurl=1&results_as_file=1&search=$filename" https://oceandata.sci.gsfc.nasa.gov/api/file_search |grep getfile) > filelist.txt
nfiles=$(wc -l < filelist.txt)
i=0
t0=$(date '+%s')
clear
echo "==========================================="
echo "|  0/"$nfiles" files downloaded"
echo "-------------------------------------------"
echo "|  Elapsed time: 0 seconds"
echo "|  Estimated time remaining: calculating..."
echo "-------------------------------------------"
echo ""
echo "Progress:"
echo "---------"

for file in $(curl -d "sensor=$sensortype&sdate=$startdate&edate=$enddate&dtype=$datatype&addurl=1&results_as_file=1&search=$filename" https://oceandata.sci.gsfc.nasa.gov/api/file_search |grep getfile)
do
  ti=$(date '+%s')
  ((i++))
  curl -b ~/.urs_cookies -c ~/.urs_cookies -L -n --retry 10 -O $file;
  tii=$(date '+%s')
  clear
  echo "==========================================="
  echo "|  "$i"/"$nfiles" files downloaded"
  echo "-------------------------------------------"
  echo "|  Time elapsed: $(($tii - $t0)) seconds"
  echo "|  Estimated time remaining: $((($tii - $ti) * ($nfiles - $i))) seconds"
  echo "-------------------------------------------"
  echo ""
  echo "Progress:"
  echo "---------"
done;

clear
echo "==========================================="
echo "|  "$i"/"$nfiles" files downloaded"
echo "-------------------------------------------"
echo "|  Time elapsed: $(($tii - $t0)) seconds"
echo "|  Estimated time remaining: $((($tii - $ti) * ($nfiles - $i))) seconds"
echo "-------------------------------------------"
echo ""
echo "Download successful!"
echo ""
echo "=========================================="

exit
