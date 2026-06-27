$file = "commodity-catalog.html"
$content = Get-Content $file -Raw

$bad = @"
    <div class="ftab" onclick="setTab(this,'fuel')">Fuel</div>
    <div class="sec-lbl" id="sec-label">All Commodities</div>
    <div id="com-list"></div>
  </div>

  <!-- FAB -->
"@

$good = @"
    <div class="ftab" onclick="setTab(this,'fuel')">Fuel</div>
    <div class="ftab" onclick="setTab(this,'other')">Other</div>
  </div>

  <!-- Stats strip -->
  <div class="stats-strip">
    <div class="stat-item"><div class="stat-num" id="st-total">14</div><div class="stat-lbl">Items</div></div>
    <div class="stat-item"><div class="stat-num">124</div><div class="stat-lbl">Stock In</div></div>
    <div class="stat-item"><div class="stat-num">86</div><div class="stat-lbl">Stock Out</div></div>
    <div class="stat-item"><div class="stat-num">$42k</div><div class="stat-lbl">Est. Value</div></div>
  </div>

  <!-- Body -->
  <div class="body" id="body">
    <div class="sec-lbl" id="sec-label">All Commodities</div>
    <div id="com-list"></div>
  </div>

  <!-- FAB -->
"@

$newContent = $content.Replace($bad.Replace("`r`n", "`n"), $good.Replace("`r`n", "`n"))
Set-Content -Path $file -Value $newContent -NoNewline
Write-Host "Fixed!"
