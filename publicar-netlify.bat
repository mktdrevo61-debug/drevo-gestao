@echo off
echo ===================================================
echo   PUBLICANDO O APLICATIVO NO NETLIFY
echo ===================================================
echo.
echo Se for a sua primeira vez, ele vai abrir uma janela do navegador
echo para voce fazer login na sua conta do Netlify e autorizar.
echo.
echo Siga as instrucoes na tela (escolha "Create & configure a new site" 
echo se for a primeira vez).
echo.
call npx netlify-cli deploy --prod --dir=.
echo.
echo ===================================================
echo   PUBLICACAO FINALIZADA!
echo ===================================================
pause
