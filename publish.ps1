Set-Location ../roozbime.github.io.pages
Get-Item * | Where-Object BaseName -NotMatch ".git" | Remove-Item -Recurse -Force
git pull
git add . --all
git commit -m "clean"
git config --add core.compression -1
git gc
Set-Location ../roozbime.github.io
dotnet publish -c Release -o ../roozbime.github.io.publish
Set-Location ../roozbime.github.io.publish
Copy-Item -Recurse -Force ./wwwroot/* ../roozbime.github.io.pages/
Set-Location ../roozbime.github.io.pages
git add . --all
git commit -m "update"
git push origin pages