Start-Transcript
$url = "https://getseq.net/Download/Begin?version=1.6.12"
$path = "E:\approot\bin\seq.msi"
$args = "/passive"
[Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
$webClient = new-object System.Net.WebClient
$webClient.DownloadFile( $url, $path )  >> downloadlog.txt

Start-Process `
    -file $path `
    -arg $args 

$seqlinstalldir = "D:\program files\seq\seq.exe"
$seqinstallcmd = "install"
$seqstartcmd = "start"

Start-Process `
    -file $seqlinstalldir `
    -arg $seqinstallcmd

Start-Process `
	-file $seqlinstalldir `
	-arg $seqstartcmd
Stop-Transcript