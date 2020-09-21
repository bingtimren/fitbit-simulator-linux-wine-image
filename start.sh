if [ -e "/root/.wine/drive_c/users/root/Local Settings/Application Data/Programs/@fitbitsimulator/Fitbit OS Simulator.exe" ]; 
  then /opt/wine-lol/bin/wine "/root/.wine/drive_c/users/root/Local Settings/Application Data/Programs/@fitbitsimulator/Fitbit OS Simulator.exe" 
  else /opt/wine-lol/bin/wine /fitbitos/fitbitos.exe
fi