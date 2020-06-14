clear
startdate=$"1997-01-01";
enddate=$"2020-06-30";
sensortype=$"aqua";
datatype=$"L3m";
filename=$"*L3m_8D_IOP_bbp_443_giop_4km.nc"

(curl -d "sensor=$sensortype&sdate=$startdate&edate=$enddate&dtype=$datatype&addurl=1&results_as_file=1&search=$filename" https://oceandata.sci.gsfc.nasa.gov/api/file_search |grep getfile) > filelist.txt
nfiles=$(wc -l < filelist.txt)
i=0
t0=$(date '+%s')

for file in $(curl -d "sensor=$sensortype&sdate=$startdate&edate=$enddate&dtype=$datatype&addurl=1&results_as_file=1&search=$filename" https://oceandata.sci.gsfc.nasa.gov/api/file_search |grep getfile);
do
  ti=$(date '+%s')
  ((i++))
  curl -b ~/.urs_cookies -c ~/.urs_cookies -L -n --retry 10 -O $file;
  tii=$(date '+%s')
  clear
  echo "$i/$nfiles files downloaded"
  echo "Time elapsed: $(($tii - $t0)) seconds"
  echo "Estimated time remaining: $((($tii - $ti) * ($nfiles - $i))) seconds"
done;

echo "Download successful!"
