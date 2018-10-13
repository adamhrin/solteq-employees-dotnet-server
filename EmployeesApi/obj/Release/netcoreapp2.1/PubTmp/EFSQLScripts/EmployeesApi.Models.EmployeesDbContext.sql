IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009131131_InitialCreate')
BEGIN
    CREATE TABLE [Employee] (
        [Id] int NOT NULL IDENTITY,
        [Name] varchar(50) NULL,
        [Email] varchar(50) NULL,
        [Phone] varchar(50) NULL,
        CONSTRAINT [PK_Employee] PRIMARY KEY ([Id])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009131131_InitialCreate')
BEGIN
    CREATE TABLE [YearSalary] (
        [Year] int NOT NULL,
        [Id_Employee] int NOT NULL,
        [Jan] real NULL,
        [Feb] real NULL,
        [Mar] real NULL,
        [Apr] real NULL,
        [May] real NULL,
        [Jun] real NULL,
        [Jul] real NULL,
        [Aug] real NULL,
        [Sep] real NULL,
        [Okt] real NULL,
        [Nov] real NULL,
        [Dec] real NULL,
        CONSTRAINT [PK_YearSalary] PRIMARY KEY ([Year], [Id_Employee]),
        CONSTRAINT [FK_YearSalary_ToEmployee] FOREIGN KEY ([Id_Employee]) REFERENCES [Employee] ([Id]) ON DELETE NO ACTION
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009131131_InitialCreate')
BEGIN
    CREATE INDEX [IX_YearSalary_Id_Employee] ON [YearSalary] ([Id_Employee]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009131131_InitialCreate')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20181009131131_InitialCreate', N'2.1.4-rtm-31024');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009160029_Migration1')
BEGIN
    DECLARE @var0 sysname;
    SELECT @var0 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Sep');
    IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var0 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Sep] int NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009160029_Migration1')
BEGIN
    DECLARE @var1 sysname;
    SELECT @var1 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Okt');
    IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var1 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Okt] int NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009160029_Migration1')
BEGIN
    DECLARE @var2 sysname;
    SELECT @var2 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Nov');
    IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var2 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Nov] int NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009160029_Migration1')
BEGIN
    DECLARE @var3 sysname;
    SELECT @var3 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'May');
    IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var3 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [May] int NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009160029_Migration1')
BEGIN
    DECLARE @var4 sysname;
    SELECT @var4 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Mar');
    IF @var4 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var4 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Mar] int NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009160029_Migration1')
BEGIN
    DECLARE @var5 sysname;
    SELECT @var5 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Jun');
    IF @var5 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var5 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Jun] int NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009160029_Migration1')
BEGIN
    DECLARE @var6 sysname;
    SELECT @var6 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Jul');
    IF @var6 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var6 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Jul] int NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009160029_Migration1')
BEGIN
    DECLARE @var7 sysname;
    SELECT @var7 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Jan');
    IF @var7 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var7 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Jan] int NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009160029_Migration1')
BEGIN
    DECLARE @var8 sysname;
    SELECT @var8 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Feb');
    IF @var8 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var8 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Feb] int NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009160029_Migration1')
BEGIN
    DECLARE @var9 sysname;
    SELECT @var9 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Dec');
    IF @var9 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var9 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Dec] int NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009160029_Migration1')
BEGIN
    DECLARE @var10 sysname;
    SELECT @var10 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Aug');
    IF @var10 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var10 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Aug] int NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009160029_Migration1')
BEGIN
    DECLARE @var11 sysname;
    SELECT @var11 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Apr');
    IF @var11 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var11 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Apr] int NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009160029_Migration1')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20181009160029_Migration1', N'2.1.4-rtm-31024');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009160327_Migration2')
BEGIN
    DECLARE @var12 sysname;
    SELECT @var12 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Sep');
    IF @var12 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var12 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Sep] real NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009160327_Migration2')
BEGIN
    DECLARE @var13 sysname;
    SELECT @var13 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Okt');
    IF @var13 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var13 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Okt] real NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009160327_Migration2')
BEGIN
    DECLARE @var14 sysname;
    SELECT @var14 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Nov');
    IF @var14 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var14 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Nov] real NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009160327_Migration2')
BEGIN
    DECLARE @var15 sysname;
    SELECT @var15 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'May');
    IF @var15 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var15 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [May] real NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009160327_Migration2')
BEGIN
    DECLARE @var16 sysname;
    SELECT @var16 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Mar');
    IF @var16 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var16 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Mar] real NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009160327_Migration2')
BEGIN
    DECLARE @var17 sysname;
    SELECT @var17 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Jun');
    IF @var17 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var17 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Jun] real NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009160327_Migration2')
BEGIN
    DECLARE @var18 sysname;
    SELECT @var18 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Jul');
    IF @var18 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var18 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Jul] real NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009160327_Migration2')
BEGIN
    DECLARE @var19 sysname;
    SELECT @var19 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Jan');
    IF @var19 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var19 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Jan] real NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009160327_Migration2')
BEGIN
    DECLARE @var20 sysname;
    SELECT @var20 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Feb');
    IF @var20 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var20 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Feb] real NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009160327_Migration2')
BEGIN
    DECLARE @var21 sysname;
    SELECT @var21 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Dec');
    IF @var21 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var21 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Dec] real NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009160327_Migration2')
BEGIN
    DECLARE @var22 sysname;
    SELECT @var22 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Aug');
    IF @var22 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var22 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Aug] real NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009160327_Migration2')
BEGIN
    DECLARE @var23 sysname;
    SELECT @var23 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Apr');
    IF @var23 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var23 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Apr] real NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009160327_Migration2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20181009160327_Migration2', N'2.1.4-rtm-31024');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181009161008_Migration3')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20181009161008_Migration3', N'2.1.4-rtm-31024');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181010193248_Migration4')
BEGIN
    DECLARE @var24 sysname;
    SELECT @var24 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Sep');
    IF @var24 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var24 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Sep] real NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181010193248_Migration4')
BEGIN
    DECLARE @var25 sysname;
    SELECT @var25 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Okt');
    IF @var25 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var25 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Okt] real NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181010193248_Migration4')
BEGIN
    DECLARE @var26 sysname;
    SELECT @var26 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Nov');
    IF @var26 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var26 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Nov] real NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181010193248_Migration4')
BEGIN
    DECLARE @var27 sysname;
    SELECT @var27 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'May');
    IF @var27 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var27 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [May] real NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181010193248_Migration4')
BEGIN
    DECLARE @var28 sysname;
    SELECT @var28 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Mar');
    IF @var28 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var28 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Mar] real NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181010193248_Migration4')
BEGIN
    DECLARE @var29 sysname;
    SELECT @var29 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Jun');
    IF @var29 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var29 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Jun] real NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181010193248_Migration4')
BEGIN
    DECLARE @var30 sysname;
    SELECT @var30 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Jul');
    IF @var30 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var30 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Jul] real NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181010193248_Migration4')
BEGIN
    DECLARE @var31 sysname;
    SELECT @var31 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Jan');
    IF @var31 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var31 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Jan] real NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181010193248_Migration4')
BEGIN
    DECLARE @var32 sysname;
    SELECT @var32 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Feb');
    IF @var32 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var32 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Feb] real NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181010193248_Migration4')
BEGIN
    DECLARE @var33 sysname;
    SELECT @var33 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Dec');
    IF @var33 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var33 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Dec] real NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181010193248_Migration4')
BEGIN
    DECLARE @var34 sysname;
    SELECT @var34 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Aug');
    IF @var34 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var34 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Aug] real NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181010193248_Migration4')
BEGIN
    DECLARE @var35 sysname;
    SELECT @var35 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[YearSalary]') AND [c].[name] = N'Apr');
    IF @var35 IS NOT NULL EXEC(N'ALTER TABLE [YearSalary] DROP CONSTRAINT [' + @var35 + '];');
    ALTER TABLE [YearSalary] ALTER COLUMN [Apr] real NOT NULL;
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20181010193248_Migration4')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20181010193248_Migration4', N'2.1.4-rtm-31024');
END;

GO

