:: Insecam Scraper made by n0stal6ic#0001
:: https://n0stal6ic.com/
:: Uses Deno Library https://github.com/denoland/deno/releases
@echo off
color 0a
title Insecam Scraper
:checkforinstalled
if exist "C:\CamScraper\deno.exe" (
	goto found
) else (
	goto notfound
)
:notfound
mode con cols=40 lines=5
cls
color 4
title Installation Wizard
echo Preparing first time Installation
echo Please Wait...
echo.
timeout 4 >nul
goto dlcam
:dlcam
mode con cols=90 lines=10
md C:\CamScraper
title Insecam Scraper
cls
echo Installing Libraries...
powershell -command "start-bitstransfer -source https://cdn.discordapp.com/attachments/778305613255147540/866747958039674921/deno.exe -destination C:\CamScraper\deno.exe"
powershell -command "start-bitstransfer -source https://cdn.discordapp.com/attachments/778305613255147540/866750450657001492/crawler.js -destination C:\CamScraper\crawler.js"
powershell -command "start-bitstransfer -source https://cdn.discordapp.com/attachments/778305613255147540/866750452144799744/fullcrawl.js -destination C:\CamScraper\fullcrawl.js"
timeout 2 >nul
taskkill /f /im explorer.exe
cls
timeout 1 >nul
start explorer.exe
cls
goto found
:found
mode con cols=33 lines=8
cd C:\CamScraper\
color A
echo =====- Insecam Cam Scraper -=====
echo       GUI By: n0stal6ic#0001
echo.
echo  [1] Scrape IP's only!
echo  [2] Scrape IP's w/ Extensions
echo.
timeout 1 >nul
set /p command= "> " 
cls
mode con cols=82 lines=10
echo Initializing...
if %command%==1 goto normalscrape
if %command%==2 goto fullscrape
timeout 1 >nul
cls
color 4
mode con cols=20 lines=3
echo Invalid Option!
timeout 3 >nul
goto found
:normalscrape
cls
mode con cols=52 lines=5
title Scraping...
echo Starting Camera Scrape...
timeout 4 >nul
echo Scraping Cameras! Please wait. (A long time)
deno.exe run --allow-net crawler.js > crawled.txt
type crawled.txt
timeout 2 >nul
cls
echo Saved to Desktop!
timeout 1 >nul
move C:\CamScraper\crawled.txt*.* %userprofile%\desktop
timeout 3 >nul
del C:\CamScraper\crawled.txt
exit
:fullscrape
cls
mode con cols=52 lines=5
title Scraping...
echo Starting Camera Scrape...
timeout 4 >nul
echo Scraping Cameras! Please wait. (A long time)
deno.exe run --allow-net fullcrawl.js > crawled.txt
type crawled.txt
timeout 2 >nul
cls
echo Saved to Desktop!
timeout 1 >nul
move C:\CamScraper\crawled.txt*.* %userprofile%\desktop
timeout 3 >nul
del C:\CamScraper\crawled.txt
exit