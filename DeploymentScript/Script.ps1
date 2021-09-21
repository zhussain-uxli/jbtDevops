param($host_name, $release_path, $clientId, $clientSecret, $tenantId)

$appId = $clientId
$azPwd = $clientSecret
$tenant = $tenantId
$pswd = $azPwd | ConvertTo-SecureString -AsPlainText -Force 
#$ErrorActionPreference = 'SilentlyContinue'

Write-Host "Host param is $host_name" -ForegroundColor Cyan
#$azCreds = Get-Credential
$azCreds = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $appId, $pswd
Connect-AzAccount -Credential $azCreds -TenantId $tenant -ServicePrincipal
$passwrd  = Get-AzKeyVaultSecret -VaultName "JbtDevopsKey" -Name "Password" -AsPlainText
Write-Host "Secret is $passwrd" -ForegroundColor Cyan
$secureStringPwd = ConvertTo-SecureString $passwrd -AsPlainText -Force 
$loginName = Get-AzKeyVaultSecret -VaultName "JbtDevopsKey" -Name "Username" -AsPlainText
#$loginName = $user_name
$SqlHostName = $host_name 
#$SqlHostName = Get-AzKeyVaultSecret -VaultName "JbtDevopsKey" -Name "Hostname" -AsPlainText 
$databaseName =  Get-AzKeyVaultSecret -VaultName "JbtDevopsKey" -Name "DBName" -AsPlainText
#$databaseName = $db_name
$login = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $loginName, $secureStringPwd
#$ScriptPath = Get-Location
$ScriptPath = $release_path
Write-Host "Path is $release_path" -ForegroundColor Cyan

$logfile = "$ScriptPath/executionlog.log"


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
