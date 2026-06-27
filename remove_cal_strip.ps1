$file = "jobs-hub.html"
$content = Get-Content $file -Raw

# Remove the cal-strip HTML block completely
$pattern = '(?s)<!-- CALENDAR STRIP -->\s*<div class="cal-strip">.*?</div>\s*</div>'
$content = [regex]::Replace($content, $pattern, '')

# Also remove the JS logic for calendar days
$jsPattern = '(?s)// Calendar days\s*document\.querySelectorAll\(''\.cal-day''\).*?\}\);'
$content = [regex]::Replace($content, $jsPattern, '')

Set-Content -Path $file -Value $content -NoNewline
Write-Host "Done"
