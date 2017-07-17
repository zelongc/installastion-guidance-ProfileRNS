## Night jobs

### The night job is marked as JobGroup=4 in the Database. it consists 3 procedures
#### 1.   EXEC [Profile.Import].[LoadProfilesData] 
#### 2.   EXEC [Framework.].[RunJobGroup] @JobGroup = 7
#### 3.   EXEC [Framework.].[RunJobGroup] @JobGroup = 3

### [LoadProfilesData]

- this is
