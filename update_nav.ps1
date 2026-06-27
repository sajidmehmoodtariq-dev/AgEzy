$htmlFiles = Get-ChildItem -Filter *.html

$navTemplate = @"
    <!-- BOTTOM NAV (Solid Bar Style) -->
    <nav class="bottom-nav" style="justify-content: space-around; padding: 0 5px;">
      <!-- Home -->
      <div class="nav-item {{home_active}}" onclick="window.location.href='dashboard.html'">
        <div class="nav-icon"><img src="images/nav-home.png" alt="Home" /></div>
        <div class="nav-label">Home</div>
      </div>
      <!-- Contracting -->
      <div class="nav-item {{contracting_active}}" onclick="window.location.href='jobs-hub.html'">
        <div class="nav-icon"><img src="images/nav-contract-work.png" alt="Contracting" /></div>
        <div class="nav-label">Contracting</div>
      </div>
      <!-- Stock On Hand -->
      <div class="nav-item {{stock_active}}" onclick="window.location.href='contracts-list.html'">
        <div class="nav-icon"><img src="images/nav-contracts.png" alt="Stock On Hand" style="filter:invert(30%) sepia(0%) saturate(0%) brightness(60%); width:auto; object-fit:contain;" /></div>
        <div class="nav-label">Stock On Hand</div>
      </div>
      <!-- Timesheets -->
      <div class="nav-item {{timesheets_active}}" onclick="window.location.href='timesheets-list.html'">
        <div class="nav-icon"><svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#8898aa" stroke-width="2"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg></div>
        <div class="nav-label">Timesheets</div>
      </div>
      <!-- Map -->
      <div class="nav-item {{map_active}}" onclick="window.location.href='farm-map.html'">
        <div class="nav-icon"><img src="images/nav-map.png" alt="Map" /></div>
        <div class="nav-label">Map</div>
      </div>
    </nav>
"@

foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw

    $homeActive = ""
    $contractingActive = ""
    $stockActive = ""
    $timesheetsActive = ""
    $mapActive = ""

    if ($file.Name -match "dashboard|index|recent-activity|user-management") {
        $homeActive = "active"
    } elseif ($file.Name -match "job|daily-team") {
        $contractingActive = "active"
    } elseif ($file.Name -match "contract|stock") {
        $stockActive = "active"
    } elseif ($file.Name -match "timesheet") {
        $timesheetsActive = "active"
    } elseif ($file.Name -match "map|farm-manage") {
        $mapActive = "active"
    }

    $navHtml = $navTemplate.Replace("{{home_active}}", $homeActive).Replace("{{contracting_active}}", $contractingActive).Replace("{{stock_active}}", $stockActive).Replace("{{timesheets_active}}", $timesheetsActive).Replace("{{map_active}}", $mapActive)

    # Use regex to replace everything from <nav class="bottom-nav"> to </nav>
    $pattern = '(?s)<nav class="bottom-nav"[^>]*>.*?</nav>'
    
    if ($content -match $pattern) {
        $newContent = [regex]::Replace($content, $pattern, $navHtml)
        Set-Content -Path $file.FullName -Value $newContent -NoNewline
        Write-Host "Updated $($file.Name)"
    }
}
