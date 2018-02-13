--DWHRU153
CREATE procedure [dbo].[Get_monthly_data] 
  @StartDate DATE,
  @GroupName VARCHAR(2000) = '',
  @HostName VARCHAR(2000) = '',
  @TableName VARCHAR(100),
  @ColumnName VARCHAR(100),
  @MaxValue FLOAT = null,
  @Norm INT = 0,
  @Days VARCHAR(100),
  @DaysPeriod INT = 0,
  @Weeks INT = 0,
  @Months INT,
  @Activity INT = 0,
  @Inverse INT = 0,
  @AccumulativeSum INT = 0,
  @GroupBy VARCHAR(1000),
  @AvgMax INT = 0,
  @Trend INT = 0,
  @Period VARCHAR(100) = 'Day',
  @MinValue FLOAT = 0,
  @Aggregation VARCHAR(100) = 'sum',
  @TopN VARCHAR(100) = '0',
  @FilterValue1  VARCHAR(MAX) = '', @FilterName1  VARCHAR(128) = '',
  @FilterValue2  VARCHAR(MAX) = '', @FilterName2  VARCHAR(128) = '',
  @FilterValue3  VARCHAR(MAX) = '', @FilterName3  VARCHAR(128) = '',
  @FilterValue4  VARCHAR(MAX) = '', @FilterName4  VARCHAR(128) = '',
  @FilterValue5  VARCHAR(MAX) = '', @FilterName5  VARCHAR(128) = '',
  @FilterValue6  VARCHAR(MAX) = '', @FilterName6  VARCHAR(128) = '',
  @FilterValue7  VARCHAR(MAX) = '', @FilterName7  VARCHAR(128) = '',
  @FilterValue8  VARCHAR(MAX) = '', @FilterName8  VARCHAR(128) = '',
  @FilterValue9  VARCHAR(MAX) = '', @FilterName9  VARCHAR(128) = '',
  @FilterValue10 VARCHAR(MAX) = '', @FilterName10 VARCHAR(128) = '',
  @FilterValue11 VARCHAR(MAX) = '', @FilterName11 VARCHAR(128) = '',
  @FilterValue12 VARCHAR(MAX) = '', @FilterName12 VARCHAR(128) = '',
  @FilterValue13 VARCHAR(MAX) = '', @FilterName13 VARCHAR(128) = '',
  @FilterValue14 VARCHAR(MAX) = '', @FilterName14 VARCHAR(128) = '',
  @FilterValue15 VARCHAR(MAX) = '', @FilterName15 VARCHAR(128) = '',
  @FilterValue16 VARCHAR(MAX) = '', @FilterName16 VARCHAR(128) = '',
  @FilterValue17 VARCHAR(MAX) = '', @FilterName17 VARCHAR(128) = '',
  @FilterValue18 VARCHAR(MAX) = '', @FilterName18 VARCHAR(128) = '',
  @FilterValue19 VARCHAR(MAX) = '', @FilterName19 VARCHAR(128) = '',
  @FilterValue20 VARCHAR(MAX) = '', @FilterName20 VARCHAR(128) = '',
  @FilterValue21 VARCHAR(MAX) = '', @FilterName21 VARCHAR(128) = '',
  @FilterValue22 VARCHAR(MAX) = '', @FilterName22 VARCHAR(128) = '',
  @FilterValue23 VARCHAR(MAX) = '', @FilterName23 VARCHAR(128) = '',
  @FilterValue24 VARCHAR(MAX) = '', @FilterName24 VARCHAR(128) = '',
  @FilterValue25 VARCHAR(MAX) = '', @FilterName25 VARCHAR(128) = '',
  @FilterValue26 VARCHAR(MAX) = '', @FilterName26 VARCHAR(128) = '',
  @FilterValue27 VARCHAR(MAX) = '', @FilterName27 VARCHAR(128) = '',
  @FilterValue28 VARCHAR(MAX) = '', @FilterName28 VARCHAR(128) = '',
  @FilterValue29 VARCHAR(MAX) = '', @FilterName29 VARCHAR(128) = '',
  @FilterValue30 VARCHAR(MAX) = '', @FilterName30 VARCHAR(128) = '',
  @FilterValue31 VARCHAR(MAX) = '', @FilterName31 VARCHAR(128) = '',
  @FilterValue32 VARCHAR(MAX) = '', @FilterName32 VARCHAR(128) = '',
  @FilterValue33 VARCHAR(MAX) = '', @FilterName33 VARCHAR(128) = '',
  @FilterValue34 VARCHAR(MAX) = '', @FilterName34 VARCHAR(128) = '',
  @FilterValue35 VARCHAR(MAX) = '', @FilterName35 VARCHAR(128) = '',
  @FilterValue36 VARCHAR(MAX) = '', @FilterName36 VARCHAR(128) = '',
  @FilterValue37 VARCHAR(MAX) = '', @FilterName37 VARCHAR(128) = '',
  @FilterValue38 VARCHAR(MAX) = '', @FilterName38 VARCHAR(128) = '',
  @FilterValue39 VARCHAR(MAX) = '', @FilterName39 VARCHAR(128) = '',
  @FilterValue40 VARCHAR(MAX) = '', @FilterName40 VARCHAR(128) = '',
  @FilterValue41 VARCHAR(MAX) = '', @FilterName41 VARCHAR(128) = '',
  @FilterValue42 VARCHAR(MAX) = '', @FilterName42 VARCHAR(128) = '',
  @FilterValue43 VARCHAR(MAX) = '', @FilterName43 VARCHAR(128) = '',
  @FilterValue44 VARCHAR(MAX) = '', @FilterName44 VARCHAR(128) = '',
  @FilterValue45 VARCHAR(MAX) = '', @FilterName45 VARCHAR(128) = '',
  @FilterValue46 VARCHAR(MAX) = '', @FilterName46 VARCHAR(128) = '',
  @FilterValue47 VARCHAR(MAX) = '', @FilterName47 VARCHAR(128) = '',
  @FilterValue48 VARCHAR(MAX) = '', @FilterName48 VARCHAR(128) = '',
  @FilterValue49 VARCHAR(MAX) = '', @FilterName49 VARCHAR(128) = '',
  @FilterValue50 VARCHAR(MAX) = '', @FilterName50 VARCHAR(128) = '',
  @FilterValue51 VARCHAR(MAX) = '', @FilterName51 VARCHAR(128) = '',
  @FilterValue52 VARCHAR(MAX) = '', @FilterName52 VARCHAR(128) = '',
  @FilterValue53 VARCHAR(MAX) = '', @FilterName53 VARCHAR(128) = '',
  @FilterValue54 VARCHAR(MAX) = '', @FilterName54 VARCHAR(128) = '',
  @FilterValue55 VARCHAR(MAX) = '', @FilterName55 VARCHAR(128) = '',
  @FilterValue56 VARCHAR(MAX) = '', @FilterName56 VARCHAR(128) = '',
  @FilterValue57 VARCHAR(MAX) = '', @FilterName57 VARCHAR(128) = '',
  @FilterValue58 VARCHAR(MAX) = '', @FilterName58 VARCHAR(128) = '',
  @FilterValue59 VARCHAR(MAX) = '', @FilterName59 VARCHAR(128) = '',
  @FilterValue60 VARCHAR(MAX) = '', @FilterName60 VARCHAR(128) = '',
  @FilterValue61 VARCHAR(MAX) = '', @FilterName61 VARCHAR(128) = '',
  @FilterValue62 VARCHAR(MAX) = '', @FilterName62 VARCHAR(128) = '',
  @FilterValue63 VARCHAR(MAX) = '', @FilterName63 VARCHAR(128) = '',
  @FilterValue64 VARCHAR(MAX) = '', @FilterName64 VARCHAR(128) = '',
  @FilterValue65 VARCHAR(MAX) = '', @FilterName65 VARCHAR(128) = '',
  @FilterValue66 VARCHAR(MAX) = '', @FilterName66 VARCHAR(128) = '',
  @FilterValue67 VARCHAR(MAX) = '', @FilterName67 VARCHAR(128) = '',
  @FilterValue68 VARCHAR(MAX) = '', @FilterName68 VARCHAR(128) = '',
  @FilterValue69 VARCHAR(MAX) = '', @FilterName69 VARCHAR(128) = '',
  @FilterValue70 VARCHAR(MAX) = '', @FilterName70 VARCHAR(128) = '',
  @FilterValue71 VARCHAR(MAX) = '', @FilterName71 VARCHAR(128) = '',
  @FilterValue72 VARCHAR(MAX) = '', @FilterName72 VARCHAR(128) = '',
  @FilterValue73 VARCHAR(MAX) = '', @FilterName73 VARCHAR(128) = '',
  @FilterValue74 VARCHAR(MAX) = '', @FilterName74 VARCHAR(128) = '',
  @FilterValue75 VARCHAR(MAX) = '', @FilterName75 VARCHAR(128) = '',
  @FilterValue76 VARCHAR(MAX) = '', @FilterName76 VARCHAR(128) = '',
  @FilterValue77 VARCHAR(MAX) = '', @FilterName77 VARCHAR(128) = '',
  @FilterValue78 VARCHAR(MAX) = '', @FilterName78 VARCHAR(128) = '',
  @FilterValue79 VARCHAR(MAX) = '', @FilterName79 VARCHAR(128) = '',
  @FilterValue80 VARCHAR(MAX) = '', @FilterName80 VARCHAR(128) = '',
  @FilterValue81 VARCHAR(MAX) = '', @FilterName81 VARCHAR(128) = '',
  @FilterValue82 VARCHAR(MAX) = '', @FilterName82 VARCHAR(128) = '',
  @FilterValue83 VARCHAR(MAX) = '', @FilterName83 VARCHAR(128) = '',
  @FilterValue84 VARCHAR(MAX) = '', @FilterName84 VARCHAR(128) = '',
  @FilterValue85 VARCHAR(MAX) = '', @FilterName85 VARCHAR(128) = '',
  @FilterValue86 VARCHAR(MAX) = '', @FilterName86 VARCHAR(128) = '',
  @FilterValue87 VARCHAR(MAX) = '', @FilterName87 VARCHAR(128) = '',
  @FilterValue88 VARCHAR(MAX) = '', @FilterName88 VARCHAR(128) = '',
  @FilterValue89 VARCHAR(MAX) = '', @FilterName89 VARCHAR(128) = '',
  @FilterValue90 VARCHAR(MAX) = '', @FilterName90 VARCHAR(128) = '',
  @FilterValue91 VARCHAR(MAX) = '', @FilterName91 VARCHAR(128) = '',
  @FilterValue92 VARCHAR(MAX) = '', @FilterName92 VARCHAR(128) = '',
  @FilterValue93 VARCHAR(MAX) = '', @FilterName93 VARCHAR(128) = '',
  @FilterValue94 VARCHAR(MAX) = '', @FilterName94 VARCHAR(128) = '',
  @FilterValue95 VARCHAR(MAX) = '', @FilterName95 VARCHAR(128) = '',
  @FilterValue96 VARCHAR(MAX) = '', @FilterName96 VARCHAR(128) = '',
  @FilterValue97 VARCHAR(MAX) = '', @FilterName97 VARCHAR(128) = '',
  @FilterValue98 VARCHAR(MAX) = '', @FilterName98 VARCHAR(128) = '',
  @FilterValue99 VARCHAR(MAX) = '', @FilterName99 VARCHAR(128) = '',
  @FilterValue100 VARCHAR(MAX) = '', @FilterName100 VARCHAR(128) = '',
  @Percent VARCHAR(1000) = '',
  @Multiplier FLOAT = 1,
  @GroupByExpression int = 0,
  @Seasonality int = 0,
  @TrendOnly int = 0
as 
begin
set nocount on
begin try
    set @StartDate = isnull(@StartDate, sysdatetime());
    declare @Date1 date;
    declare @date date, @min_date date;
    
    set @TableName = ltrim(rtrim(@TableName));
    declare @TableName1 varchar(max) = @TableName;
    declare @StartDate1 date = @StartDate;

    declare @UseBatchMode bit = 0
    declare @ComCS varchar(max)=''
    if @TableName like '%VideoMovieEventsLog%'
        set @UseBatchMode=1

    declare @AdjTab varchar(128) = @TableName

    declare @Filters dbo.Filters 
    insert into @Filters(name, value) 
    values(@FilterName1, @FilterValue1),(@FilterName2, @FilterValue2),(@FilterName3, @FilterValue3),(@FilterName4, @FilterValue4),
        (@FilterName5, @FilterValue5),(@FilterName6, @FilterValue6),(@FilterName7, @FilterValue7),(@FilterName8, @FilterValue8),
        (@FilterName9, @FilterValue9),(@FilterName10, @FilterValue10),(@FilterName11, @FilterValue11),(@FilterName12, @FilterValue12),
        (@FilterName13, @FilterValue13),(@FilterName14, @FilterValue14),(@FilterName15, @FilterValue15),(@FilterName16, @FilterValue16),
        (@FilterName17, @FilterValue17),(@FilterName18, @FilterValue18),(@FilterName19, @FilterValue19),(@FilterName20, @FilterValue20),
        (@FilterName21, @FilterValue21),(@FilterName22, @FilterValue22),(@FilterName23, @FilterValue23),(@FilterName24, @FilterValue24),
        (@FilterName25, @FilterValue25),(@FilterName26, @FilterValue26),(@FilterName27, @FilterValue27),(@FilterName28, @FilterValue28),
        (@FilterName29, @FilterValue29),(@FilterName30, @FilterValue30),(@FilterName31, @FilterValue31),(@FilterName32, @FilterValue32),
        (@FilterName33, @FilterValue33),(@FilterName34, @FilterValue34),(@FilterName35, @FilterValue35),(@FilterName36, @FilterValue36),
        (@FilterName37, @FilterValue37),(@FilterName38, @FilterValue38),(@FilterName39, @FilterValue39),(@FilterName40, @FilterValue40),
        (@FilterName41, @FilterValue41),(@FilterName42, @FilterValue42),(@FilterName43, @FilterValue43),(@FilterName44, @FilterValue44),
        (@FilterName45, @FilterValue45),(@FilterName46, @FilterValue46),(@FilterName47, @FilterValue47),(@FilterName48, @FilterValue48),
        (@FilterName49, @FilterValue49),(@FilterName50, @FilterValue50),(@FilterName51, @FilterValue51),(@FilterName52, @FilterValue52),
        (@FilterName53, @FilterValue53),(@FilterName54, @FilterValue54),(@FilterName55, @FilterValue55),(@FilterName56, @FilterValue56),
        (@FilterName57, @FilterValue57),(@FilterName58, @FilterValue58),(@FilterName59, @FilterValue59),(@FilterName60, @FilterValue60),
        (@FilterName61, @FilterValue61),(@FilterName62, @FilterValue62),(@FilterName63, @FilterValue63),(@FilterName64, @FilterValue64),
        (@FilterName65, @FilterValue65),(@FilterName66, @FilterValue66),(@FilterName67, @FilterValue67),(@FilterName68, @FilterValue68),
        (@FilterName69, @FilterValue69),(@FilterName70, @FilterValue70),(@FilterName71, @FilterValue71),(@FilterName72, @FilterValue72),
        (@FilterName73, @FilterValue73),(@FilterName74, @FilterValue74),(@FilterName75, @FilterValue75),(@FilterName76, @FilterValue76),
        (@FilterName77, @FilterValue77),(@FilterName78, @FilterValue78),(@FilterName79, @FilterValue79),(@FilterName80, @FilterValue80),
        (@FilterName81, @FilterValue81),(@FilterName82, @FilterValue82),(@FilterName83, @FilterValue83),(@FilterName84, @FilterValue84),
        (@FilterName85, @FilterValue85),(@FilterName86, @FilterValue86),(@FilterName87, @FilterValue87),(@FilterName88, @FilterValue88),
        (@FilterName89, @FilterValue89),(@FilterName90, @FilterValue90),(@FilterName91, @FilterValue91),(@FilterName92, @FilterValue92),
        (@FilterName93, @FilterValue93),(@FilterName94, @FilterValue94),(@FilterName95, @FilterValue95),(@FilterName96, @FilterValue96),
        (@FilterName97, @FilterValue97),(@FilterName98, @FilterValue98),(@FilterName99, @FilterValue99),(@FilterName100, @FilterValue100)
        
    exec Adjust_TableName @GroupName = @GroupName, @HostName = @HostName, @TableName = @TableName,
      @ColumnName = @ColumnName, @GroupBy = @GroupBy, @IsDailyReport=0, @Filters = @Filters,
      @out = @AdjTab OUTPUT
  
    set @TableName = @AdjTab

    declare @ClusterTableName nvarchar(200)
    if (@TableName = 'UserPresents' and ((@FilterName12 = 'ClusterName' and @FilterValue12 <> '') or @GroupBy = N'ClusterName')) or
        --(@TableName = 'PaymentRequest' and ((@FilterName7 = 'ClusterName' and @FilterValue7 <> '') or @GroupBy = N'ClusterName')) or
        (@TableName = 'MoneyTransaction_CustomerToService' and ((@FilterName5 = 'ClusterName' and @FilterValue5 <> '') or @GroupBy = N'ClusterName'))
  begin
      if @GroupBy = N'ClusterName' 
        select distinct @ClusterTableName = TableName
        from dwh..ClusterNameTables t(nolock)
        where id_clustername = 0
          and OriginalTableName = @TableName
      else  
        select distinct @ClusterTableName = TableName
        from dwh..ClusterNameTables t(nolock), ClusterName c(nolock)
        where t.ID_ClusterName = c.id 
          and name like '%'+ 
            case 
                when @TableName = 'UserPresents' then @FilterValue12
          when @TableName = 'PaymentRequest' then @FilterValue7
          when @TableName = 'MoneyTransaction_CustomerToService' then @FilterValue5 
        end + '%'
          and OriginalTableName = @TableName
    
      set @TableName = @ClusterTableName
    end

    if @AvgMax is null 
        set @AvgMax=0;
  
    declare @TableNameDay varchar(max) = @TableName;
    if exists 
        (
            select *
            from sys.objects
            where name = @TableName + '_day'
              and type in ('U', 'V')
        ) 
        and @AvgMax = 0 
    begin
        set @TableNameDay += '_day'
    end

    declare @sql nvarchar(max)
  
    set @Date1 = dateadd("m", -@Months, @StartDate);
    set @Date1 = dateadd("week", -@Weeks, @Date1);
    set @Date1 = dateadd("day", -@DaysPeriod, @Date1);
    declare @Date0 date = @Date1
    
    if @Seasonality = 1 and @Period = 'Month'
    begin
      set @Date1 = dateadd(month, -6, @Date1)
      set @StartDate = dateadd(month, 6, @StartDate)
      
      if @StartDate > sysdatetime()
        set @StartDate = sysdatetime()
    end
  
    declare @com varchar(max)='';
    declare @com_archive varchar(max)='';
    declare @com_reg varchar(max);
    declare @com_reg_archive varchar(max);
    declare @com_reg_time varchar(max);
    declare @com_host varchar(max);
    declare @com_filtr varchar(max), @com_filtr_sql varchar(max);
    declare @temp_com_filtr varchar(max)=''; 
    declare @communities varchar(100);
    declare @min_value float;

    declare @gr1 varchar(200);
    declare @gr2 varchar(200);

  if @TopN = '' and @GroupBy <> ''
    set @TopN='100';

    -- convert new-style parameters to named params if they are required in code later
    DECLARE @p_ModerationResultsStatType VARCHAR(2000) = ''
    DECLARE @p_ImageServerStatType VARCHAR(2000) = ''
    DECLARE @p_ImageServerOperationClass VARCHAR(2000) = '' 
    DECLARE @p_InternalLikeOperationsOperation VARCHAR(2000) = ''
    DECLARE @p_InternalLikeOperationsType VARCHAR(2000) = ''
    DECLARE @p_PresentPaid VARCHAR(2000) = ''

    -- all tables do not need this
    IF @TableName IN ('ModerationResultsStat','InternalLikeOperations','ImageServerOperation','ImageServerStat','UserPresents') 
    BEGIN 
        -- table specific actions
        IF @TableName = 'ModerationResultsStat' 
        BEGIN
          IF EXISTS(
            SELECT 1 
            FROM @Filters 
            WHERE name = 'ModerationResultsStatType' AND value <> ''
          )
            SELECT @p_ModerationResultsStatType = value 
            FROM @Filters
            WHERE name = 'ModerationResultsStatType'
        END
  
        IF @TableName = 'ImageServerStat' 
        BEGIN
          IF EXISTS(
            SELECT 1 
            FROM @Filters 
            WHERE name = 'ImageServerStatType'  AND value <> ''
          )
            SELECT @p_ImageServerStatType = value 
            FROM @Filters
            WHERE name = 'ImageServerStatType'
        END
  
        IF @TableName = 'ImageServerOperation' 
        BEGIN
          IF EXISTS(
            SELECT 1 
            FROM @Filters 
            WHERE name = 'ImageServerOperationClass' AND value <> ''
          )
            SELECT @p_ImageServerOperationClass = value 
            FROM @Filters
            WHERE name = 'ImageServerOperationClass'
        END
      
        IF @TableName = 'InternalLikeOperations' 
        BEGIN
          IF EXISTS(
            SELECT 1 
            FROM @Filters 
            WHERE name = 'InternalLikeOperationsOperation' AND value <> ''
          )
            SELECT @p_InternalLikeOperationsOperation = value 
            FROM @Filters
            WHERE name = 'InternalLikeOperationsOperation'
    
          IF EXISTS(
            SELECT 1 
            FROM @Filters 
            WHERE name = 'InternalLikeOperationsType' AND value <> ''
          )
            SELECT @p_InternalLikeOperationsType = value 
            FROM @Filters
            WHERE name = 'InternalLikeOperationsType'     
        END
      
        IF @TableName = 'UserPresents' BEGIN
          IF EXISTS(
            SELECT 1 
            FROM @Filters 
            WHERE name = 'PresentPaid' AND value <> ''
          )
            SELECT @p_PresentPaid = value 
            FROM @Filters
            WHERE name = 'PresentPaid'
        END
    END -- of new/old param conversion 

    if @Period = 'Day'
    begin
        set @gr1 = 'DATEPART(DAY,REGISTERED) day,DATEPART(MONTH,REGISTERED) month,DATEPART(YEAR,REGISTERED) year,'
        set @gr2='DATEPART(DAY,REGISTERED),DATEPART(MONTH,REGISTERED),DATEPART(YEAR,REGISTERED)'
    end;
    
    if @Period = 'Week'
    begin
        set @gr1 = 'DATEPART(week,REGISTERED) day,DATEPART(year,REGISTERED) month,DATEPART(year,REGISTERED) year,'
        set @gr2 = 'DATEPART(week,REGISTERED),DATEPART(year,REGISTERED),DATEPART(year,REGISTERED)'
    end;
    
    if @Period = 'Month'
    begin
        set @gr1='DATEPART(month,REGISTERED) day,DATEPART(Quarter,REGISTERED) month,DATEPART(year,REGISTERED) year,'
        set @gr2='DATEPART(month,REGISTERED),DATEPART(Quarter,REGISTERED),DATEPART(year,REGISTERED)'
    end;
    
    if @Period = 'Quarter'
    begin
        set @gr1='DATEPART(Quarter,REGISTERED) day,DATEPART(year,REGISTERED) month,DATEPART(year,REGISTERED) year,'
        set @gr2='DATEPART(Quarter,REGISTERED),DATEPART(year,REGISTERED),DATEPART(year,REGISTERED)'
    end;
    
    if @Period = 'Year'
    begin
        set @gr1='DATEPART(year,REGISTERED) day,DATEPART(year,REGISTERED) month,DATEPART(year,REGISTERED) year,'
        set @gr2='DATEPART(year,REGISTERED),DATEPART(year,REGISTERED),DATEPART(year,REGISTERED)'
    end;

    declare @time_period varchar(20)=@period;

    if @Period = 'Day' 
    begin
        set @time_period='Date';
    end;
 
    begin try 
        create table #temp_dummy(
            registered smalldatetime,
            day varchar(450),
            month int,
            year int,
            name nvarchar(max) collate Cyrillic_General_CI_AS,
            avg float);
        create index [iu_#temp_dummy] on #temp_dummy(registered) include(name);
    end try
    begin catch
        truncate table #temp_dummy;
    end catch;

    if @AvgMax != 0
    begin
        begin try 
            alter table #temp_dummy add max bigint;
        end try
        begin catch
        end catch;
    end

    begin try 
        create table #temp_dummy2(
            registered smalldatetime,
            day nvarchar(450),
            month int,
            year int,
            name nvarchar(1000) collate Cyrillic_General_CI_AS,
            avg float);

        create nonclustered index [IX_temp_dummy22] ON #temp_dummy2 (day ASC);
        create nonclustered index [IX_temp_dummy23] ON #temp_dummy2 (registered asc);  
    end try
    begin catch
        truncate table #temp_dummy2;
    end catch;

    begin try 
        create table #temp_dummy3(
            registered smalldatetime,
            day nvarchar(1000),
            month int,
            year int,
            name nvarchar(1000) collate Cyrillic_General_CI_AS,
            avg float,
            rownumber int);
    end try
    begin catch
        truncate table #temp_dummy3;
    end catch; 

    begin try 
        create table #temp_day(registered date);
        create clustered index [IX_temp_5min_registered] ON #temp_day (registered ASC);
    end try
    begin catch
        truncate table #temp_day;
    end catch;

    declare @return_value varchar(max), 
            @rez tinyint, 
            @servername varchar(100), 
            @dbname varchar(100), 
            @year int
  
    begin try
        create table #temp_archive(year int, servername varchar(100), dbname varchar(100))
    end try
    begin catch
        truncate table #temp_archive
    end catch
 
    declare @interval_count int=0;

    if (@MaxValue=null) or (@MaxValue is null) or (@MaxValue=0)
    begin
        set @MaxValue=1000000000000;
    end;
  
    if 1 != 1 
    begin
        select registered, day, month, year, name, avg 
        from _dummy;
    end
  
    set @com_filtr = '';
    set @year = year(@Date1)

    while @year <= year(@StartDate)
    begin
        set @dbname = null
        set @servername = null
        exec admin.dbo.check_DataParameters @mark = 'archive db', @parameter_name_1 = 'Year', @parameter_value_1 = @year, 
                                            @return_value = @return_value output, @rez = @rez output
  
        if @rez = 1
            set @dbname = @return_value
        
        exec admin.dbo.check_DataParameters @mark = 'archive server', @parameter_name_1 = 'Year', @parameter_value_1 = @year, 
                                            @return_value = @return_value output, @rez = @rez output
  
        if @rez = 1
            set @servername = @return_value
  
        if @dbname is not null and @servername is not null
            merge into #temp_archive t
            using (select @year year, @servername servername, @dbname dbname) s
                on (t.year = s.year)
            when not matched then
                insert values (s.year, s.servername, s.dbname);
  
        set @year += 1
    end

    set @com_reg = ' AND (registered>=''' + convert(varchar, @Date1,21) +
      ''' and registered<''' + convert(varchar, @StartDate,21) + ''')';

    set @com_reg_time = ' AND (t.date>=''' + convert(varchar, @Date1,21) +
      ''' and t.date<'''+CONVERT(varchar, @StartDate,21)+''')';     
 
    execute dbo.get_filtr @TableName, @HostName, @GroupName, @Inverse, @temp_com_filtr output, @Filters

    set @com_filtr += @temp_com_filtr
    set @com_filtr_sql = ''
    set @temp_com_filtr = ''
 
    execute dbo.get_filtr @TableName, @HostName, @GroupName, @Inverse, @temp_com_filtr output, @Filters, 1

    set @com_filtr_sql += @temp_com_filtr
    
    set @TableName = @TableNameDay
 
    declare @DecodeName varchar(max)

    if isnull(@GroupByExpression, 0) = 1
    begin
        declare @DecodeValue varchar(max)
        set @DecodeValue = 
            case @GroupBy
                when 'Group' then @GroupName
                when 'Host' then @HostName
            end
        
        if @DecodeValue is null
        begin
            select @DecodeValue = value
            from @Filters
            where dwh.dbo.Decode_ParamName(@TableName1, name) = @GroupBy
        end

        if @DecodeValue is null
            set @DecodeValue = ''        
    
        set @DecodeValue = replace(@DecodeValue, '''', '''''')
     
        declare @Val varchar(max)
        declare @InverseVal int
        set @InverseVal = @Inverse
        while SUBSTRING(@DecodeValue,1,1) = '!'
        begin
            set @InverseVal = case when @InverseVal = 0 then 1 else 0 end
            set @DecodeValue = substring(@DecodeValue, 2, len(@DecodeValue) - 1)
        end
     
        if @InverseVal = 1 
            set @DecodeName = 'case when name=name then ''!' + @DecodeValue + ''' end'
        else
        begin
            set @DecodeName = 'case '
          declare group_cursor cursor for
          select Param 
          from fn_MVParam_advanced(replace(@DecodeValue, ', ', ','), ',', '{', '}');
       
          open group_cursor;
          fetch next from group_cursor into @Val;
      
            while @@fetch_status = 0 
        begin
            set @DecodeName = @DecodeName + 'when name like ''' + @Val + ''' then ''' + @Val + ''' '
            fetch next from group_cursor into @Val;
          end

          close group_cursor
          deallocate group_cursor
        
          set @DecodeName = @DecodeName + 'end'
        end
    end
    else 
        set @DecodeName = ''
 
    if @DecodeValue is null or @DecodeValue = '' 
        set @DecodeName = ''

    declare @nameColumn varchar(max) =
    case 
        when ltrim(rtrim(@GroupBy)) <> '' and @DecodeName <> '' then @DecodeName + ' name'
        when ltrim(rtrim(@GroupBy)) <> '' and @DecodeName = '' then ' name'
        else '''_'' name'
    end

    declare @groupByTablePostfix varchar(1000) =
    case 
        when ltrim(rtrim(@GroupBy)) <> '' then '_' + @GroupBy
        else ''
    end
    
    declare @groupByColumn varchar(max) = 
    case 
        when ltrim(rtrim(@GroupBy)) <> '' and @DecodeName <> '' then ', ' + @DecodeName
        when ltrim(rtrim(@GroupBy)) <> '' and @DecodeName = '' then ', name'
        else ''
    end   

    declare @callsColumn varchar(1000);
    declare @durationColumn varchar(1000);

    if @AvgMax = 0
    begin
        set @com = 'insert into #temp_dummy (registered, day, month, year, name, avg)
                    select registered, day, month, year, name, case when avg > ' + cast(@MaxValue as varchar)+' then ' + cast(@MaxValue as varchar)+' else avg end avg ' 

        if @ColumnName in ('DurationMin', 'DurationMax')
        begin
            set @durationColumn =
            case
                when @ColumnName = 'DurationMin' then 'min(DurationMin)'
                when @ColumnName = 'DurationMax' then 'max(DurationMax)'
            end

            if @Multiplier <> 1
                set @durationColumn += ' * ' + cast(@Multiplier as varchar)

          set @com += 
                'from 
                (
                    select registered, ' + @gr1 + ' name, duration as avg 
                    from 
                    (
                        select 
                            t.' + @time_period + '_from registered, ' +
                            @durationColumn + ' as duration, ' +
                          @nameColumn +
                            ', sum(cast(Calls as bigint)) Calls
                        from dbo.' + @TableName + @groupByTablePostfix + '_v s with (nolock, forceseek), dwh.dbo.time t
                        where registered >= t.' + @time_period + '_from 
                          and registered < t.' + @time_period + '_to 
                          XY^&*
                          and t.date = t.' + @time_period + '_from' + @com_reg_time + @com_filtr +
                       'group by t.' + @time_period + '_from' + @groupByColumn +
                  ' ) a
                )aa';
        end;
        else if @ColumnName in ('DurationAvg', 'AmountAvg', 'CountAvgW') OR @ColumnName LIKE 'Duration[0-9]%'
        begin
            set @callsColumn =
                case
                    when @ColumnName = 'AmountAvg' then 'sum(case when id_okprice between 1 and 127 then Calls else 0 end) as calls'
                    else 'sum(cast(Calls as bigint)) as calls'
                end
            
            set @durationColumn =
                case
                    when @ColumnName = 'AmountAvg' then 'sum(Amount) '
                    when @ColumnName = 'CountAvgW' then 'sum(CountAvg*cast(Calls as bigint))'
                    else 'sum(' + @ColumnName + 'Calls)'
                end
            
            if @Multiplier <> 1
                set @durationColumn += ' * ' + cast(@Multiplier as varchar)

            set @com += 
                'from 
                (
                    select registered, ' + @gr1 + ' name, (duration * 1.0)/calls as avg 
                    from 
                    (
                        select 
                            t.' + @time_period + '_from registered, ' +
                            @nameColumn + ', ' +
                            @durationColumn + ' duration, ' +                             
                          @callsColumn +                              
                      ' from dbo.' + @TableName + @groupByTablePostfix + '_v s with (nolock, forceseek), dwh.dbo.time t
                        where calls > 0 
                          and registered >= t.' + @time_period + '_from 
                          and registered < t.'+@time_period+'_to 
                          XY^&*
                          and t.date=t.' + @time_period + '_from' + @com_reg_time + @com_filtr +
                    ' group by t.' + @time_period + '_from' + @groupByColumn +
                 ' ) a
                )aa';
        end;
        else if @ColumnName in ('Param2Avg') 
        begin
            set @com += 
              'from 
              (
                  select registered, day, month, year, name, (duration * 1.0)/calls as avg 
                  from 
                  (
                      select 
                          t.' + @time_period + '_from AS registered, ' 
                          + @gr1 
                          + @nameColumn
                          + ', sum(Param2AvgCalls) * ' + cast(@Multiplier as varchar)+' as duration'                            
                          + ', sum(cast(Calls as bigint)) as Calls 
                      from dbo.' + @TableName + @groupByTablePostfix + '_v As s with (nolock, forceseek), dwh.dbo.time AS t 
                      where Calls > 0 
                        and registered >= t.' + @time_period + '_from 
                        and registered < t.' + @time_period  + '_to 
                        XY^&* 
                        and t.date = t.' + @time_period + '_from' + @com_reg_time + @com_filtr +
                   ' group by t.' + @time_period + '_from, ' + @gr2 + @groupByColumn +
                 ' ) a
                 )aa'
        end
        else if @ColumnName in ('Rank')
        begin
            set @com += 
                'from 
                (
                    select registered, ' + @gr1 + ' name, duration as avg 
                    from 
                    (
                        select 
                            t.' + @time_period + '_from registered, ' + 
                            @nameColumn +
                            ', sum(DurationAvgCalls) * ' + cast(@Multiplier as varchar)+' Duration 
                        from dbo.' + @TableName + @groupByTablePostfix + '_v s with (nolock, forceseek), dwh.dbo.time t
                        where registered >= t.' + @time_period + '_from 
                          and registered < t.'+@time_period + '_to 
                          XY^&*
                          and t.date = t.' + @time_period + '_from' + @com_reg_time + @com_filtr +
                     ' group by t.' + @time_period + '_from' + @groupByColumn +
                   ' ) a
                )aa';
            end;
        else if @ColumnName IN ('Param2AvgCalls') 
        begin
            set @com += 
              'from 
              (
                  select registered, day, month, year, name, duration as avg 
                  from 
                  (
                      select 
                          t.' + @time_period + '_from as registered, ' +
                          @gr1 +
                          ' sum(Param2AvgCalls) * ' + cast(@Multiplier AS varchar) + ' as duration, ' +
                          @nameColumn +
                     'from dbo.' + @TableName + @groupByTablePostfix + '_v as s with (nolock, forceseek), dwh.dbo.time as t 
                      where registered >= t.' + @time_period + '_from 
                        and registered < t.' + @time_period + '_to XY^&* 
                        and t.date=t.' + @time_period + '_from' + @com_reg_time + @com_filtr +
                    ' group by t.' + @time_period + '_from, ' + @gr2 + @groupByColumn
              + ' ) a
              )aa'
        end
        else if @ColumnName in ('AvgParam1')
        begin
            set @durationColumn = 
            '(
                select case when patindex(''%[^0-9]%'',name) = 0 then convert(bigint, name) else 0 end 
                from dwh.dbo.WebGwtOperationsParam1 
                where ID = id_WebGwtOperationsParam1
            ) * calls'

            set @com += 
                'from 
                (
                    select registered, ' + @gr1 + ' name , sum(avg)/sum(cast(calls as bigint)) avg 
                    from 
                    (
                        select 
                            t.' + @time_period + '_from registered, ' +
                            @nameColumn + 
                            @durationColumn + ' as avg,
                            calls
                        from dbo.' + @TableName + @groupByTablePostfix + '_v s with (nolock, forceseek), dwh.dbo.time (nolock) t
                        where registered >= t.' + @time_period + '_from 
                          and registered < t.'+@time_period + '_to 
                          XY^&*
                          and t.date = t.' + @time_period + '_from' + @com_reg_time + @com_filtr +
                   ') k group by registered, ' + @gr2 + ', name
                ) aa';
        end
        else if @TableName = 'UserPresents' and @p_PresentPaid !='' and @GroupBy = 'Present'
        begin
            set @durationColumn = 'sum(' + @ColumnName + ')'
                
            if @Multiplier <> 1
                set @durationColumn += ' * ' + cast(@Multiplier as varchar)

          set @com +=
              'from 
            (
                select registered, ' + @gr1 + ' name, sum(avg) avg 
                from 
                (
                    select
                        t.' + @time_period + '_from registered, ' +
                        @nameColumn + ', ' +
                            @durationColumn + ' as avg ' +
                      ' from dbo.' + @TableName + @groupByColumn + '_f 
                          (''' + convert(varchar, @Date1,21)+ ''', ''' + convert(varchar, @StartDate,21)+''') s with (nolock, forceseek), dwh.dbo.time t
                      where registered >= t.'+@time_period+'_from 
                            and registered<t.'+@time_period+'_to 
                          XY^&*
                          and t.date = t.' + @time_period + '_from' + @com_reg_time + @com_filtr +
                      ' group by t.' + @time_period + '_from' + @groupByColumn +
                ') k group by registered, ' + @gr2 + ', name
                ) aa';
        end
        else if @UseBatchMode = 1
        begin
            --Даты начала/конца периода
          declare @paramDefinition nvarchar(max),@CSFrom datetime,@CSTo datetime     
          set @sql='select @CSFrom=MIN('+@time_period + '_from), @CSTo=MAX('+@time_period + '_to) 
                      from dwh.dbo.time t 
                where 1=1 '+ @com_reg_time
          set @paramDefinition='@CSFrom datetime output, @CSTo datetime output'
          exec sp_executesql @sql, @paramDefinition, @CSFrom=@CSFrom OUTPUT, @CSTo=@CSTo OUTPUT

            set @durationColumn  =
            case 
                when @ColumnName = 'CallsMinusFailures' then 'sum(case when calls >= failures then calls - failures else 0 end)'
                when @TableName ='MMTemplateVarsUsage_day' and @ColumnName = 'UnusedDivCalls' then 'cast(sum(unused) as float) / sum(calls)' 
                when @TableName ='VideoMovieEventsLog' and @ColumnName = 'Calls' then 'count(1)'
                when @TableName = 'PresentEventsLog' and @ColumnName = 'Calls' then 'count(1)'
                when @TableName IN ('MCAccessLogMailboxes_day','MRAccessLogMailboxes_day') and @ColumnName = 'MailboxesAvg' then 'convert(float, sum(mailboxes)) / sum(devices)'                        
        when @TableName IN ('MCAccessLogMailboxes_day','MRAccessLogMailboxes_day') and @ColumnName = 'DevicesAvg' then 'convert(float, sum(Devices)) / sum(mailboxes)'                        
                else 'sum(' + @ColumnName + ')'
            end

            if @Multiplier <> 1
                set @durationColumn += ' * '  + cast(@Multiplier as varchar)

            declare @InSQL varchar(max), 
                @NewLine varchar(2)=CHAR(13)+CHAR(10)
            set @InSQL='(   ' + @NewLine +
                      '  select 
                                cast(s.registered as date) registered, ' +
                                @nameColumn  + ', ' +
                                @durationColumn + ' avg' + @NewLine+
                '    from [dbo].' + @TableName + @groupByTablePostfix + '_v S with (nolock)' + @NewLine +
                    '    where s.Registered>='''+CONVERT(VARCHAR(50),@CSFrom,120)+ ''''  +@NewLine+
                  '      and s.Registered<'''+CONVERT(VARCHAR(50),@CSTo,120)+ ''''  +@NewLine+
                  '     ' + @com_filtr + @NewLine+
          '     XX_TEMPDAY_XX '+@NewLine+
                  '    group by cast(s.registered as date)' + @groupByColumn +
                ' ) s'

          set @comCS = 
                'from 
                (
                select registered, ' + @gr1 + ' name, sum(avg) avg 
                    from 
                    (' + @NewLine +
                       ' select t.' + @time_period + '_from registered, name, SUM(Avg) Avg'+@NewLine+
                     ' from '+@InSQL+@NewLine+
               '       ,dwh.dbo.time t '+@NewLine+
               ' where s.registered>=t.' + @time_period + '_from '+@NewLine+
               '   and s.registered<t.' + @time_period + '_to '+@NewLine+
               '  XY^&*'+@NewLine+
               '   and t.date=t.' + @time_period + '_from '+ @com_reg_time+@NewLine+ 
               '  group by t.' + @time_period + '_from, s.name'+@NewLine+ 
            ' ) k' +@NewLine+
        ' group by registered, ' + @gr2 + ',name) aa '+@NewLine;

          set @Com += @ComCS
        end
        else
        begin
            set @durationColumn  =
            case 
                when @ColumnName = 'FileID' then 'count(distinct ID_AudioDownloadFileId)'  
                when @ColumnName = 'DistinctHosts' then 'count(distinct ID_Host)'
                when @ColumnName = 'DistinctDevices' then 'count(distinct ID_DeviceID)'
                when @ColumnName = 'DistinctUDIDs' then 'count(distinct ID_UDID)'
                when @ColumnName = 'UserIDAll' then 'count(1)'
                when @ColumnName in ('UserID', 'UniqueEmail', 'CookieId', 'UniqueUserId','UniqueUserMID','UniqueUserVID',
                      'SenderUserID', 'ReceiverUserID', 'SenderID', 'InternalLikeOperationsEntity') then 'count(distinct ' + @ColumnName + ')'
                when @ColumnName = 'CallsMinusFailures' then 'sum(case when calls >= failures then calls - failures else 0 end)'
                when @TableName ='MMTemplateVarsUsage_day' and @ColumnName = 'UnusedDivCalls' then 'cast(sum(unused) as float) / sum(calls)' 
                when @TableName ='VideoMovieEventsLog' AND @ColumnName = 'Calls' then 'count(1)'
                when @TableName = 'PresentEventsLog' AND @ColumnName = 'Calls' then 'count(1)'
                when @TableName IN ('MCAccessLogMailboxes_day','MRAccessLogMailboxes_day') AND @ColumnName = 'MailboxesAvg' then 'convert(float, sum(mailboxes)) / sum(devices)'                        
                when @TableName IN ('MCAccessLogMailboxes_day','MRAccessLogMailboxes_day') AND @ColumnName = 'DevicesAvg' then 'convert(float, sum(devices)) / sum(mailboxes)'                        
                when @TableName like 'UserActivityByPlatform%' then 
                  case when @ColumnName = 'calls'
                    then 'sum(cast(calls as bigint))'
                    else 'sum(' + @ColumnName + ')'
                  end
                else 
                  case when @ColumnName = 'calls'
                    then @aggregation + '(cast(calls as bigint))'
                    else @aggregation + '(cast(' + @ColumnName + ' as bigint))'
                  end

            end

            if @Multiplier <> 1
                set @durationColumn += ' * '  + cast(@Multiplier as varchar)

          set @com +=
                'from 
                (
                    select registered, ' + @gr1 + ' name, sum(duration) as avg 
                    from 
                    (
                        select 
                            t.' + @time_period + '_from as registered, '
                            + @nameColumn + ', '
                            + @durationColumn + ' as duration '                           
                  + ' from dbo.' + @TableName + @groupByTablePostfix + '_v s with (nolock, forceseek), dwh.dbo.time t
                        where registered >= t.' + @time_period + '_from 
                            and registered < t.' + @time_period + '_to' 
                        + ' XY^&*'
                        + 'and t.date = t.' + @time_period + '_from' + @com_reg_time + @com_filtr
                    + ' group by t.' + @time_period + '_from' + @groupByColumn
              + ' ) k group by registered, ' + @gr2 + ',name
              ) aa';
        end

        set @com += ' order by 4, 3, 2 '
    end
    else
    begin
        set @com = 'insert into #temp_dummy (day, month, year, name, avg, max)
            select day, month, year, ''_'', 
                case when avg > ' + cast(@MaxValue as varchar) + ' then ' + cast(@MaxValue as varchar) + ' else avg end avg,
                case when max > ' + cast(@MaxValue as varchar) + ' then ' + cast(@MaxValue as varchar) + ' else max end max '

        if @ColumnName in ('DurationAvg', 'ParamAvg') or @ColumnName like 'Duration[0-9]%'
        begin                
            set @com += 
                'from 
                (
                    select ' + @gr1 + ' avg(p_avg/p_calls) as avg, max(p_max) as max 
                    from 
                    (
                        select 
                            convert(date, registered) registered,
                            sum(' + @ColumnName + 'Calls) p_avg,
                            sum(calls) p_calls,
                            max(DurationMax) p_max
                        from dbo.' + @TableName + ' s with (nolock, forceseek)
                        where 1 = 1 ' + @com_reg + @com_filtr +
                       'group by convert(date, registered) 
                    ) k group by ' + @gr2 +
                ') aa 
                order by 3, 2, 1 ';
        end
        else if @ColumnName in ('Rank', 'Param2AvgCalls')
        begin          
            set @durationColumn =
                case 
                    when @ColumnName = 'Rank' then 'sum(DurationAvgCalls)'
                    when @ColumnName = 'Param2AvgCalls' then 'sum(Param2AvgCalls)'
                end

            set @com +=
                'from 
                (
                    select ' + @gr1 + ' avg(p_avg) as avg, max(p_max) as max 
                    from 
                    (
                        select 
                            convert(date, registered) as registered, ' +
                            @durationColumn + ' as p_avg,
                            max(DurationMax) as p_max
                        from dbo.' + @TableName + ' s with (nolock, forceseek)
                        where 1=1 ' + @com_reg + @com_filtr +
                      ' group by convert(date, registered)
                    ) k group by ' + @gr2 + '
                ) aa 
                order by 3, 2, 1 ';
        end
        else
        begin
            declare @expression nvarchar(1000)  =
            case 
                when @ColumnName = 'CallsMinusFailures' then 'case when calls >= failures then calls - failures else 0 end'
                when @TableName ='MMTemplateVarsUsage_day' and @ColumnName = 'UnusedDivCalls' then 'cast(sum(unused) as float) / sum(calls)' 
                when @TableName ='VideoMovieEventsLog' AND @ColumnName = 'Calls' then 'count(1)'
                when @TableName = 'PresentEventsLog' AND @ColumnName = 'Calls' then 'count(1)'
                when @TableName IN ('MCAccessLogMailboxes_day','MRAccessLogMailboxes_day') AND @ColumnName = 'MailboxesAvg' then 'convert(float, sum(mailboxes)) / sum(devices)'                        
        when @TableName IN ('MCAccessLogMailboxes_day','MRAccessLogMailboxes_day') AND @ColumnName = 'DevicesAvg' then 'convert(float, sum(devices)) / sum(mailboxes)'                        
                else  @ColumnName
            end

            set @com = 'insert into #temp_dummy (registered, day, month, year, name, avg, max)';
            set @com +=
                'select registered, day, month, year, name, 
                    case when avg > ' + cast(@MaxValue as varchar) + ' then ' + cast(@MaxValue as varchar)+' else avg end avg,
                    case when max > ' + cast(@MaxValue as varchar) + ' then ' + cast(@MaxValue as varchar)+' else max end max 
                from 
                (
                    select registered, ' + @gr1 + ' name, avg(p_avg) avg, max(p_max) max 
                    from 
                    (
                        select 
                            t.' + @time_period + '_from registered, ' +
                            @nameColumn + ', ' +
                            'avg(' + @expression + ' ) p_avg, max(' + @expression + ') p_max
                        from dbo.' + @TableName + @groupByTablePostfix + '_v s with (nolock, forceseek), dwh.dbo.time t
                        where registered >= t.' + @time_period + '_from 
                          and registered < t.'+@time_period + '_to 
                          XY^&*
                          and t.date = t.' + @time_period + '_from' + @com_reg_time+@com_filtr +
                       ' group by t.' + @time_period + '_from' + @groupByColumn +
                 ') k 
                   group by registered, ' + @gr2 + ',name
                ) aa 
                order by 4, 3, 2 ';
        end;
    end;

    print @com

    declare @id_sql bigint = null;
    declare @rd date = sysdatetime();
    declare @id_sql_unique bigint = null;
    declare @com_unique varchar(max);

    set @com_unique = (select 'TableName' name, @TableName value FOR XML path('parameter'))
    if isnull(@ColumnName, '') != ''
        set @com_unique += (select 'ColumnName' name, @ColumnName value FOR XML path('parameter'))
    if isnull(@GroupBy, '') != '' 
    begin
        set @com_unique += (select 'GroupBy' name, @GroupBy value FOR XML path('parameter'))
        if isnull(@GroupByExpression, 0) != 0
          set @com_unique += (select 'GroupByExpression' name, @GroupByExpression value FOR XML path('parameter'))
    end

    if isnull(@Aggregation, '') != ''
        set @com_unique += (select 'Aggregation' name, @Aggregation value FOR XML path('parameter'))
    
    if isnull(@Multiplier, 1) != 1
        set @com_unique += (select 'Multiplier' name, @Multiplier value FOR XML path('parameter'))

    if isnull(@MaxValue, 0) != 0
        set @com_unique += (select 'MaxValue' name, @MaxValue value FOR XML path('parameter'))
    
    if isnull(@StartDate, '9999-12-31') != '9999-12-31'
        set @com_unique += (select 'StartDate' name, @StartDate value FOR XML path('parameter'))

    if isnull(@Date1, '1901-01-01') != '1901-01-01'
        set @com_unique += (select 'EndDate' name, @Date1 value FOR XML path('parameter'))
    
    if isnull(@AvgMax, 0) != 0
        set @com_unique += (select 'AvgMax' name, @AvgMax value FOR XML path('parameter'))

    if isnull(@Period, '') != ''
        set @com_unique += (select 'Period' name, @Period value FOR XML path('parameter'))

    declare @xml xml = @com_unique + @com_filtr_sql
    print cast(@xml as varchar(max))

    set @com_unique = lower(
    (
        select property.value(N'name[1]', N'nvarchar(MAX)') AS name, property.value(N'value[1]', N'nvarchar(MAX)') AS value 
        from @xml.nodes(N'/parameter') AS parameter(property) 
        order by 1, 2 
        for xml path('parameter')
    ))
    declare @com_unique_hash int = binary_checksum(@com_unique);

    select top 1 @id_sql=ID 
    from dwh_cache..monthly_sql (nolock) 
    where running_date = @rd 
      and sql_text=@com_unique 
      and sql_hash=@com_unique_hash;

    declare @_com varchar(max);

    set @_com = lower(
    (
        select name, value 
        from 
        (
            select property.value(N'name[1]', N'nvarchar(MAX)') AS name, property.value(N'value[1]', N'nvarchar(MAX)') as value 
            from @xml.nodes(N'/parameter') AS parameter(property)
        ) a 
        where name not in ('StartDate', 'EndDate') 
        order by 1, 2 
        for xml path('parameter')
    ))
    declare @_com_hash int = binary_checksum(@_com);
    
    select top 1 @id_sql_unique = ID 
    from dwh_cache..monthly_sql_unique (nolock) 
    where period = @Period 
      and sql_text = @_com 
      and sql_hash = @_com_hash;

    set @com_archive = ''

    declare cursor_1 cursor local for
    select YEAR, servername, dbname
    from #temp_archive
    order by year

    open cursor_1

    fetch next from cursor_1 into @year, @servername, @dbname
    while @@fetch_status = 0
    begin
        set @com_archive += 'if (select cnt from openquery(' + @servername + ', ''select count(1) cnt from ' + @dbname + '.sys.objects o (nolock) where o.name = ''''' + @TableName + ''''''')) > 0  exec (''' + replace(SUBSTRING(@com, 1, CHARINDEX(')', @com)) + ' select * from openquery (' + @servername + ', ''' + replace(replace(replace(replace(replace(replace(substring(@com, CHARINDEX(')', @com) + 1, LEN(@com) - CHARINDEX(')', @com)), 'dwh..', ''), 'dwh.dbo.', 'dbo.'), '[dbo].', @dbname + '.[dbo].'), 'dbo.', @dbname + '.dbo.'), '''', ''''''), 'XY^&*', 'XY^&* and t.year = ' + CAST(@year as varchar)) + ''')' + CHAR(13) + CHAR(10), '''', '''''') + ''')'
        set @com_archive=REPLACE(@com_archive, 'XX_TEMPDAY_XX','');
        set @com = replace(@com, 'XY^&*', 'XY^&* and t.year != ' + cast(@year as varchar))

        fetch next from cursor_1 into @year, @servername, @dbname
    end

    close cursor_1
    deallocate cursor_1

    if @id_sql is not null and @TableName not like '%UniqueLogins' and @TableName not like 'PaymentsToPresents%' and @TableName not like 'UniqueUsersByApplication%'
    begin
        if @AvgMax=0
        begin
            insert into #temp_dummy(registered, [day], [month], [year], [name], [avg])
            select [registered], [day], [month], [year], [name],[avg] 
            from dwh_cache..monthly_cache (nolock) 
            where registered<@rd and id_sql=@id_sql;
        end
        else begin
            insert into #temp_dummy(registered, [day], [month], [year], [name], [avg], [max])
            select [registered], [day], [month], [year], [name], [avg], [max] 
            from dwh_cache..monthly_cache (nolock) 
            where registered<@rd and id_sql=@id_sql;
        end;
    end
    else begin
        if @id_sql_unique is not null and @TableName not like '%UniqueLogins' and @TableName not like 'PaymentsToPresents%' and @TableName not like 'UniqueUsersByApplication%'
        begin
            declare @com_t varchar(max);
            set @com_t='insert into #temp_day
                select date from dwh..time (nolock) where 1=1'+replace(@com_reg,'registered','date')+
                ' except select registered from dwh_cache..monthly_cache_unique (nolock) where id_sql='+CAST(@id_sql_unique as varchar);

            exec(@com_t);

            delete from #temp_day where registered>=SYSDATETIME();

            update statistics #temp_day;
  
            select @interval_count=COUNT(1) from #temp_day;      

            if @interval_count>0
            begin
                set @min_date = @Date1
                set @com_reg_archive = ''
 
                declare cursor_2 cursor local for
                select date from dwh.dbo.Time (nolock)
                where date >= @Date1
                and date < @StartDate
                except
                select registered from #temp_day
                order by 1

                open cursor_2

                fetch next from cursor_2 into @date
 
                while @@fetch_status = 0
                begin
                if @date > @min_date
                    set @com_reg_archive += '(t.date >= ''''' + convert(varchar, @min_date, 20) + ''''' and t.date < ''''' + convert(varchar, @date, 20) + ''''') or '
                    set @min_date = dateadd(day, 1, @date)
                    fetch next from cursor_2 into @date
                end
 
                close cursor_2
                deallocate cursor_2
 
                set @com_reg_archive = ' and (' + @com_reg_archive + '(t.date >= ''''' + convert(varchar, @min_date, 20) + ''''' and t.date < ''''' + convert(varchar, @StartDate, 20) + '''''))'
 
                set @com_archive = REPLACE(@com_archive, 'XY^&*',replace(@com_reg_archive, '''',''''''))
                set @com_archive = REPLACE(@com_archive, 'XX_TEMPDAY_XX',replace(@com_reg_archive, '''',''''''))
 
                set @com=REPLACE(@com, 'XY^&*',' and t.date in (select registered from #temp_day)' )
                set @com=REPLACE(@com, 'XX_TEMPDAY_XX',' AND CAST(s.Registered AS DATE) in (select registered from #temp_day)' )
            end
            else
            begin
                set @com_archive=REPLACE(@com_archive, 'XY^&*','');
                set @com_archive=REPLACE(@com_archive, 'XX_TEMPDAY_XX','');
                set @com=REPLACE(@com, 'XY^&*','');
                set @com=REPLACE(@com, 'XX_TEMPDAY_XX','');
            end;
        end
        else
        begin
            set @com_archive=REPLACE(@com_archive, 'XY^&*','');
            set @com_archive=REPLACE(@com_archive, 'XX_TEMPDAY_XX','');
            set @com=REPLACE(@com, 'XY^&*','');
            set @com=REPLACE(@com, 'XX_TEMPDAY_XX','');
        end;

        set @com = @com_archive + CHAR(13)+CHAR(10)+@com

        if @time_period='Date'
        begin
            set @com=REPLACE(@com, 'and t.date=t.date_from','')
        end;

        if @interval_count>0 or @TableName like '%UniqueLogins' or @id_sql_unique is null
        begin
            SET @com = REPLACE(@com, 'from dbo.host s where','from dbo.host AS s WITH(NOLOCK) where');
            if dbo.istable(@TableName)=0 set @com=REPLACE(@com, ', FORCESEEK','')
                PRINT @com
           
            exec (@com);
        end;

        if @id_sql_unique is not null and @TableName not like '%UniqueLogins' 
        begin
            IF @TableName like 'PaymentsToPresent%' or @TableName like 'UniqueUsersByApplication%' 
                SET @StartDate = DATEADD(DAY, -1, @StartDate)
            
            if @AvgMax=0
            begin
              merge into #temp_dummy t
              using 
              (
                select [registered],[day],[month],[year],[name],[avg] 
                from dwh_cache..monthly_cache_unique (nolock) 
                where registered>=@Date1 
                  and registered<@StartDate 
                  and id_sql=@id_sql_unique
              ) s
              on
                t.registered = s.registered
                and t.name = s.name
              when not matched then
                insert values (s.[registered], s.[day], s.[month], s.[year], s.[name], s.[avg]);
            end
            else begin
              merge into #temp_dummy t
              using 
              (
                select [registered],[day],[month],[year],[name],[avg],[max] 
                from dwh_cache..monthly_cache_unique (nolock) 
                where registered>=@Date1 
                  and registered<@StartDate 
                  and id_sql=@id_sql_unique
              ) s
              on
                t.registered = s.registered
                and t.name = s.name
              when not matched then
                insert values (s.[registered], s.[day], s.[month], s.[year], s.[name], s.[avg], s.[max]);
            end;
        end;   
    end;  

    declare @mergecache bit = 0;
    
    begin transaction "cache";
        
    if @id_sql is null and @TableName not like '%UniqueLogins' and @TableName not like 'PaymentsToPresents%' and @TableName not like 'UniqueUsersByApplication%'
    begin
      declare @lock_res int = -1;
      declare @lock_name nvarchar(255) = @TableName + '_#monthly_sql_lock#_' + cast(@com_unique_hash as nvarchar(max));
      declare @lock_message nvarchar(max);

      -- I use "double-checked locking" like pattern
      -- https://ru.wikipedia.org/wiki/Double_checked_locking
      exec @lock_res = sp_getapplock @Resource = @lock_name, @LockMode = 'Exclusive', @LockOwner = 'Transaction', @LockTimeout = 600000;

      if @lock_res < 0
      begin
        set @lock_message = 'Unable to acquire lock for: ''' + @lock_name + '''';
        raiserror(@lock_message, 18, 1);
      end;

      select top 1 @id_sql = ID
      from dwh_cache..monthly_sql with(nolock)
      where running_date=@rd 
        and sql_text=@com_unique 
        and sql_hash=@com_unique_hash;

      if @id_sql is null 
      begin
        insert into dwh_cache..monthly_sql (running_date, sql_text) 
        values (@rd, @com_unique)
        
        set @id_sql = scope_identity();  

        if @AvgMax=0
        begin
            insert into dwh_cache..monthly_cache([id_sql],[registered],[day],[month],[year],[name],[avg])
            select @id_sql, registered, DAY,month, year, name, AVG 
            from #temp_dummy 
            where registered<@rd;
        end
        else
        begin
            insert into dwh_cache..monthly_cache([id_sql],[registered],[day],[month],[year],[name],[avg],[max])
            select @id_sql, registered, DAY,month, year, name, AVG, max 
            from #temp_dummy 
            where registered<@rd;
        end;

        declare @lock_unique_name nvarchar(255) = @TableName + '_#monthly_sql_unique_lock#_' + cast(@_com_hash as nvarchar(max));
        exec @lock_res = sp_getapplock @Resource = @lock_unique_name, @LockMode = 'Exclusive', @LockOwner = 'Transaction', @LockTimeout = 600000;

        if @lock_res < 0
        begin
          set @lock_message = 'Unable to acquire lock for: ''' + @lock_unique_name + '''';
          raiserror(@lock_message, 18, 1);
        end;

        select top 1 @id_sql_unique = ID 
        from dwh_cache..monthly_sql_unique with(nolock)
        where period=@period 
          and sql_text=@_com
          and sql_hash=@_com_hash;

        if @id_sql_unique is null
        begin
            insert into dwh_cache..monthly_sql_unique (period, sql_text) values (@period, @_com);
            set @id_sql_unique = scope_identity();  
        end;
        
        set @mergecache = 1;
     
      end;   
    end; 

    commit transaction "cache";

    if @mergecache = 1 
    begin
      declare @success bit = 0;
      declare @retryCount int = 1;
      declare @start4tran datetime = sysdatetime();

      while @success = 0
      begin
        begin try
          begin transaction "mergecache";

          declare @max_registered date;
          declare @min_registered date;
          
          select 
            @min_registered = min(registered), 
            @max_registered = max(registered) 
          from dwh_cache..monthly_cache (nolock) 
          where id_sql=@id_sql;

          merge dwh_cache..monthly_cache_unique with(holdlock) as target
          using 
          (
              select [registered],[day],[month],[year],[name],[avg],[max]
              from dwh_cache..monthly_cache (nolock)
              where registered >= @min_registered 
                and registered < @max_registered 
                and id_sql=@id_sql
          )
          as source([registered],[day],[month],[year],[name],[avg],[max])   
          on 
          (    
              target.registered=source.registered 
              and target.name=source.name
              and target.id_sql=@id_sql_unique
          )
          when not matched then
              insert (id_sql,[registered],[day],[month],[year],[name],[avg],[max])
              values (@id_sql_unique, [registered],[day],[month],[year],[name],[avg],[max])
          when matched then
              update set 
                target.[avg]=source.avg,
                target.max=source.max
          option (maxdop 1);

          commit transaction "mergecache";
          set @success = 1;
        end try
        begin catch
          rollback transaction "mergecache";

          declare @cacheErrorNumber int = error_number();

          if (@cacheErrorNumber in (
            /* SqlOutOfLocks */ 1204,
            /* SqlDeadlockVictim */ 1205,
            /* SqlLockRequestTimeout */ 1222
          ) and @retryCount < 3)
          begin
            set @retryCount = @retryCount + 1;

            -- Use random delay (between 50-500ms). To resolve situation when severall processes were choosen as deadlock victim
            declare @upper int = 50;
            declare @lower int = 500;
            declare @delayTime datetime = dateadd(millisecond, round(((@upper - @lower -1) * rand() + @lower), 0), sysdatetime());
            waitfor time @delayTime;
          end
          else begin
            declare @cacheDuration numeric(18,4) = (select datediff(millisecond, @start4tran, sysdatetime())) / 1000.00;
            declare @cacheErrorMessage nvarchar(max) = error_message();

            set @cacheErrorMessage = 
              '(' + 
              'error: ' + cast(@cacheErrorNumber as nvarchar(max)) + 
              ';attempts: ' + cast(@retryCount as nvarchar(max)) + 
              ';duration(sec): ' + cast(@cacheDuration as nvarchar(max)) + 
              ')' + 
              '->[line: ' +cast(error_line() as nvarchar(max))+ ']. ' + 
              @cacheErrorMessage;

            raiserror (@cacheErrorMessage, 18, 1);
          end;

        end catch
      end;
    end;  
    

    if @TableName='ImageServerStat'  and @ColumnName='Amount' and right(@p_ImageServerStatType,7)='traffic'
    begin
        update #temp_dummy
            set avg=avg/39360000;

        if @AvgMax!=0       
        begin
            update #temp_dummy
                set max=max/39360000;
        end;
    end;

    execute dwh.dbo.divide_by_activities_monthly
        @Activity, @AvgMax, @gr1, @gr2, @com_reg, @TableName, 
        @p_InternalLikeOperationsOperation, @p_InternalLikeOperationsType,
        @Period, @GroupName, @HostName,
        @p_ImageServerOperationClass, @p_ModerationResultsStatType, @GroupBy

    if @AvgMax=0
        insert into #temp_dummy2 
        select * from #temp_dummy;
    else
    begin
        insert into #temp_dummy2 (registered, day, month,year, name, avg)
        select registered, day, month, year, 'avg - '+name, avg 
        from #temp_dummy;
        
        insert into #temp_dummy2 (registered, day, month, year, name, avg)
        select registered, day, month, year,'max - '+name, max 
        from #temp_dummy;
    end

    if @Percent = 'Yes' and @GroupBy!='' and @AccumulativeSum = 0 and @norm =0
    begin
        truncate table #temp_dummy2
        insert into #temp_dummy2 
        select a.registered, a.day, a.month, a.year, a.name, avg= case when b.avg >0 then  cast(a.avg*100 as float)/b.avg else 0 end 
        from
        (
            select registered, day, month,year, name, avg 
            from #temp_dummy
        ) a
        left join
        (
            select registered, day, month,year, sum(avg) avg 
            from #temp_dummy
          group by registered, day, month,year 
        ) b
          on a.registered = b.registered
          and a.day = b.day
          and a.month = b.month
          and a.year = b.year
    end

    if @norm != 0
    begin 
        if @AvgMax=0
        begin
            select @min_value = min(t2.avg) 
            from #temp_dummy as t2;

            update #temp_dummy2
                set avg = case when t.avg=0 then 0 else ((cast(#temp_dummy2.AVG as float)-@min_value)/cast(t.avg as float))*1000 end
            from (select MAX(t2.avg) avg, t2.name from #temp_dummy as t2 group by t2.name) t
            where t.name=#temp_dummy2.name;
        end
        else
        begin
            update #temp_dummy2
                set avg=case when t.avg=0 then 0 else (cast(#temp_dummy2.AVG as float)/cast(t.avg as float))*1000 end
            from (select MAX(t2.avg) avg from #temp_dummy as t2) t
            where name like 'avg - %';
    
            update #temp_dummy2
                set avg=case when t.max=0 then 0 else (cast(#temp_dummy2.avg as float)/cast(t.max as float))*1000 end
            from (select MAX(t2.max) max from #temp_dummy as t2) t
            where name like 'max - %';
        end;
    end

    if @MinValue>0
    begin
        delete from #temp_dummy2
        where avg<@MinValue;
    end;   

    if @Trend!=0
    begin
        insert into #temp_dummy3(registered, day, month,year, name, avg, rownumber)
        select registered, day, month,year, name, avg, ROW_NUMBER () OVER (partition by name ORDER BY year, month, cast(day as int))
        from #temp_dummy2

        insert into #temp_dummy2(registered, day, month,year, name, avg)
        select distinct registered, DAY, month, year, 'trend' + case name when '_' then '' else '_' + name end,
        (
            select AVG(avg) 
            from #temp_dummy3 t 
            where t.rownumber between #temp_dummy3.rownumber-@Trend and #temp_dummy3.rownumber
              and t.name = #temp_dummy3.name
        ) 
        from #temp_dummy3;
              
       if @TrendOnly = 1
            delete from #temp_dummy2
            where name != 'trend'
       else
            update #temp_dummy2
            set name='Data'
            where name='_';
    end

    if @AccumulativeSum != 0
    begin
        if @GroupBy!=''
        begin
            update #temp_dummy2 
                set avg = 
                (
                    select sum(avg) 
                    from #temp_dummy d2 
                    where d2.year*54*31+d2.month*31+cast(d2.day as int)<= #temp_dummy2.year*54*31+#temp_dummy2.month*31+cast(#temp_dummy2.day as int)
                      and d2.name =#temp_dummy2.name);   
        end
        else
        begin
            update #temp_dummy2 
                set avg=
                (
                    select sum(avg) 
                    from #temp_dummy d2 
                    where d2.year*54*31+d2.month*31+cast(d2.day as int)<= #temp_dummy2.year*54*31+#temp_dummy2.month*31+cast(#temp_dummy2.day as int)
                );
        end   
    end;  

    update #temp_dummy2
        set name='Data' 
    where name='_';

    delete from #temp_dummy2
    where registered=@rd;

    if @GroupBy='' or @TopN='0'
    begin
        if @Seasonality = 1 and @Period = 'Month'
            select registered, day, month, year, name, avg - (
                (
                    select avg(avg) 
                    from #temp_dummy2 t2
                    where t2.registered >= DATEADD(MONTH, -6, t.registered)
                      and t2.registered < DATEADD(month, 6, t.registered)
                      and t2.name = t.name
                ) + 
                (
                    select avg(avg) 
                    from #temp_dummy2 t2
                    where t2.registered > DATEADD(MONTH, -6, t.registered)
                      and t2.registered <= DATEADD(month, 6, t.registered)
                      and t2.name = t.name
                )
            ) / 2 avg
            from #temp_dummy2 t
            where registered >= @Date0
              and registered < @StartDate1
            order by year,month, cast(day as int), name
        else
            select * 
            from #temp_dummy2
            order by year,month, cast(day as int),name;
        end
    else
    begin
        if @TopN like '-%'
        begin
            if @Seasonality = 1 and @Period = 'Month'
                select registered, day, month, year, name, avg - (
                    (
                        select avg(avg) 
                        from #temp_dummy2 t2
                        where t2.registered >= DATEADD(MONTH, -6, t.registered)
                            and t2.registered < DATEADD(month, 6, t.registered)
                            and t2.name = t.name
                    ) + 
                    (
                        select avg(avg) 
                        from #temp_dummy2 t2
                        where t2.registered > DATEADD(MONTH, -6, t.registered)
                          and t2.registered <= DATEADD(month, 6, t.registered)
                          and t2.name = t.name
                    )
                ) / 2 avg
                from #temp_dummy2 t
                where registered >= @Date0
                  and registered < @StartDate1
                  and name in 
                  (
                    select name 
                    from 
                    (
                        select top(abs(cast(@topn as int))) name, SUM(avg) avg 
                        from 
                        (
                            select name, SUM(avg) avg 
                            from #temp_dummy2 t0
                            group by name
                        )
                        k group by name order by avg
                    ) p
                  )
                order by year, month, cast(day as int), name
        else
            select * 
            from #temp_dummy2
            where name in 
            (  
                select name 
                from 
                (
                    select top(abs(cast(@topn as int))) name, sum(avg) avg 
                    from 
                    (
                        select name, sum(avg) avg 
                        from #temp_dummy2 t0      
                        group by name
                    )
                    k group by name 
                    order by avg
                ) p
            )   
            order by year,month, cast(day as int),name;
        end
    else
    begin
        if left(@topn,1)='[' and right(@topn,1)=']'
        begin
            if @Seasonality = 1 and @Period = 'Month'
                select registered, day, month, year, name, avg - (
                    (
                        select avg(avg) 
                        from #temp_dummy2 t2
                        where t2.registered >= DATEADD(MONTH, -6, t.registered)
                          and t2.registered < DATEADD(month, 6, t.registered)
                          and t2.name = t.name
                    ) 
                    + 
                    (
                        select avg(avg) 
                        from #temp_dummy2 t2
                        where t2.registered > DATEADD(MONTH, -6, t.registered)
                         and t2.registered <= DATEADD(month, 6, t.registered)
                         and t2.name = t.name
                    )
                ) / 2 avg
                from #temp_dummy2 t
                where registered >= @Date0
                  and registered < @StartDate1
                  and name in 
                  (
                    select name 
                    from
                    (  
                        select top(cast(replace(replace(@topn,'[',''),']','') as int))
                                t1.name, abs(t1.avg-t0.avg) avg 
                        from #temp_dummy2 t0,  #temp_dummy2 t1  
                        where t0.registered = (select MIN(registered) from #temp_dummy2) 
                          and t1.registered = (select MAX(registered) from #temp_dummy2)  
                          and t0.name=t1.name
                        order by abs(t1.avg-t0.avg) desc
                    ) p 
                  )
                  order by year,month, cast(day as int),name
            else
                select * 
                from #temp_dummy2
                where name in 
                (
                    select name 
                    from
                    (  
                        select top(cast(replace(replace(@topn,'[',''),']','') as int))
                                t1.name, abs(t1.avg-t0.avg) avg 
                        from #temp_dummy2 t0,  #temp_dummy2 t1  
                        where t0.registered =(select MIN(registered) from #temp_dummy2) 
                          and t1.registered =(select MAX(registered) from #temp_dummy2)  and t0.name=t1.name
                        order by abs(t1.avg-t0.avg) desc
                    ) p 
                )
                order by year,month, cast(day as int),name;     
            end
        else
        begin   
            if @Seasonality = 1 and @Period = 'Month'
                select registered, day, month, year, name, avg - (
                    (
                        select avg(avg) 
                        from #temp_dummy2 t2
                        where t2.registered >= DATEADD(MONTH, -6, t.registered)
                          and t2.registered < DATEADD(month, 6, t.registered)
                          and t2.name = t.name
                    ) 
                    + 
                    (
                        select avg(avg) 
                        from #temp_dummy2 t2
                        where t2.registered > DATEADD(MONTH, -6, t.registered)
                          and t2.registered <= DATEADD(month, 6, t.registered)
                          and t2.name = t.name
                    )
                ) / 2 avg
                from #temp_dummy2 t
                where registered >= @Date0
                  and registered < @StartDate1
                  and name in 
                  (  
                    select name 
                    from 
                    (
                        select top(cast(@topn as int)) name, SUM(avg) avg 
                        from 
                        (
                            select name, SUM(avg) avg 
                            from #temp_dummy2 t0
                            group by name
                        )
                        k group by name order by avg desc
                    ) p
                  )
                  order by year,month, cast(day as int),name
            else
                select * 
                from #temp_dummy2
                where name in 
                (  
                    select name 
                    from 
                    (
                        select top(cast(@topn as int)) name, SUM(avg) avg 
                        from 
                        (
                            select name, sum(avg) avg 
                            from #temp_dummy2 t0
                            group by name
                        )
                        k group by name order by avg desc
                    ) p
                )
                order by year,month, cast(day as int) ,name;   
            end;
        end;  
    end
end try
begin catch
  declare @procname nvarchar(1000) = ERROR_PROCEDURE();
  declare @errorline int = ERROR_LINE();

  declare @e varchar(1000);
  if (@procname is null or len(@procname) = 0)
  begin
    set @e = case when @errorline > 0 then '[line: ' +CAST(@errorline as nvarchar(max))+ ']. ' else '' end;
  end
  else begin
    set @e = case when @errorline > 0 then '[''' + @procname + ''' - line: ' +CAST(ERROR_LINE() as nvarchar(max))+ ']. ' else '' end;
  end;

  set @e = @e + ERROR_MESSAGE();

  if @@trancount > 0 rollback transaction "cache";

  execute [dwh-log].dbo.Fill_ReportErrorLog
      @Completed  = 0, @ProcedureName = 'Get_monthly_data', @ErrorText = @e, @StartDate = @StartDate1, @GroupName = @GroupName, @HostName = @HostName,
      @TableName = @TableName1, @ColumnName = @ColumnName, @MaxValue = @MaxValue, @Norm = @Norm, @Days = @Days, @DaysPeriod = @DaysPeriod, @Weeks = @Weeks,
      @Months = @Months, @Activity = @Activity, @Inverse = @Inverse, @AccumulativeSum = @AccumulativeSum, @GroupBy = @GroupBy, @AvgMax = @AvgMax,
      @Trend = @Trend, @Period  = @Period, @MinValue = @MinValue, @Aggregation = @Aggregation, @TopN = @TopN, 
      @FilterValue1 = @FilterValue1, @FilterName1 = @FilterName1, @FilterValue2 = @FilterValue2, @FilterName2 = @FilterName2,
      @FilterValue3 = @FilterValue3, @FilterName3 = @FilterName3, @FilterValue4 = @FilterValue4, @FilterName4 = @FilterName4,
      @FilterValue5 = @FilterValue5, @FilterName5 = @FilterName5, @FilterValue6 = @FilterValue6, @FilterName6 = @FilterName6,
      @FilterValue7 = @FilterValue7, @FilterName7 = @FilterName7, @FilterValue8 = @FilterValue8, @FilterName8 = @FilterName8,
      @FilterValue9 = @FilterValue9, @FilterName9 = @FilterName9, @FilterValue10 = @FilterValue10, @FilterName10 = @FilterName10,
      @FilterValue11 = @FilterValue11, @FilterName11 = @FilterName11, @FilterValue12 = @FilterValue12, @FilterName12 = @FilterName12,
      @FilterValue13 = @FilterValue13, @FilterName13 = @FilterName13, @FilterValue14 = @FilterValue14, @FilterName14 = @FilterName14,
      @FilterValue15 = @FilterValue15, @FilterName15 = @FilterName15, @FilterValue16 = @FilterValue16, @FilterName16 = @FilterName16,
      @FilterValue17 = @FilterValue17, @FilterName17 = @FilterName17, @FilterValue18 = @FilterValue18, @FilterName18 = @FilterName18,
      @FilterValue19 = @FilterValue19, @FilterName19 = @FilterName19, @FilterValue20 = @FilterValue20, @FilterName20 = @FilterName20,
      @FilterValue21 = @FilterValue21, @FilterName21 = @FilterName21, @FilterValue22 = @FilterValue22, @FilterName22 = @FilterName22,
      @FilterValue23 = @FilterValue23, @FilterName23 = @FilterName23, @FilterValue24 = @FilterValue24, @FilterName24 = @FilterName24,
      @FilterValue25 = @FilterValue25, @FilterName25 = @FilterName25, @FilterValue26 = @FilterValue26, @FilterName26 = @FilterName26,
      @FilterValue27 = @FilterValue27, @FilterName27 = @FilterName27, @FilterValue28 = @FilterValue28, @FilterName28 = @FilterName28,
      @FilterValue29 = @FilterValue29, @FilterName29 = @FilterName29, @FilterValue30 = @FilterValue30, @FilterName30 = @FilterName30,
      @FilterValue31 = @FilterValue31, @FilterName31 = @FilterName31, @FilterValue32 = @FilterValue32, @FilterName32 = @FilterName32,
      @FilterValue33 = @FilterValue33, @FilterName33 = @FilterName33, @FilterValue34 = @FilterValue34, @FilterName34 = @FilterName34,
      @FilterValue35 = @FilterValue35, @FilterName35 = @FilterName35, @FilterValue36 = @FilterValue36, @FilterName36 = @FilterName36,
      @FilterValue37 = @FilterValue37, @FilterName37 = @FilterName37, @FilterValue38 = @FilterValue38, @FilterName38 = @FilterName38,
      @FilterValue39 = @FilterValue39, @FilterName39 = @FilterName39, @FilterValue40 = @FilterValue40, @FilterName40 = @FilterName40,
      @FilterValue41 = @FilterValue41, @FilterName41 = @FilterName41, @FilterValue42 = @FilterValue42, @FilterName42 = @FilterName42,
      @FilterValue43 = @FilterValue43, @FilterName43 = @FilterName43, @FilterValue44 = @FilterValue44, @FilterName44 = @FilterName44,
      @FilterValue45 = @FilterValue45, @FilterName45 = @FilterName45, @FilterValue46 = @FilterValue46, @FilterName46 = @FilterName46,
      @FilterValue47 = @FilterValue47, @FilterName47 = @FilterName47, @FilterValue48 = @FilterValue48, @FilterName48 = @FilterName48,
      @FilterValue49 = @FilterValue49, @FilterName49 = @FilterName49, @FilterValue50 = @FilterValue50, @FilterName50 = @FilterName50,
      @FilterValue51 = @FilterValue51, @FilterName51 = @FilterName51, @FilterValue52 = @FilterValue52, @FilterName52 = @FilterName52,
      @FilterValue53 = @FilterValue53, @FilterName53 = @FilterName53, @FilterValue54 = @FilterValue54, @FilterName54 = @FilterName54,
      @FilterValue55 = @FilterValue55, @FilterName55 = @FilterName55, @FilterValue56 = @FilterValue56, @FilterName56 = @FilterName56,
      @FilterValue57 = @FilterValue57, @FilterName57 = @FilterName57, @FilterValue58 = @FilterValue58, @FilterName58 = @FilterName58,
      @FilterValue59 = @FilterValue59, @FilterName59 = @FilterName59, @FilterValue60 = @FilterValue60, @FilterName60 = @FilterName60,
      @FilterValue61 = @FilterValue61, @FilterName61 = @FilterName61, @FilterValue62 = @FilterValue62, @FilterName62 = @FilterName62,
      @FilterValue63 = @FilterValue63, @FilterName63 = @FilterName63, @FilterValue64 = @FilterValue64, @FilterName64 = @FilterName64,
      @FilterValue65 = @FilterValue65, @FilterName65 = @FilterName65, @FilterValue66 = @FilterValue66, @FilterName66 = @FilterName66,
      @FilterValue67 = @FilterValue67, @FilterName67 = @FilterName67, @FilterValue68 = @FilterValue68, @FilterName68 = @FilterName68,
      @FilterValue69 = @FilterValue69, @FilterName69 = @FilterName69, @FilterValue70 = @FilterValue70, @FilterName70 = @FilterName70,
      @FilterValue71 = @FilterValue71, @FilterName71 = @FilterName71, @FilterValue72 = @FilterValue72, @FilterName72 = @FilterName72,
      @FilterValue73 = @FilterValue73, @FilterName73 = @FilterName73, @FilterValue74 = @FilterValue74, @FilterName74 = @FilterName74,
      @FilterValue75 = @FilterValue75, @FilterName75 = @FilterName75, @FilterValue76 = @FilterValue76, @FilterName76 = @FilterName76,
      @FilterValue77 = @FilterValue77, @FilterName77 = @FilterName77, @FilterValue78 = @FilterValue78, @FilterName78 = @FilterName78,
      @FilterValue79 = @FilterValue79, @FilterName79 = @FilterName79, @FilterValue80 = @FilterValue80, @FilterName80 = @FilterName80,
      @FilterValue81 = @FilterValue81, @FilterName81 = @FilterName81, @FilterValue82 = @FilterValue82, @FilterName82 = @FilterName82,
      @FilterValue83 = @FilterValue83, @FilterName83 = @FilterName83, @FilterValue84 = @FilterValue84, @FilterName84 = @FilterName84,
      @FilterValue85 = @FilterValue85, @FilterName85 = @FilterName85, @FilterValue86 = @FilterValue86, @FilterName86 = @FilterName86,
      @FilterValue87 = @FilterValue87, @FilterName87 = @FilterName87, @FilterValue88 = @FilterValue88, @FilterName88 = @FilterName88,
      @FilterValue89 = @FilterValue89, @FilterName89 = @FilterName89, @FilterValue90 = @FilterValue90, @FilterName90 = @FilterName90,
      @FilterValue91 = @FilterValue91, @FilterName91 = @FilterName91, @FilterValue92 = @FilterValue92, @FilterName92 = @FilterName92,
      @FilterValue93 = @FilterValue93, @FilterName93 = @FilterName93, @FilterValue94 = @FilterValue94, @FilterName94 = @FilterName94,
      @FilterValue95 = @FilterValue95, @FilterName95 = @FilterName95, @FilterValue96 = @FilterValue96, @FilterName96 = @FilterName96,
      @FilterValue97 = @FilterValue97, @FilterName97 = @FilterName97, @FilterValue98 = @FilterValue98, @FilterName98 = @FilterName98,
      @FilterValue99 = @FilterValue99, @FilterName99 = @FilterName99, @FilterValue100 = @FilterValue100, @FilterName100 = @FilterName100,
      @Percent = @Percent, @Multiplier = @Multiplier, @GroupByExpression = @GroupByExpression, @Seasonality = @Seasonality, @TrendOnly = @TrendOnly
  raiserror(@e, 18,1);
end catch
end