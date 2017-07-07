USE [ProfilesRNS]
GO
/****** Object:  StoredProcedure [RDF.SemWeb].[UpdateHash2Base64]    Script Date: 2017/7/3 13:37:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [RDF.SemWeb].[UpdateHash2Base64]
	@FullUpdate BIT = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @FullUpdate = 1
		TRUNCATE TABLE [RDF.SemWeb].[Hash2Base64]
		
	DECLARE @StartNodeID BIGINT
	SELECT @StartNodeID = ISNULL((SELECT MAX(NodeID) FROM [RDF.SemWeb].[Hash2Base64]),-1)


	--- Insert a code to update the column ValueHash 
	Update [RDF.].Node
	SET ValueHash_Char = CONVERT(VARCHAR(1000), ValueHash, 1)
	--- End of modification

	INSERT INTO [RDF.SemWeb].[Hash2Base64] (NodeID, SemWebHash)
		SELECT NodeID, [RDF.SemWeb].[fnHash2Base64](ValueHash) SemWebHash
			FROM [RDF.].Node
			WHERE NodeID > @StartNodeID

END

