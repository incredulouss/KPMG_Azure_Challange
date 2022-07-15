# Problem Statement
We need to write code that will query the meta data of an instance within AWS/Azure/GCP and provide a json formatted output. The choice of language and implementation is up to you.

Bonus Points
The code allows for a particular data key to be retrieved individually
Hints
·         Aws Documentation (https://docs.aws.amazon.com/)
·         Azure Documentation (https://docs.microsoft.com/en-us/azure/?product=featured)
·         Google Documentation (https://cloud.google.com/docs)

# Approach followed by me
Cloud Provider Used - Microsoft Azure

Script - Powershell 

I am using Azure Instance Metadata Service (IMDS). It a REST API that's available at a well-known, non-routable IP address (169.254.169.254).
We can get all the metadata details of Azure instance ( Virtual Machine ) by the powershell script in the JSON format.

To achieve the bonus point ( particluar data key ) there is a varible called $dataKeyToretrive is used in the script. The user can give the desired key , and details of that will come as output in JSON format.

# Important Point
The Instance Metadata Service is only accessible from within a running virtual machine instance on a non-routable IP address.


