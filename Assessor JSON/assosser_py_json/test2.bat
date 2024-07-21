set t=%date%_%time%
set d=%t:~10,4%%t:~7,2%%t:~4,2%_%t:~15,2%%t:~18,2%%t:~21,2%
set d=%d: =0%
echo %d%


forfiles -p "C:\python\assessor_py_json\logs" -s -m *.* -d -5 -c "cmd /c echo @file"
forfiles -p "C:\python\assessor_py_json\logs" -s -m *.* -d -5 -c "cmd /c del @path"