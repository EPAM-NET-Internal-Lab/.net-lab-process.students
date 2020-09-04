USE TicketManagement;
GO
CREATE PROCEDURE UpdateEvent
    @Id INT,
    @Name NVARCHAR(120),
    @Descr NVARCHAR(400),
    @LayoutId INT
AS
UPDATE Event SET [Name] = @Name, [Description] = @Descr, LayoutId = @LayoutId 
	WHERE Id = @Id 