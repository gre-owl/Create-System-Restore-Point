#Create a system restore point to be used later in case a restore is needed if it fails after installing broken updates or making other harmful changes. 
#Note this does not work on Windows Server.

#Create OS variable and store win32 object caption inside
$os = Get-WmiObject Win32_OperatingSystem | Select-Object Caption;


#Error handling else create and name restore point 
if($os -like '*Server*') {
    $Host.UI.WriteErrorLine('System restore point was not created. System restore points are not supported on Windows Server.');
}else {
    Checkpoint-Computer -Description "Restore Point Name"
}