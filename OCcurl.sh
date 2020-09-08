## =======================================================
## INPUT PARAMETERS
## =======================================================
# Output directory
outputfolder=$"/Volumes/jweis/DATA/NC/SAT/ModisAqua_MO_9km/BBP";
# Start/end date
startdate=$"2019-12-01";
enddate=$"2020-01-01";
# Temporal resolution - DAY/8D/MO
tempres=$"MO";
# Spatial resolution - 9km/4km
spatres=$"9km";
# Satellite product - chlor/nflh/aph/bbp/poc/ipar
product=$"chlor";
# Sensor type
sensortype=$"aqua";
# Data type
datatype=$"L3m";

## =======================================================
## EXECUTE
## =======================================================
clear
# Create output directory if it does not exist
if ! [ -d $outputfolder]; then
  mkdir $outputfolder
fi
filename=$"*"$tempres$"*"$product$"*"$spatres$".nc";
cd $outputfolder
(curl -d "sensor=$sensortype&sdate=$startdate&edate=$enddate&dtype=$datatype&addurl=1&results_as_file=1&search=$filename" https://oceandata.sci.gsfc.nasa.gov/api/file_search |grep getfile) > filelist.txt
nfiles=$(wc -l < filelist.txt)
i=0
t0=$(date '+%s')
clear
echo "==========================================="
echo "|  0/$nfiles files downloaded"
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
  echo "|  $i/$nfiles files downloaded"
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
echo "|  $i/$nfiles files downloaded"
echo "-------------------------------------------"
echo "|  Time elapsed: $(($tii - $t0)) seconds"
echo "|  Estimated time remaining: $((($tii - $ti) * ($nfiles - $i))) seconds"
echo "-------------------------------------------"
echo ""
echo "Download successful!"
echo ""
echo "=========================================="
