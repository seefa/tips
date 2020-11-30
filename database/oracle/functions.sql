-- Numeric Single-Row function

SELECT round(12.345) FROM dual;             -- Round number e.g: 12.345 -> 12
SELECT round(12.645) FROM dual;             -- Round number e.g: 12.645 -> 13
SELECT round(12.345, 2) FROM dual;          -- Round number e.g: 12.345 -> 12.35
SELECT round(12.845, 1) FROM dual;          -- Round number e.g: 12.845 -> 12.8
SELECT round(8762.341,-2) FROM dual;        -- Round number e.g: 8762 -> 8800


SELECT trunc(12.3458, 2) FROM dual;     -- Trunc number based on second parameter e.g: 12.3458 -> 12.24
SELECT trunc(12.3458, 0) FROM dual;     -- Trunc number based on second parameter e.g: 12.3458 -> 12
SELECT trunc(12.3458, -1) FROM dual;    -- Trunc number based on second parameter e.g: 12.3458 -> 10

SELECT floor(12.645) FROM dual;         -- Floor number e.g: 12.645 -> 12
SELECT ceil(12.345) FROM dual;          -- Ceil number e.g: 12.345 -> 13
SELECT mod(12, 8.5) FROM dual;          -- Calculate mod from two number (12, 8.5) -> 3.5

-- Character Single-Row functions

SELECT concat(concat('Saman ', 'Delfani '), 'Software Developer ') || 2020 FROM dual;    -- Concat two string

SELECT substr('Saman Delfani is a software developer', 7) FROM dual;                    -- Cut String from index number(INDEX start from 1); starting from left to the end
SELECT substr('Saman Delfani is a software developer', 7, 7) FROM dual;                 -- Cut String from index number and number of cut is second number(INDEX start from 1); starting from left to the end
SELECT substr('Saman Delfani is a software developer', -9) FROM dual;                   -- Cut String from index number(INDEX start from 1); starting from right to the end
SELECT substr('Saman Delfani is a software developer', -9, 7) FROM dual;                -- Cut String from index number and number of cut is second number(INDEX start from 1)  starting from right to the end

SELECT lower('Saman Delfani is a software developer') FROM dual;                        -- Change all characters to lower characters
SELECT upper('Saman Delfani is a software developer') FROM dual;                        -- Change all characters to UPPER characters

SELECT initcap('Saman Delfani is a software developer') FROM dual;                      -- Change all start character of words to Capital letter

SELECT instr('Saman Delfani is a software developer', 'i') FROM dual;                   -- Search 'i' character in source sentence
SELECT instr('Saman Delfani is a software developer', 'is') FROM dual;                  -- Search 'is' word in source sentence
SELECT instr('Saman Delfani is a Software Developer', 'De', 1, 2) FROM dual;            -- Search 'De' letters in source sentence by skip first one
SELECT instr('Saman Delfani is a Software Developer', 'De', 10, 2) FROM dual;           -- Search 'De' letters in source sentence by passing 10 character. Result is 0

SELECT trim('     Saman     ') FROM dual;                                               -- Trim spaces before and after source word
SELECT trim('S' from 'Saman Delfani is a Software Developer') FROM dual;                -- Trim 'S' form source sentence if first letter is 'S'

SELECT lpad('Saman Delfani is a Software Developer', 50, '*') FROM dual;                -- LPad fill left of result with '*' to 50 characters and cut result from right if number of characters exceeded from 50 characters
SELECT rpad('Saman Delfani is a Software Developer', 50, '*') FROM dual;                -- RPad fill right of result with '*' to 50 characters and cut result from right if number of characters exceeded from 50 characters

SELECT replace('Saman Delfani is a Software Developer', 'i', '!') FROM dual;            -- Replace 'i' with '!'
SELECT replace('Saman Delfani is a Software Developer', 'is a', 'wants to be') FROM dual;   -- Replace 'is a' with 'wants to be'
SELECT replace('Saman Delfani is a Software Developer', ' ', '') FROM dual;             -- Remove all spaces from text

SELECT length('Saman Delfani is a Software Developer') FROM dual;                       -- Count number of letters

-- Date Single-Row Functions
-- alter session set nls_calendar=persian
-- alter session set nls_calendar=gregorian

SELECT to_char(sysdate, 'yyyy/mm/dd hh24:mi:ss') FROM dual;                             -- return Gregorian current date as String
SELECT to_char(sysdate, 'yyyy/mm/dd hh24:mi:ss', 'nls_calendar=persian') FROM dual;     -- return Shamsi current date as String
SELECT to_date('1399/09/09 09:09:09', 'yyyy/mm/ddhh24:mi:ss', 'nls_calendar=persian') FROM dual;     -- Convert Shamsi String date to Gregorian date

SELECT add_months(date '2020-02-02', 2) FROM dual;          -- add n months from second number to first date value
SELECT add_months(date '2020-02-02', -2) FROM dual;         -- minus n months from second number to first date value

/**
** For working with Shamsi/Jalali dates and getting correct answers, we need to alter session calendar  to persian with following command
** alter session set nls_calendar=persian
*/

SELECT to_char(
add_months(
to_date('1399/06/31','yyyy/mm/dd','nls_calendar=persian'),3),
'yyyy/mm/dd','nls_calendar=persian') 
FROM dual;                                                                      -- Add 3 months to Jalali calendar

SELECT to_char(
last_day(to_date('1399/06/01','yyyy/mm/dd','nls_calendar=persian')),
'yyyy/mm/dd','nls_calendar=persian')
FROM dual;                                                                      -- Get last day of Jalali calendar

SELECT to_char(
next_day(to_date('1399/09/08','yyyy/mm/dd','nls_calendar=persian'),'fri'),
'yyyy/mm/dd','nls_calendar=persian')
FROM dual;                                                                      -- Get next specific day of the week date

SELECT months_between(to_date('1399/09/01','yyyy/mm/dd','nls_calendar=persian'),
                      to_date('1399/06/01','yyyy/mm/dd','nls_calendar=persian'))
FROM dual;                                                                      -- Get number of days between two dates

