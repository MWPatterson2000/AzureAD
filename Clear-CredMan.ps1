# Define FileTypes
$fileTypes = (

".tbacct",
".tbacctpic1080x1080",
".tbacctpic208x208",
".tbacctpic424x424",
".tbacctpic64x64"

)

# Loop Through %LocalAppData%\Packages
Foreach ($fileType in $fileTypes){

    Get-Item -Path $env:LOCALAPPDATA\Packages\*\AC\TokenBroker\Accounts\*$fileType | Remove-Item -Force

    }

# Clear Credential Manager
$keys = cmdkey /list 
ForEach($key in $keys){
    if($key -like "*Target:*" -and $key -like "*office*"){
        cmdkey /del:($key -replace " ","" -replace "Target:","") | Out-Null

    }
}