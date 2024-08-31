@echo off
title Optimus Script Menu
:menu
echo ============================================================
echo                Optimus Project Script Menu
echo ============================================================
echo.
echo Select an option to run the corresponding npm script:
echo.
echo 1. Build Project (nest build)
echo 2. Format Code (prettier --write)
echo 3. Start Project (nest start)
echo 4. Start in Development Mode (nest start --watch)
echo 5. Start in Debug Mode (nest start --debug --watch)
echo 6. Start in Production Mode (node dist/main)
echo 7. Lint Code (eslint --fix)
echo 8. Run Unit Tests (jest)
echo 9. Watch Tests (jest --watch)
echo 10. Test Coverage (jest --coverage)
echo 11. Debug Tests (node --inspect-brk ...)
echo 12. Run End-to-End Tests (jest --config ./test/jest-e2e.json)
echo 13. Exit
echo.
set /p choice="Enter your choice (1-13): "

if "%choice%"=="1" (
    npm run build
) else if "%choice%"=="2" (
    npm run format
) else if "%choice%"=="3" (
    npm run start
) else if "%choice%"=="4" (
    npm run start:dev
) else if "%choice%"=="5" (
    npm run start:debug
) else if "%choice%"=="6" (
    npm run start:prod
) else if "%choice%"=="7" (
    npm run lint
) else if "%choice%"=="8" (
    npm run test
) else if "%choice%"=="9" (
    npm run test:watch
) else if "%choice%"=="10" (
    npm run test:cov
) else if "%choice%"=="11" (
    npm run test:debug
) else if "%choice%"=="12" (
    npm run test:e2e
) else if "%choice%"=="13" (
    exit
) else (
    echo Invalid choice. Please try again.
    pause
    cls
    goto menu
)