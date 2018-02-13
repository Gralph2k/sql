ALTER PROCEDURE [dbo].[ColumnsList]
@TableName varchar(128)=''
AS
BEGIN
 declare @r varchar(1000)='';

IF (SELECT COUNT(*) FROM  sys.all_objects AS o WITH(NOLOCK) where o.name=@TableName)=0 SET @TableName=@TableName+'_day'

select
  c.name
from sys.all_columns AS c WITH(NOLOCK), sys.all_objects AS o WITH(NOLOCK)
where
  c.object_id = o.object_id
  and o.name=@TableName
  and c.name not like 'id%'
  and c.name not in ('ComputerId', 'SessionId')
  and c.name not in ('Registered', 'RegisteredDate', 'RegisteredTime' )
  and c.name not in ('DurationAvgCalls', 'DurationAvg')
  and c.name not like '_%DurationAvgCalls'
  and c.name not in ('DurationMin')
  and c.name not like 'Duration[0-9]%'
  and c.name not in ('Quantity', 'Coefficient')
  and c.name not in ('Birthday','Cost','PayerId','Currency','OrderId','CreatedAt','DropMePlease')--'ServiceQuantity',
  and c.name not in ('UserPartition')
  and c.name not in ('RoundOurShare')
  and not(@TableName='VideoMovieEventsLog' and c.name in ('Duration','GroupId','IP','MovieId','OwnerId','UserId','OwnerMovieId','sid','ViewDuration'))
  and not(@TableName='MMPlayer' and c.name in ('Duration'))
  and not(@TableName='PresentEventsLog' and c.name in ('SenderId','ReceiverId','PresentId','HolidayId'))
  and not(@TableName='SpamComplaintsMetricStat_day' and c.name='Updated')
  and not(@TableName='AnalysisStat_day' and c.name='Updated')
  and not(@TableName='ApplicationAccess_new' and c.name='ApplicationTypeId')
  and not(@TableName='OkMobileAppExp' and c.name='OkMobileAppExpPartition')
  AND c.name NOT IN ('IsMobile','AppId')
union
SELECT c.name FROM sys.columns as c with(nolock), sys.views as v with(nolock)
   WHERE c.object_id = v.object_id
   AND c.name IN ( 'UniqueEmail', 'UniqueUserid')
   and v.name = @TableName+'_day'
union
select 'Rank'
       from sys.all_columns AS c WITH(NOLOCK), sys.all_objects AS o WITH(NOLOCK)
	  where c.object_id = o.object_id
	    and o.name = @TableName
        and c.name = 'DurationAvgCalls'
union
select LEFT(c.name, LEN(c.name) - 5)
       from sys.all_columns AS c WITH(NOLOCK), sys.all_objects AS o WITH(NOLOCK)
	  where c.object_id = o.object_id
	    and o.name = @TableName
        and (c.name = 'DurationAvgCalls' OR c.name LIKE 'Duration[0-9]%Calls' or c.name LIKE '_%DurationAvgCalls')
union
select 'UserIdAll'
       from sys.all_columns AS c WITH(NOLOCK), sys.all_objects AS o WITH(NOLOCK)
	  where c.object_id=o.object_id
        and o.name=@TableName
        and c.name not like 'id%'
        and c.name='UserId'
		and @TableName<>'VideoMovieEventsLog'
union
select 'AvgParam2'
       from sys.all_columns AS c WITH(NOLOCK), sys.all_objects AS o WITH(NOLOCK)
	  where c.object_id=o.object_id
        and o.name=@TableName
        and c.name='ID_WebGwtOperationsParam2'
union
select 'AvgParam1'
       from sys.all_columns AS c WITH(NOLOCK), sys.all_objects AS o WITH(NOLOCK)
	  where c.object_id=o.object_id
        and o.name=@TableName
        and c.name='ID_WebGwtOperationsParam1'
union
select 'Quantity'
       from sys.all_columns AS c WITH(NOLOCK), sys.all_objects AS o WITH(NOLOCK)
	  where c.object_id=o.object_id
        and o.name=@TableName
        and (c.name='ID_WebRoundtripOperationsCommand' or c.name='ID_ModeratorsStatObjectType')
union
select 'FileId'
       from sys.all_columns AS c WITH(NOLOCK), sys.all_objects AS o WITH(NOLOCK)
	  where c.object_id=o.object_id
        and o.name=@TableName
        and c.name='ID_AudioDownloadFileId'
UNION
SELECT 'CallsMinusFailures'
	FROM sys.all_columns AS c WITH(NOLOCK)
		JOIN sys.all_objects AS o WITH(NOLOCK)
			ON c.object_id = o.object_id
	WHERE o.name=@TableName AND @TableName='EJBEvents'
		AND c.name='Calls'
UNION
SELECT 'MailboxesAvg'
	FROM sys.all_columns AS c WITH(NOLOCK)
		JOIN sys.all_objects AS o WITH(NOLOCK)
			ON c.object_id = o.object_id
	WHERE o.name=@TableName AND @TableName IN ('MCAccessLogMailboxes_day','MRAccessLogMailboxes_day')
		AND c.name='Mailboxes'
UNION
SELECT 'DevicesAvg'
	FROM sys.all_columns AS c WITH(NOLOCK)
		JOIN sys.all_objects AS o WITH(NOLOCK)
			ON c.object_id = o.object_id
	WHERE o.name=@TableName AND @TableName IN ('MCAccessLogMailboxes_day','MRAccessLogMailboxes_day')
		AND c.name='Devices'
UNION
SELECT 'UnusedDivCalls'
    FROM sys.all_columns AS c WITH(NOLOCK)
		JOIN sys.all_objects AS o WITH(NOLOCK)
			ON c.object_id = o.object_id
	WHERE o.name=@TableName AND @TableName='MMTemplateVarsUsage'
		AND c.name='Calls'
UNION
SELECT 'Calls'
    FROM sys.all_columns AS c WITH(NOLOCK)
		JOIN sys.all_objects AS o WITH(NOLOCK)
			ON c.object_id = o.object_id
	WHERE o.name=@TableName AND @TableName='PresentEventsLog'
		AND c.name='PresentId'
UNION
SELECT 'Ratio'
	FROM sys.all_columns AS c WITH(NOLOCK)
		JOIN sys.all_objects AS o WITH(NOLOCK)
			ON c.object_id = o.object_id
	WHERE o.name=@TableName AND @TableName='FeedEventRatio'
		AND c.name='Value1'
UNION
SELECT 'bps'
	FROM sys.all_columns AS c WITH(NOLOCK)
		JOIN sys.all_objects AS o WITH(NOLOCK)
			ON c.object_id = o.object_id
	WHERE o.name=@TableName AND @TableName='NFStat'
		AND c.name='Seconds'
UNION
SELECT 'DistinctHosts'
	FROM sys.all_columns AS c WITH(NOLOCK)
		JOIN sys.all_objects AS o WITH(NOLOCK)
			ON c.object_id = o.object_id
	WHERE o.name=@TableName AND @TableName='MRLoggedEventsPerHost_day'
		AND c.name='ID_Host'
UNION
SELECT 'DistinctDevices'
	FROM sys.all_columns AS c WITH(NOLOCK)
		JOIN sys.all_objects AS o WITH(NOLOCK)
			ON c.object_id = o.object_id
	WHERE o.name=@TableName  and LEFT(@TableName,2) IN ('MR','MC')
		AND c.name='ID_DeviceID'
UNION
SELECT 'DistinctUDIDs'
	FROM sys.all_columns AS c WITH(NOLOCK)
		JOIN sys.all_objects AS o WITH(NOLOCK)
			ON c.object_id = o.object_id
	WHERE o.name=@TableName  and LEFT(@TableName,2) IN ('MR','MC')
		AND c.name='ID_UDID'
UNION
SELECT 'AmountAvg'
	FROM sys.all_columns AS c WITH(NOLOCK)
		JOIN sys.all_objects AS o WITH(NOLOCK)
			ON c.object_id = o.object_id
	WHERE o.name=@TableName AND @TableName = 'UserPresents'
		AND c.name='Amount'
UNION
SELECT 'CountAvgW'
	FROM sys.all_columns AS c WITH(NOLOCK)
		JOIN sys.all_objects AS o WITH(NOLOCK)
			ON c.object_id = o.object_id
	WHERE o.name=@TableName
		AND c.name='CountAvg'
UNION
SELECT 'FineId'
	FROM sys.all_columns AS c WITH(NOLOCK)
		JOIN sys.all_objects AS o WITH(NOLOCK)
			ON c.object_id = o.object_id
	WHERE o.name=@TableName
		AND c.name='FineId'
UNION
SELECT 'Amount'
	FROM sys.all_objects AS o WITH(NOLOCK)
	WHERE o.name=@TableName
	  AND @TableName='MMLogAppActionDiamondWallet'
order by 1;

END
