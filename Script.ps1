param($host_name)
$appId = "10ea3bbe-7c7f-4a06-8b9a-c558e5a996a1"
$azPwd = "q_S2_H1E3_lZ-vNN1zqfVSgT9AjAJ_6Q84"
$tenant = '5a934bcd-767d-410c-8570-d0977d20aaf4'
$pswd = $azPwd | ConvertTo-SecureString -AsPlainText -Force 
$ErrorActionPreference = 'SilentlyContinue'

Write-Host "Host param is $host_name" -ForegroundColor Cyan
#$azCreds = Get-Credential
$azCreds = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $appId, $pswd
Connect-AzAccount -Credential $azCreds -TenantId $tenant -ServicePrincipal
$passwrd  = Get-AzKeyVaultSecret -VaultName "JbtDevopsKey" -Name "Password" -AsPlainText
Write-Host "Secret is $passwrd" -ForegroundColor Cyan
$secureStringPwd = ConvertTo-SecureString $passwrd -AsPlainText -Force 
#$loginName = "synapse_admin"
$loginName = Get-AzKeyVaultSecret -VaultName "JbtDevopsKey" -Name "Username" -AsPlainText
$SqlHostName = $host_name 
#$SqlHostName = Get-AzKeyVaultSecret -VaultName "JbtDevopsKey" -Name "Hostname" -AsPlainText
#$databaseName = "synsqljbtdw" 
$databaseName =  Get-AzKeyVaultSecret -VaultName "JbtDevopsKey" -Name "DBName" -AsPlainText
#$login = Get-Credential -Message "Enter your SQL on-demand password" -UserName $loginName 
$login = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $loginName, $secureStringPwd
$ScriptPath = Get-Location
#$ScriptPath = "Release2.0"

$logfile = "$ScriptPath\executionlog_$processstarttime.log"


Start-Transcript -Path $logfile
  

foreach ($file in Get-ChildItem $ScriptPath -Filter "*.sql" -Recurse | Sort-Object -Property FullName) {
    try {
            Write-Host "****** PROCESSING $file FILE ******" -ForegroundColor Yellow
            #Invoke-DbaQuery -sqlinstance "localhost" -Database $databaseName -SqlCredential $login -File $file.FullName -EnableException
            Invoke-DbaQuery -SqlInstance $SqlHostName".sql.azuresynapse.net" -Database $databaseName -SqlCredential $login -File $file.FullName -EnableException

            Write-Host "******SUCCESSFULLY PROCESSED $file FILE ******" -ForegroundColor Green  
            Write-Host $("*" * 100) 
        }
    catch{
            Write-Host "******FAILED PROCESSING $file FILE ******" -ForegroundColor Red
            Write-Host $($Error[0].Exception.Message) -ForegroundColor Red
            Write-Host $("*" * 100)
            IF ($ContinueonException.IsPresent) {
                continue
            }
            else { throw }
    }
}

Write-Host "****** All Files Processed Successfully ******" -ForegroundColor Green
Stop-Transcript
