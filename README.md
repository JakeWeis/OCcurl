# OCcurl
MacOS app for accessing and bulk downloading data from the *NASA EarthData OceanColor satellite database* via cURL.

Instructions
---
1. Open OCcurl
   - *First time running the app: Right click the app icon and select <code>open</code> while holding down option <code>&#8997;</code> (else Mac won't allow it to run). There will likely be a number of requests asking for control. Accept each request.*
2. An input window will open in TextEdit (or any other default text editor). Adjust all download parameters as required and **save** the adjusted file (<code>&#8984;+S</code>). Download parameters explained below.
3. A confirmation window opened with the input window. After saving the input file click <code>OK</code> to proceed to download, or <code>Cancel</code> to abort.
4. A Terminal window will open displaying the download progress.
   - *First time running the app: You will be prompted for your EarthData login credentials (in the Terminal window). They are required to download data from the database. Enter your EarthData username and password (same as the ones used to login here: https://urs.earthdata.nasa.gov/home). This will create two login files which will be accessed in the future (no need to reenter credentials).*
5. The files will be downloaded into the specified download folder (in a subfolder named after the satellite product). OCcurl also produces a filelist text file. This is a good way to check whether the correct files are being downloaded.

*Note: Multiple instances of OCcurl can run at the same time, allowing for simultaneous download jobs.*
   
Download parameters
---
- **File output folder**
  - full path (default: 'Download' folder)
- **Start and end date** of data to be downloaded
  - <code>YYYY-MM-DD</code>
- **Temporal resolution**
  - <code>DAY</code> (daily)
  - <code>8D</code> (8-day)
  - <code>MO</code> (monthly)
  - <code>YR</code> (annual) 
  - <code>CU</code> (cumulative)
  - <code>MC</code> (monthly climatology)
  - <code>R32</code> (rolling 32 day average)
  - <code>SNSP/SNSU/SNAU/SNWI</code> (seasonal spring/summer/autumn/winter)
  - <code>SCSP/SCSU/SCAU/SCWI</code> (seasonal climatology spring/summer/autumn/winter)
- **Spatial resolution** 
  - <code>4km</code>
  - <code>9km</code>
- **Satellite product**
  - *Note: This parameter is used to conduct a string search in the file name. Any character sequence found in the filename can be used here. A list of parameter names can be found here: https://oceandata.sci.gsfc.nasa.gov/MODIS-Aqua/Mapped/8-Day/4km/*
  - Examples: <code>chlor_a, poc, sst,...</code>
- **Sensor type**
  - <code>aquarius</code>
  - <code>seawifs</code>
  - <code>aqua</code> (MODIS Aqua)
  - <code>terra</code> (MODIS Terra)
  - <code>meris</code>
  - <code>octs</code>
  - <code>czcs</code>
  - <code>hico</code>
  - <code>viirs</code> (VIIRS-SNPP)
  - <code>viirsj1</code> (VIIRS-JPSS1)
  - <code>s3aolci</code> (Sentinel-3A)
  - <code>s3bolci</code> (Sentinel-3B)
- **Data type**: <code>L0, L1, L2, L3b (for binned data), L3m (for mapped data)</code>
  - <code>L0</code> (Level 0)
  - <code>L1</code> (Level 1)
  - <code>L2</code> (Level 2)
  - <code>L3b</code> (Level 3 binned)
  - <code>L3m</code> (Level 3 mapped)
