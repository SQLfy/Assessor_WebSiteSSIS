-- =============================================
-- Description: Replaces ASCII-char's 9-13,34,39 and 46 which are tab, line-feed, vert tab,
-- form-feed, & carriage-return, double-quote, single-quote, comma (respectively), with a whitespace.
-- =============================================
CREATE FUNCTION [fn_CSVClean] (
       @Str varchar(max)
)
RETURNS varchar(max) AS
BEGIN
       DECLARE @Result varchar(max)

       SET @Result = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
              @Str, CHAR(9), ' '), CHAR(10), ' '), CHAR(11), ' '), CHAR(12), ' '), CHAR(13), ' '), CHAR(34), ' '), CHAR(39), ' '), CHAR(46), ' ')

       RETURN @Result
END