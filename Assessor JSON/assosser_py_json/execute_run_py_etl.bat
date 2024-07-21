set t=%date%_%time%
set d=%t:~10,4%%t:~7,2%%t:~4,2%_%t:~15,2%%t:~18,2%%t:~21,2%
set d=%d: =0%

C:\python\assessor_py_json\run_py_etl.bat > C:\python\assessor_py_json\logs\asr_py_json_%d%.log 2>&1

