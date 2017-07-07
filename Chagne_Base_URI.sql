
-- This script is used to change the BaseURL of the software. sometimes you need custome your oldValue
-- rather than use the origin value stored in the [Framework].[Parameter]


declare @newPath nvarchar(max)

select @newPath = 'http://localhost/profiles'

 

declare @old nvarchar(max)

select @old = 'http://localhost/profiles/profile//'

--select @old = value from [Framework.].Parameter where parameterID = 'BaseURI'

 

declare @newURI nvarchar(max)

select @newURI = @newPath +'/profile/'


DECLARE              @return_value int

 

EXEC      @return_value = [Framework.].[ChangeBaseURI]

                                @oldBaseURI = @old,

                                @newBaseURI = @newURI

SELECT  'Return Value' = @return_value

 
update [Framework.].Parameter set Value = @newPath where ParameterID = 'basePath'