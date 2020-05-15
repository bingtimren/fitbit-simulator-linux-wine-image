if [ -e "/root/.wine/drive_c/users/root/Local Settings/Application Data/Programs/@fitbitsimulator/Fitbit OS Simulator.exe" ]; 
  then wine "/root/.wine/drive_c/users/root/Local Settings/Application Data/Programs/@fitbitsimulator/Fitbit OS Simulator.exe" 
  else wine /fitbitos/fitbitos.exe
fi