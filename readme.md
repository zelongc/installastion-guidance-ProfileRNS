# A guidance to install the Profile RNS
## Author: Zelong Cong 

## Environment:
### windows 10 Enterprise Edition.
### MS SQL server 2014 enterprise edition

## common issues:

1.  Any 'Access denied' by the Integration Service:
```
Restart the database management studio as Adminstrator.
```
2.  Error "Cannot insert duplicate key row in object 'RDF.SemWeb.Hash2Base64' with unique index 'idx_SemWebHash' The duplication key is the NULL.

```
This is a bug happended in SQL Server 2014 enterprise. the procedure [RDF.][SemWeb].[UpdateHash2Base64] takes a 'Char' as input but we pass it a 'Binary'
So first we need to create a column in the [RDF.].Node ((char20)) This is used to store the HashValue in string.

Then change the stored procedure [RDF.][SemWeb].[UpdateHash2Base64]. overwrite it by the 'Replace_UpdateHash2Bse64.sql' in repo. (rename the original procedure for backup)
```
3. Couldn't find user IIS_IUSERS and IUSR.
```
Right click the folder contains binary website files -> Security -> Add -> Advanced -> Find Now add the user
```
4. The RDF and the Base URL crash. (happen quite frequently for configuration procedure reason..)

```
1. Go check the table [FrameWork].[parameter]. the BaseURI should end with a '/' the base Path should NOT! they should look like
BasePath http://localhost/profiles
BaseURI http://localhost/profiles/profile/

2. Then go check the table [RDF].[Node] run script:
SELECT TOP 100 FORM [RDF].[Node]
WHERE Value like '%localhost/profiles%'

You are expected to see some results like 'http://localhost/profiles/profile/2064' 
the part before the number(2064 for this row) should be consist with the BaseURI in [Framework].[parameter] table.

3. To recover from the crash: 

Execute the script 'change_Base_URI.sql' in repo. (Script offered by Brown, Nicholas William, modified by author)
Before executing this script. you have to understand the relationship between patameters and modify some of them to fit your own situation.

```

5. The co-author missing in the website.
```
Exectue the dailyjob stored in agent
```
6. The GoogleMap missing.
```
Apply the google api key 'https://developers.google.com/maps/documentation/javascript/'
go to /<yourWebRootFile>/Profile/Modules/NetworkMap/
Edit the NetworkMap.asp find this line:
<script type="text/javascript" src="//maps.googleapis.com/maps/api/js?sensor=false"></script>
Between the 'js?' and  the 'sensor=false....' insert the 'key=<the key you apply>&'

```

