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
2.  error "Cannot insert duplicate key row in object 'RDF.SemWeb.Hash2Base64' with unique index 'idx_SemWebHash' The duplication key is the NULL.

```
First create a column in the [RDF.].Node ((char20)) then add following script to the procedure:

UPDATE [RDF.].Node
SET　ValueHash_Char = convert(varchar(1000),ValueHash,1)

(This script convert the binary data to the varchar which meet the [fnHash2Base64]'s constraint.)
```
