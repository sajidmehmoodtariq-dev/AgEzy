$commonStyles = @"
    :root{
      --green-dark:#1a3d28;--green-mid:#1b7239;--green:#00ab4f;
      --orange:#f5a623;--red:#d63031;--blue:#2d5bd4;
      --text:#1a2a3a;--muted:#8898aa;--border:#eaeef2;--bg:#f4f6f4;--card:#fff;
    }
    *{box-sizing:border-box;margin:0;padding:0;}
    html,body{width:100%;height:100%;background:#e0e0e0;font-family:"Segoe UI",system-ui,sans-serif;overflow:hidden;}
    .viewport{position:fixed;inset:0;display:flex;align-items:center;justify-content:center;padding:16px;}
    .screen{width:390px;height:844px;transform:scale(var(--app-scale,1));transform-origin:center;background:var(--bg);border-radius:26px;overflow:hidden;box-shadow:0 28px 80px rgba(0,0,0,.22);display:flex;flex-direction:column;position:relative;}

    .header{flex:0 0 auto;background:var(--green-dark);padding:14px 16px 14px;display:flex;align-items:center;gap:10px;}
    .h-back{width:34px;height:34px;border-radius:50%;display:flex;align-items:center;justify-content:center;cursor:pointer;border:none;background:rgba(255,255,255,.12);}
    .h-title{flex:1;font-size:17px;font-weight:800;color:#fff;letter-spacing:-.02em;text-align:center;padding-right:34px;}

    .body{flex:1;overflow-y:auto;padding:16px;scrollbar-width:none;}
    .body::-webkit-scrollbar{display:none;}
    
    .invoice-card { background: var(--card); border-radius: 16px; padding: 24px; box-shadow: 0 4px 16px rgba(0,0,0,.08); border-top: 6px solid var(--green-mid); position: relative; }
    .invoice-card::after { content: ''; position: absolute; left: 16px; right: 16px; bottom: 0; height: 12px; background: repeating-linear-gradient(45deg, transparent, transparent 10px, #f4f6f4 10px, #f4f6f4 20px); border-radius: 0 0 16px 16px; }
    
    .inv-header { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 20px; }
    .inv-logo { font-size: 20px; font-weight: 900; color: var(--green-dark); letter-spacing: -1px; }
    .inv-status { background: #e4ecfd; color: var(--blue); padding: 4px 10px; border-radius: 20px; font-size: 10px; font-weight: 800; text-transform: uppercase; }
    
    .inv-details { margin-bottom: 24px; }
    .inv-row { display: flex; justify-content: space-between; margin-bottom: 8px; }
    .inv-lbl { color: var(--muted); font-size: 12px; font-weight: 600; }
    .inv-val { color: var(--text); font-size: 13px; font-weight: 700; text-align: right; }
    
    .divider { height: 1px; border-bottom: 1px dashed var(--border); margin: 16px 0; }
    
    .item-row { display: flex; justify-content: space-between; margin-bottom: 12px; }
    .item-title { font-size: 14px; font-weight: 700; color: var(--text); margin-bottom: 4px; }
    .item-desc { font-size: 11px; color: var(--muted); }
    .item-price { font-size: 14px; font-weight: 700; color: var(--text); }
    
    .total-row { display: flex; justify-content: space-between; align-items: center; margin-top: 20px; }
    .total-lbl { font-size: 16px; font-weight: 800; color: var(--text); }
    .total-val { font-size: 24px; font-weight: 900; color: var(--green-dark); }
    
    .bottom-actions { flex: 0 0 auto; background: #fff; padding: 16px; border-top: 1px solid var(--border); }
    .btn-primary { display:block; width:100%; padding:16px; border-radius:16px; background:var(--blue); color:#fff; font-size:16px; font-weight:800; text-align:center; cursor:pointer; border:none; transition:opacity .15s; }
    .btn-primary:active { opacity: .85; }

    @media(max-width:767px){.viewport{padding:0}.screen{width:390px;height:844px;border-radius:0;box-shadow:none}}
"@

$invoiceHtml = @"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover" />
  <title>AgEzy – Generate Invoice</title>
  <style>
$commonStyles
  </style>
</head>
<body>
<div class="viewport"><main class="screen">

  <header class="header">
    <button class="h-back" onclick="window.location.href='job-detail.html'">
      <svg width="20" height="20" viewBox="0 0 24 24" fill="none"><path d="M19 12H5M12 5l-7 7 7 7" stroke="#fff" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"/></svg>
    </button>
    <div class="h-title">Generate Invoice</div>
  </header>
  
  <div class="body">
    <div style="font-size:12px; font-weight:800; color:var(--muted); text-transform:uppercase; letter-spacing:.08em; margin-bottom:12px; text-align:center;">Review Invoice Details</div>
    
    <div class="invoice-card">
      <div class="inv-header">
        <div class="inv-logo">AgEzy</div>
        <div class="inv-status">Draft</div>
      </div>
      
      <div class="inv-details">
        <div class="inv-row">
          <div class="inv-lbl">Invoice To</div>
          <div class="inv-val">Green Valley Farms</div>
        </div>
        <div class="inv-row">
          <div class="inv-lbl">Job Reference</div>
          <div class="inv-val" id="invJobId">JOB-2025-089</div>
        </div>
        <div class="inv-row">
          <div class="inv-lbl">Date</div>
          <div class="inv-val">Oct 25, 2023</div>
        </div>
      </div>
      
      <div class="divider"></div>
      
      <div style="font-size:11px; font-weight:800; color:var(--muted); text-transform:uppercase; letter-spacing:.05em; margin-bottom:12px;">Items</div>
      
      <div class="item-row">
        <div>
          <div class="item-title" id="invTitle">Hay Cutting & Baling</div>
          <div class="item-desc">Contract work at Green Acres Farm</div>
        </div>
        <div class="item-price">$1,250.00</div>
      </div>
      
      <div class="divider"></div>
      
      <div class="total-row">
        <div class="total-lbl">Total Due</div>
        <div class="total-val">$1,250.00</div>
      </div>
    </div>
    
  </div>
  
  <div class="bottom-actions">
    <button class="btn-primary" onclick="alert('Invoice Sent Successfully!'); window.location.href='jobs-hub.html';">Send Invoice &rarr;</button>
  </div>
</main></div>
<script>
  const baseW=390,baseH=844,pad=32;
  const scale=()=>{const s=Math.min((innerWidth-pad)/baseW,(innerHeight-pad)/baseH,1);document.documentElement.style.setProperty('--app-scale',s.toFixed(4));};
  scale();addEventListener('resize',scale);

  // Populate from sessionStorage
  const jobId     = sessionStorage.getItem('jobId')     || 'JOB-2025-089';
  const jobTitle  = sessionStorage.getItem('jobTitle')  || 'Hay Cutting';

  document.getElementById('invJobId').textContent  = jobId;
  document.getElementById('invTitle').textContent = jobTitle;
</script>
</body></html>
"@

Set-Content -Path "invoice-preview.html" -Value $invoiceHtml -NoNewline
Write-Host "Created invoice-preview.html"
