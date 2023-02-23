

CREATE PROCEDURE [dbo].[SP_Bulk_Insert_Update_Assets]
    @AssetTableType dbo.AD_AssetTableType READONLY
AS
BEGIN
    MERGE INTO AD_Asset AS target
    USING @AssetTableType AS source
    ON (target.AssetID = source.AssetID)
    WHEN MATCHED THEN
        UPDATE SET
            target.Description = source.Description,
            target.DisplayName = source.DisplayName,
            target.DNSHostName = source.DNSHostName,
            target.Enabled = source.Enabled,
            target.EduDeviceType = source.EduDeviceType,
            target.Created = source.Created,
            target.IPv4Address = source.IPv4Address,
            target.IPv6Address = source.IPv6Address,
            target.isDeleted = source.isDeleted,
            target.LastLogonDate = source.LastLogonDate,
            target.Location = source.Location,
            target.LockedOut = source.LockedOut,
            target.logonCount = source.logonCount,
            target.ManagedBy = source.ManagedBy,
            target.Name = source.Name,
            target.OperatingSystem = source.OperatingSystem,
            target.OperatingSystemVersion = source.OperatingSystemVersion,
            target.PasswordExpired = source.PasswordExpired
    WHEN NOT MATCHED BY TARGET THEN
        INSERT (
            AssetID,
            Description,
            DisplayName,
            DNSHostName,
            Enabled,
            EduDeviceType,
            Created,
            IPv4Address,
            IPv6Address,
            isDeleted,
            LastLogonDate,
            Location,
            LockedOut,
            logonCount,
            ManagedBy,
            Name,
            OperatingSystem,
            OperatingSystemVersion,
            PasswordExpired
        ) VALUES (
            source.AssetID,
            source.Description,
            source.DisplayName,
            source.DNSHostName,
            source.Enabled,
            source.EduDeviceType,
            source.Created,
            source.IPv4Address,
            source.IPv6Address,
            source.isDeleted,
            source.LastLogonDate,
            source.Location,
            source.LockedOut,
            source.logonCount,
            source.ManagedBy,
            source.Name,
            source.OperatingSystem,
            source.OperatingSystemVersion,
            source.PasswordExpired
        );
END
