## =======================================================
## INPUT PARAMETERS
## =======================================================
# Output directory
outputfolder="/Volumes/jweis/DATA/NC/SAT/ModisAqua_MO_9km/test2";
# Start/end date
startdate="2019-12-01";
enddate="2020-01-01";
# Temporal resolution - DAY/8D/MO
tempres="MO";
# Spatial resolution - 9km/4km
spatres="9km";
# Satellite product - chlor/nflh/aph/bbp/poc/ipar
product="nflh";
# Sensor type
sensortype="aqua";
# Data type
datatype="L3m";

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
