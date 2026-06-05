@echo off
chcp 65001 > nul
echo ===================================================
echo   PUBLICANDO O APLICATIVO DREVO NO GITHUB
echo ===================================================
echo.

git remote get-url origin >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo Parece que é a primeira vez publicando no GitHub.
    echo.
    set /p repo_url="Cole a URL do seu repositório do GitHub (ex: https://github.com/seu-usuario/seu-repositorio.git): "
    git remote add origin %repo_url%
)

echo.
echo Salvando e preparando alterações locais...
git add .
git commit -m "feat: atualizar aplicacao e integrar google drive" >nul 2>&1

echo.
echo Enviando arquivos para o GitHub...
echo (Se for a primeira vez, uma janela de login do GitHub abrirá no seu navegador, basta autorizar!)
echo.
git push -u origin main

echo.
echo ===================================================
echo   ENVIO AO GITHUB FINALIZADO COM SUCESSO!
echo ===================================================
echo.
echo Agora siga estes dois passos rápidos no site do GitHub para ativar seu app:
echo.
echo 1. Acesse o seu repositório no navegador.
echo 2. Vá em: "Settings" (Configurações) > "Pages" (na barra lateral esquerda).
echo 3. Em "Build and deployment" > "Branch", selecione "main" (onde está /root) e clique em "Save" (Salvar).
echo.
echo Em 1 a 2 minutos, o GitHub disponibilizará o link do seu app no topo dessa mesma página!
echo.
pause
