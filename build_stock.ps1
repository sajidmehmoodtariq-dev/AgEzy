$content = Get-Content "commodity-catalog.html"
$newContent = @()
$skip = $false

foreach ($line in $content) {
    if ($line -match '<div class="ftab" onclick="setTab\(this,''fuel''\)">Fuel</div>') {
        $newContent += $line
        $newContent += "    <div class=`"ftab`" onclick=`"setTab(this,'other')`">Other</div>"
        $newContent += "  </div>"
        $newContent += ""
        $newContent += "  <!-- Stats strip -->"
        $newContent += "  <div class=`"stats-strip`">"
        $newContent += "    <div class=`"stat-item`"><div class=`"stat-num`" id=`"st-total`">14</div><div class=`"stat-lbl`">Items</div></div>"
        $newContent += "    <div class=`"stat-item`"><div class=`"stat-num`">124</div><div class=`"stat-lbl`">Stock In</div></div>"
        $newContent += "    <div class=`"stat-item`"><div class=`"stat-num`">86</div><div class=`"stat-lbl`">Stock Out</div></div>"
        $newContent += "    <div class=`"stat-item`"><div class=`"stat-num`">`$42k</div><div class=`"stat-lbl`">Est. Value</div></div>"
        $newContent += "  </div>"
        $newContent += ""
        $newContent += "  <!-- Body -->"
        $newContent += "  <div class=`"body`" id=`"body`">"
        continue
    }
    
    if ($line -match '<div class="sec-lbl" id="sec-label">All Commodities</div>') {
        $newContent += $line
        continue
    }

    $newContent += $line
}

Set-Content -Path "commodity-catalog.html" -Value $newContent
Write-Host "Rebuilt"
