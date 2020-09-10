## =======================================================
## DOWNLOAD PARAMETERS
## =======================================================
# Specify output folder
mainfolder=~/Downloads
# Start/end date
startdate="2019-10-01";
enddate="2020-03-01";
# Temporal resolution - DAY/8D/MO
tempres="MO";
# Spatial resolution - 9km/4km
spatres="9km";
# Satellite product - chlor_a/nflh/aph/bbp/poc/ipar
product="poc";
# Sensor type
sensortype="aqua";
# Data type
datatype="L3m";

# Generate output subdirectory (automatically from download paramters)
outputfolder=$mainfolder/"$sensortype"_"$tempres"_"$spatres"/$product;

# Export variables
export outputfolder
export startdate
export enddate
export tempres
export spatres
export product
export sensortype
export datatype

# Execute curl script
BASEDIR=$(dirname "$0")
cd "$BASEDIR"
./CurlScript.sh
