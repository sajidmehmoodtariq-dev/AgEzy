$file = "commodity-catalog.html"
$content = Get-Content $file -Raw

# 1. Update Title and Header
$content = $content -replace '<title>Commodity Catalog – AgEzy</title>', '<title>Stock On Hand – AgEzy</title>'
$content = $content -replace '<span class="hdr-title">Commodity Catalog</span>', '<span class="hdr-title">Stock On Hand</span>'
$content = $content -replace 'onclick="window.location.href=''settings.html''"', 'onclick="window.location.href=''dashboard.html''"'

# 2. Replace the old <nav class="nav"> block with unified nav
$oldNav = '(?s)  <!-- Bottom Nav -->.*?  </nav>'
$unifiedNav = @"
          <!-- BOTTOM NAV (Solid Bar Style) -->
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
      <div class="nav-item " onclick="window.location.href='dashboard.html'">
        <div class="nav-icon "><img src="images/nav-home.png" alt="Home" /></div>
        <div class="nav-label">Home</div>
      </div>
      <!-- Contracting -->
      <div class="nav-item " onclick="window.location.href='jobs-hub.html'">
        <div class="nav-icon "><img src="images/nav-contract-work.png" alt="Contracting" /></div>
        <div class="nav-label">Contracting</div>
      </div>
      <!-- Stock On Hand -->
      <div class="nav-item active" onclick="window.location.href='commodity-catalog.html'">
        <div class="nav-icon active"><img src="images/nav-contracts.png" alt="Stock On Hand" style="filter:invert(30%) sepia(0%) saturate(0%) brightness(60%); width:auto; object-fit:contain;" /></div>
        <div class="nav-label">Stock On Hand</div>
      </div>
      <!-- Timesheets -->
      <div class="nav-item " onclick="window.location.href='timesheets-list.html'">
        <div class="nav-icon "><svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#8898aa" stroke-width="2"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg></div>
        <div class="nav-label">Timesheets</div>
      </div>
      <!-- Map -->
      <div class="nav-item " onclick="window.location.href='farm-map.html'">
        <div class="nav-icon "><svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#8898aa" stroke-width="2"><polygon points="1 6 1 22 8 18 16 22 23 18 23 2 16 6 8 2 1 6"/><line x1="8" y1="2" x2="8" y2="18"/><line x1="16" y1="6" x2="16" y2="22"/></svg></div>
        <div class="nav-label">Map</div>
      </div>
    </nav>
"@

$content = $content -replace $oldNav, $unifiedNav

Set-Content -Path $file -Value $content -NoNewline
Write-Host "Updated $file"
