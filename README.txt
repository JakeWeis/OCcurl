+++++++  OCcurl  +++++++
MacOS app for accessing and bulk downloading data from the NASA EarthData OceanColor satellite database via cURL.


Instructions
------------
1. Open OCcurl
- First time running the app: Right click the app icon and, while holding down option, click open (else Mac won't allow it to run). There will be a number of requests asking for permission. Accept each request.

2. An input window will open in TextEdit (or any other default text editor). Adjust all download parameters as required and save the adjusted file (CMD+S). Download parameters explained below.

3. A confirmation window opened with the input window. After saving the input file click OK to proceed to download, or Cancel to abort.

4. A Terminal window will open displaying the download progress.
- First time running the app: You will be prompted for your EarthData login credentials (in the Terminal window). They are required to download data from the database. Enter your EarthData username and password (same as the ones used to login here: https://urs.earthdata.nasa.gov/home). This will create two login files which will be accessed in the future (no need to re-enter credentials). 
Important: If incorrect login credentials are provided, OCcurl will still execute as normal, but only download generic text files, each containing a notification that a login is required to access the database. Instructions on how to change the login credentials below.***

5. The files will be downloaded into the specified download folder (in a subfolder named after the satellite product). OCcurl also produces a filelist text file. This is a good way to check whether the correct files are being downloaded.

Note: Multiple instances of OCcurl can run at the same time, allowing for simultaneous download jobs.


Download parameters
-------------------
- File output folder
  - full path (default: 'Download' folder)
- Start and end date of data to be downloaded
  - <code>YYYY-MM-DD</code>
- Temporal resolution
  - DAY (daily)
  - 8D (8-day)
  - MO (monthly)
  - YR (annual) 
  - CU (cumulative)
  - MC (monthly climatology)
  - R32 (rolling 32 day average)
  - SNSP, SNSU, SNAU, SNWI (seasonal spring/summer/autumn/winter)
  - SCSP, SCSU, SCAU, SCWI (seasonal climatology spring/summer/autumn/winter)
- Spatial resolution 
  - 4km
  - 9km
- Satellite product
  - Note: This parameter is used to conduct a string search in the file name. Any character sequence found in the filename can be used here. A list of parameter names can be found here: https://oceandata.sci.gsfc.nasa.gov/MODIS-Aqua/Mapped/8-Day/4km/
  - Examples: chlor_a, poc, sst,...
- Sensor type
  - aquarius
  - seawifs
  - aqua (MODIS Aqua)
  - terra (MODIS Terra)
  - meris
  - octs
  - czcs
  - hico
  - viirs (VIIRS-SNPP)
  - viirsj1 (VIIRS-JPSS1)
  - s3aolci (Sentinel-3A)
  - s3bolci (Sentinel-3B)
- Data type
  - L0 (Level 0)
  - L1 (Level 1)
  - L2 (Level 2)
  - L3b (Level 3 binned)
  - L3m (Level 3 mapped)

Change login credentials
---
If incorrect login credentials were provided (every downloaded file has the same size of 27 KB), follow these instructions to adjust them:
1. Right click the Finder icon in the Dock.
2. Click "Go to folder..."
3. Enter "~/" and click "Go"
4. Press CMD+SHIFT+. (show hidden files, same shortcut to hide them again)
5. Locate file ".netrc" and open (should open in a text editor)
6. Change username or password and save file (CMD+S)
7. Retry downloading. If the correct credentials were entered, the actual files should be downloaded (usually >10 MB in size)
