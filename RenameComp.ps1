#Name: Rename Computers
#Author: Dakota Gartley
#Created: 1/6/16

$SPAdmin = "DOMAIN\USERNAME" 
$Password = Get-Content C:\rename\securestring.txt | convertto-securestring 
$Credential = new-object -typename System.Management.Automation.PSCredential -argumentlist $SPAdmin, $Password 
Import-CSV -Path C:\rename\RenameComputers.csv | 
%{Rename-Computer -ComputerName $_.Name -NewName $_.NewName -DomainCredential $Credential}