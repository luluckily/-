@echo off
chcp 65001 >nul

:LOOP
timeout /t 1 /nobreak >nul
tasklist /fi "imagename eq LeagueClientUx.exe" 2>nul | find /i /n "LeagueClientUx.exe">nul
if "%errorlevel%"=="0" (
    echo 英雄联盟客户端已启动。如果汉化不完全，请退出英雄联盟客户端，从riot平台重新启动即可。---bilibili:小小鹿0vo
    echo 可能遇到的问题：如果汉化未成功，请尝试完全关闭游戏和拳头客户端，重启本程序。---bilibili:小小鹿0vo
    echo 如果仍然未能解决，欢迎通过b站后台私信我。---bilibili:小小鹿0vo
    echo 按任意键退出本程序。---bilibili:小小鹿0vo
    goto END
) else (
    echo 汉化准备就绪，等待英雄联盟启动中。---bilibili:小小鹿0vo
)

set "file=C:\ProgramData\Riot Games\Metadata\league_of_legends.live\league_of_legends.live.product_settings.yaml"
set "tempfile=%file%.tmp"

copy /y nul %tempfile% >nul

for /f "tokens=1* delims=:" %%a in ('findstr /n "^" "%file%"') do (
    set "line=%%b"
    setlocal enabledelayedexpansion
    if "!line:locale=!" neq "!line!" (
        set "line=!line:locale: "en_US"=locale: "zh_CN"!"
        set "line=!line:locale: "cs_CZ"=locale: "zh_CN"!"
        set "line=!line:locale: "de_DE"=locale: "zh_CN"!"
        set "line=!line:locale: "el_GR"=locale: "zh_CN"!"
        set "line=!line:locale: "en_AU"=locale: "zh_CN"!"
        set "line=!line:locale: "en_GB"=locale: "zh_CN"!"
        set "line=!line:locale: "en_PH"=locale: "zh_CN"!"
        set "line=!line:locale: "en_SG"=locale: "zh_CN"!"
        set "line=!line:locale: "es_AR"=locale: "zh_CN"!"
        set "line=!line:locale: "es_ES"=locale: "zh_CN"!"
        set "line=!line:locale: "es_MX"=locale: "zh_CN"!"
        set "line=!line:locale: "fr_FR"=locale: "zh_CN"!"
        set "line=!line:locale: "hu_HU"=locale: "zh_CN"!"
        set "line=!line:locale: "it_IT"=locale: "zh_CN"!"
        set "line=!line:locale: "ja_JP"=locale: "zh_CN"!"
        set "line=!line:locale: "ko_KR"=locale: "zh_CN"!"
        set "line=!line:locale: "pl_PL"=locale: "zh_CN"!"
        set "line=!line:locale: "pt_BR"=locale: "zh_CN"!"
        set "line=!line:locale: "ro_RO"=locale: "zh_CN"!"
        set "line=!line:locale: "ru_RU"=locale: "zh_CN"!"
        set "line=!line:locale: "th_TH"=locale: "zh_CN"!"
        set "line=!line:locale: "tr_TR"=locale: "zh_CN"!"
        set "line=!line:locale: "vi_VN"=locale: "zh_CN"!"
        set "line=!line:locale: "zh_MY"=locale: "zh_CN"!"
        set "line=!line:locale: "zh_TW"=locale: "zh_CN"!"
    )
    >>"%tempfile%" echo(!line!
    endlocal
)

move /y "%tempfile%" "%file%" >nul
goto LOOP

:END
pause
