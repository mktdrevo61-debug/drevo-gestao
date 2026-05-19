@echo off
echo ===================================================
echo   PUBLICANDO O APLICATIVO DREVO GESTAO
echo ===================================================
echo.
echo Se for a sua primeira vez, ele vai pedir um Email e uma Senha.
echo Voce pode inventar uma senha nova agora mesmo para criar a conta.
echo.
call npx surge . drevo-producao.surge.sh
echo.
echo ===================================================
echo   PUBLICADO COM SUCESSO!
echo   O link fixo do aplicativo e: 
echo   http://drevo-producao.surge.sh
echo ===================================================
pause
