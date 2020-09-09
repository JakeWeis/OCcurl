## OCCURL.sh
Jake Weis, April 2020

Bulk download NASA OceanColor data using a shell script (data access via curl). This script will search the entire NASA OceanColor database for files based on the specified search parameters. Instructions can be found here: https://oceancolor.gsfc.nasa.gov/forum/oceancolor/topic_show.pl?tid=3081

### Before using the script (only once):
To get full access to the database, login credentials need to be provided. The best way to do this is to create a login file (.netrc) and a cookie file (.urs_cookies), by executing the following lines in the Mac Terminal (replace `<uid>` and `<password>` with your Ocean Color website user-ID and password):

    touch ~/.netrc
    echo "machine urs.earthdata.nasa.gov login <uid> password <password>" > ~/.netrc
    chmod 0600 ~/.netrc
    touch ~/.urs_cookies


### Step by step guide:
1. Adjust parameters startdate and enddate (time frame of interest), sensortype, datatype and filename (filename or pattern). Refer to https://oceancolor.gsfc.nasa.gov/forum/oceancolor/topic_show.pl?tid=3081 for parameter options.
2. Save script.
3. Files will be downloaded into the current working directory. To specify the download folder change the current directory (`cd <download directory>`)
4. Drag curlscript.sh into the Terminal and execute. In case of "Permission denied" error, the shell script needs to be made executable first: chmod +x OCcurl.sh
5. Script will start downloading. I added a counter of files downloaded, total number of files, elapsed time and estimated time left (based on the number files left and the time the previous file took to download).
