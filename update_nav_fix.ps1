$htmlFiles = Get-ChildItem -Filter *.html

$navTemplate = @"
    <style id="unified-nav-style">
      #unified-nav.bottom-nav {
        flex: 0 0 auto;
        height: 70px;
        background: #fff;
        border-top: 1px solid #e8ede8;
        display: flex; align-items: center; justify-content: space-around;
        padding: 0 10px; gap: 5px;
        margin-top: auto; z-index: 100;
        position: relative;
      }
      #unified-nav .nav-item {
        flex: 1; display: flex; flex-direction: column;
        align-items: center; justify-content: center; gap: 4px;
        cursor: pointer; padding: 6px 4px; border: none; background: transparent; text-decoration: none;
      }
      #unified-nav .nav-icon {
        width: 44px; height: 44px;
        display: flex; align-items: center; justify-content: center;
        border-radius: 50%;
      }
      #unified-nav .nav-icon.active { background: var(--green-dark, #1b7239); }
      #unified-nav .nav-icon img, #unified-nav .nav-icon svg { width: 22px; height: 22px; opacity: 0.8; }
      #unified-nav .nav-icon.active img { filter: brightness(0) invert(1) !important; opacity: 1; }
      #unified-nav .nav-icon.active svg { stroke: #fff !important; opacity: 1; }
      #unified-nav .nav-label { font-size: 9px; font-weight: 600; color: var(--muted, #8898aa); text-align: center; line-height: 1.1; white-space: nowrap; margin: 0; }
      #unified-nav .nav-item.active .nav-label { color: var(--green-dark, #1b7239); }
    </style>
    <nav id="unified-nav" class="bottom-nav">
      <!-- Home -->
      <div class="nav-item {{home_active}}" onclick="window.location.href='dashboard.html'">
        <div class="nav-icon {{home_active}}"><img src="images/nav-home.png" alt="Home" /></div>
        <div class="nav-label">Home</div>
      </div>
      <!-- Contracting -->
      <div class="nav-item {{contracting_active}}" onclick="window.location.href='jobs-hub.html'">
        <div class="nav-icon {{contracting_active}}"><img src="images/nav-contract-work.png" alt="Contracting" /></div>
        <div class="nav-label">Contracting</div>
      </div>
      <!-- Inventory -->
      <div class="nav-item {{stock_active}}" onclick="window.location.href='commodity-catalog.html'">
        <div class="nav-icon {{stock_active}}">
          <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#8898aa" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <rect x="2" y="7" width="20" height="14" rx="2" ry="2"/>
            <path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"/>
          </svg>
        </div>
        <div class="nav-label">Inventory</div>
      </div>
      <!-- Timesheets -->
      <div class="nav-item {{timesheets_active}}" onclick="window.location.href='timesheets-list.html'">
        <div class="nav-icon {{timesheets_active}}"><svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#8898aa" stroke-width="2"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg></div>
        <div class="nav-label">Timesheets</div>
      </div>
      <!-- Map -->
      <div class="nav-item {{map_active}}" onclick="window.location.href='farm-map.html'">
        <div class="nav-icon {{map_active}}"><svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#8898aa" stroke-width="2"><polygon points="1 6 1 22 8 18 16 22 23 18 23 2 16 6 8 2 1 6"/><line x1="8" y1="2" x2="8" y2="18"/><line x1="16" y1="6" x2="16" y2="22"/></svg></div>
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

    if ($file.Name -match "dashboard|index|recent-activity|user-management|customers") {
        $homeActive = "active"
    } elseif ($file.Name -match "job|daily-team|contracts-list|create-contract|contract-detail") {
        $contractingActive = "active"
    } elseif ($file.Name -match "stock|commodity|load-out") {
        $stockActive = "active"
    } elseif ($file.Name -match "timesheet") {
        $timesheetsActive = "active"
    } elseif ($file.Name -match "map|farm-manage") {
        $mapActive = "active"
    }

    $navHtml = $navTemplate.Replace("{{home_active}}", $homeActive).Replace("{{contracting_active}}", $contractingActive).Replace("{{stock_active}}", $stockActive).Replace("{{timesheets_active}}", $timesheetsActive).Replace("{{map_active}}", $mapActive)

    # Clean up old injected style if it exists but we missed it (now using an ID makes it easier, but just to be safe we'll strip any old <style id="unified-nav-style">)
    $content = [regex]::Replace($content, '(?s)<style id="unified-nav-style">.*?</style>\s*', '')

    $pattern = '(?s)<nav [^>]*class="bottom-nav"[^>]*>.*?</nav>'
    
    if ($content -match $pattern) {
        $newContent = [regex]::Replace($content, $pattern, $navHtml)
        Set-Content -Path $file.FullName -Value $newContent -NoNewline
        Write-Host "Updated $($file.Name)"
    }
}
