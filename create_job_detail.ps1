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

    .header{flex:0 0 auto;background:var(--green-dark);padding:14px 16px 20px;display:flex;flex-direction:column;}
    .h-top { display: flex; align-items: center; justify-content: space-between; }
    .h-back{width:34px;height:34px;border-radius:50%;display:flex;align-items:center;justify-content:center;cursor:pointer;border:none;background:rgba(255,255,255,.12);}
    .h-more{width:34px;height:34px;border-radius:50%;display:flex;align-items:center;justify-content:center;cursor:pointer;border:none;background:rgba(255,255,255,.12);color:#fff;font-size:20px;font-weight:700;}
    .h-titles { text-align: center; margin-top: -10px; }
    .h-title{font-size:22px;font-weight:800;color:#fff;}
    .h-sub{font-size:13px;color:rgba(255,255,255,.7);font-weight:600;margin-top:2px;}
    
    .status-container { display: flex; justify-content: center; margin-top: 14px; }
    .status-pill{padding:6px 16px;border-radius:20px;font-size:12px;font-weight:800;letter-spacing:.05em;text-transform:uppercase;}
    .status-pill.scheduled{background:#e4ecfd;color:var(--blue);}
    .status-pill.in-progress{background:#fef3e2;color:var(--orange);}
    .status-pill.completed{background:#e4f8ee;color:var(--green-mid);}

    .tab-bar { flex: 0 0 auto; display: flex; background: var(--green-dark); }
    .tab { flex: 1; text-align: center; padding: 12px 0; color: rgba(255,255,255,.5); font-size: 13px; font-weight: 700; cursor: pointer; border-bottom: 3px solid transparent; transition: all 0.2s; }
    .tab.active { color: #fff; border-color: var(--green); }

    .body{flex:1;overflow-y:auto;padding:16px;scrollbar-width:none;}
    .body::-webkit-scrollbar{display:none;}
    
    .tab-content { display: none; }
    .tab-content.active { display: block; }
    
    .completed-banner { display: none; background: #e4f8ee; border: 1px solid var(--green-mid); border-radius: 14px; padding: 16px; margin-bottom: 16px; text-align: center; }
    .completed-banner.show { display: block; }
    .cb-icon { width: 40px; height: 40px; background: var(--green-mid); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 10px; color: #fff; }
    .cb-title { font-size: 16px; font-weight: 800; color: var(--green-dark); margin-bottom: 4px; }
    .cb-sub { font-size: 12px; color: var(--green-mid); font-weight: 600; }

    .card { background: var(--card); border-radius: 14px; padding: 16px; margin-bottom: 12px; border: 1px solid var(--border); }
    .card-title { font-size: 11px; font-weight: 800; color: var(--muted); text-transform: uppercase; letter-spacing: .08em; margin-bottom: 12px; }
    
    .info-row{display:flex;align-items:center;gap:12px;margin-bottom:12px;}
    .info-row:last-child { margin-bottom: 0; }
    .info-ic{width:36px;height:36px;border-radius:10px;background:#f4f6f4;display:flex;align-items:center;justify-content:center;flex:0 0 36px;}
    .info-lbl{font-size:11px;font-weight:700;color:var(--muted);text-transform:uppercase;letter-spacing:.05em;}
    .info-val{font-size:14px;font-weight:700;color:var(--text);margin-top:2px;}
    
    .val-row { display: flex; justify-content: space-between; align-items: center; }
    .val-amount { font-size: 24px; font-weight: 800; color: var(--green-dark); }
    
    .ops-row{display:flex;gap:8px;align-items:center;flex-wrap:wrap;}
    .op-chip{display:flex;align-items:center;gap:6px;background:#f4f6f4;border-radius:20px;padding:5px 12px 5px 5px;}
    .op-av{width:28px;height:28px;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:10px;font-weight:800;color:#fff;}
    .op-nm{font-size:13px;font-weight:600;color:var(--text);}
    
    .mach-row{display:flex;align-items:center;gap:12px;padding:10px 0;border-bottom:1px solid var(--border);}
    .mach-row:last-child{border-bottom:none;}
    .mach-ic{width:40px;height:40px;border-radius:10px;background:#f0f4f0;display:flex;align-items:center;justify-content:center;flex:0 0 40px;}
    .mach-nm{font-size:14px;font-weight:700;color:var(--text);}
    .mach-sb{font-size:12px;color:var(--muted);}

    /* BOTTOM ACTIONS */
    .bottom-actions { flex: 0 0 auto; background: #fff; padding: 16px; border-top: 1px solid var(--border); }
    .btn-primary { display:block; width:100%; padding:16px; border-radius:16px; background:var(--blue); color:#fff; font-size:16px; font-weight:800; text-align:center; cursor:pointer; border:none; transition:opacity .15s; }
    .btn-primary:active { opacity: .85; }
    
    .btn-primary.completed { background: var(--green-mid); }
    
    /* BOTTOM SHEET OVERLAY */
    .backdrop{position:absolute;inset:0;background:rgba(0,0,0,.45);z-index:20;display:none;align-items:flex-end;}
    .backdrop.show{display:flex;}
    .sheet{background:#fff;border-radius:24px 24px 0 0;width:100%;max-height:92%;display:flex;flex-direction:column;transform:translateY(100%);transition:transform .3s cubic-bezier(.4,0,.2,1);}
    .backdrop.show .sheet{transform:translateY(0);}
    .sheet-handle{width:40px;height:4px;border-radius:2px;background:#dde;margin:12px auto 0;}
    .sheet-header{padding:16px;display:flex;align-items:center;justify-content:space-between;border-bottom:1px solid var(--border);}
    .sheet-title{font-size:18px;font-weight:800;color:var(--text);}
    .sheet-close{width:32px;height:32px;border-radius:50%;background:#f4f6f4;display:flex;align-items:center;justify-content:center;cursor:pointer;border:none;}
    .sheet-body{padding:16px; display: flex; flex-direction: column; gap: 12px;}
    
    .action-opt { display: flex; align-items: center; gap: 14px; padding: 16px; background: #f8faf8; border-radius: 16px; cursor: pointer; border: 1px solid var(--border); transition: background 0.1s; }
    .action-opt:active { background: #f0f4f0; }
    .action-opt .ic { width: 44px; height: 44px; border-radius: 12px; background: #fff; display: flex; align-items: center; justify-content: center; box-shadow: 0 2px 5px rgba(0,0,0,.05); }
    .action-opt .txt { flex: 1; }
    .action-opt .title { font-size: 15px; font-weight: 700; color: var(--text); margin-bottom: 2px; }
    .action-opt .sub { font-size: 12px; color: var(--muted); }
    
    .action-opt.complete { border-color: var(--green-mid); background: #f0faf4; }
    .action-opt.complete .ic { color: var(--green-mid); }
    .action-opt.complete .title { color: var(--green-dark); }

    /* BOTTOM NAV */
    .bottom-nav { flex:0 0 auto; height:70px; background:#fff; border-top:1px solid #e8ede8; display:flex; align-items:center; padding:0 10px; }
    .nav-item { flex:1; display:flex; flex-direction:column; align-items:center; justify-content:center; gap:3px; cursor:pointer; padding:4px; }
    .nav-ic { width:40px; height:40px; border-radius:50%; display:flex; align-items:center; justify-content:center; }
    .nav-ic.active { background:var(--green-dark); }
    .nav-lbl { font-size:10px; font-weight:600; color:var(--muted); }
    .nav-lbl.active { color:var(--green-dark); }

    @media(max-width:767px){.viewport{padding:0}.screen{width:390px;height:844px;border-radius:0;box-shadow:none}}
"@

$jobDetailHtml = @"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover" />
  <title>AgEzy – Job Detail</title>
  <style>
$commonStyles
  </style>
</head>
<body>
<div class="viewport"><main class="screen">

  <header class="header">
    <div class="h-top">
      <button class="h-back" onclick="window.location.href='jobs-hub.html'">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none"><path d="M19 12H5M12 5l-7 7 7 7" stroke="#fff" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"/></svg>
      </button>
      <button class="h-more">···</button>
    </div>
    <div class="h-titles">
      <div class="h-title" id="jobTitle">Hay Cutting & Baling</div>
      <div class="h-sub" id="jobId">JOB-2025-089</div>
    </div>
    <div class="status-container">
      <div class="status-pill in-progress" id="statusPill">In Progress</div>
    </div>
  </header>
  
  <div class="tab-bar">
    <div class="tab active" onclick="switchTab('overview', this)">Overview</div>
    <div class="tab" onclick="switchTab('resources', this)">Resources</div>
    <div class="tab" onclick="switchTab('documents', this)">Documents</div>
  </div>

  <div class="body">
    
    <div id="tab-overview" class="tab-content active">
      <div class="completed-banner" id="completedBanner">
        <div class="cb-icon">
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none"><path d="M5 13l4 4L19 7" stroke="#fff" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/></svg>
        </div>
        <div class="cb-title">Job Completed!</div>
        <div class="cb-sub">Completed on <span id="compDate">Nov 2, 2023</span></div>
      </div>
    
      <div class="card">
        <div class="card-title">Job Details</div>
        
        <div class="info-row">
          <div class="info-ic">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none"><rect x="3" y="4" width="18" height="18" rx="2" ry="2" stroke="#8898aa" stroke-width="2"/><line x1="16" y1="2" x2="16" y2="6" stroke="#8898aa" stroke-width="2"/><line x1="8" y1="2" x2="8" y2="6" stroke="#8898aa" stroke-width="2"/><line x1="3" y1="10" x2="21" y2="10" stroke="#8898aa" stroke-width="2"/></svg>
          </div>
          <div>
            <div class="info-lbl">Schedule</div>
            <div class="info-val">Oct 24, 2023 · 07:30 AM</div>
          </div>
        </div>
        
        <div class="info-row">
          <div class="info-ic">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none"><circle cx="12" cy="10" r="3" stroke="#8898aa" stroke-width="2"/><path d="M12 2C7.58 2 4 5.58 4 10c0 5.5 8 12 8 12s8-6.5 8-12c0-4.42-3.58-8-8-8z" stroke="#8898aa" stroke-width="2" stroke-linejoin="round"/></svg>
          </div>
          <div>
            <div class="info-lbl">Location</div>
            <div class="info-val" id="jobLoc">Green Valley Farms - Block C</div>
          </div>
        </div>
      </div>
      
      <div class="card">
        <div class="card-title">Estimated Contract Value</div>
        <div class="val-row">
          <div class="val-amount">$1,250.00</div>
          <div style="font-size:12px; color:var(--muted); font-weight:600;">Subject to final</div>
        </div>
      </div>
      
      <div class="card">
        <div class="card-title">Team on site</div>
        <div class="ops-row">
          <div class="op-chip"><div class="op-av" style="background:#1b7239">JG</div><div class="op-nm">John G.</div></div>
          <div class="op-chip"><div class="op-av" style="background:#2d5bd4">SM</div><div class="op-nm">Sarah M.</div></div>
        </div>
      </div>
    </div>
    
    <div id="tab-resources" class="tab-content">
      <div class="card">
        <div class="card-title">Machinery</div>
        <div class="mach-row">
          <div class="mach-ic">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none"><rect x="2" y="11" width="20" height="9" rx="2" stroke="#8898aa" stroke-width="2"/><path d="M6 11V7a6 6 0 0 1 12 0v4" stroke="#8898aa" stroke-width="2" stroke-linecap="round"/></svg>
          </div>
          <div style="flex:1">
            <div class="mach-nm">Big Red Harvester</div>
            <div class="mach-sb">Header 40ft · Reg: ABC-123</div>
          </div>
        </div>
        <div class="mach-row">
          <div class="mach-ic">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none"><path d="M5 17H3a2 2 0 0 1-2-2v-4a2 2 0 0 1 2-2h14l4 4v2a2 2 0 0 1-2 2h-1" stroke="#8898aa" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/></svg>
          </div>
          <div style="flex:1">
            <div class="mach-nm">John's Deere 8R</div>
            <div class="mach-sb">Tractor · Reg: XYZ-456</div>
          </div>
        </div>
      </div>
    </div>
    
    <div id="tab-documents" class="tab-content">
      <div class="card" style="text-align: center; padding: 40px 20px;">
        <svg width="32" height="32" viewBox="0 0 24 24" fill="none" style="margin-bottom:12px"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8Z" stroke="#8898aa" stroke-width="2" stroke-linejoin="round"/><path d="M14 2v6h6M12 18v-6M9 15h6" stroke="#8898aa" stroke-width="2" stroke-linecap="round"/></svg>
        <div style="font-size:14px; font-weight:700; color:var(--text);">No documents yet</div>
        <div style="font-size:12px; color:var(--muted); margin-top:4px;">Invoices and pre-start checklists will appear here</div>
      </div>
    </div>

  </div>
  
  <div class="bottom-actions">
    <button class="btn-primary" id="mainActionBtn" onclick="openUpdateSheet()">Update Progress</button>
  </div>
  
  <!-- UPDATE PROGRESS SHEET -->
  <div class="backdrop" id="updateSheetBackdrop" onclick="handleBackdropClick(event)">
    <div class="sheet" id="updateSheet">
      <div class="sheet-handle"></div>
      <div class="sheet-header">
        <div class="sheet-title">Update Progress</div>
        <button class="sheet-close" onclick="closeUpdateSheet()">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none"><path d="M18 6L6 18M6 6l12 12" stroke="#1a2a3a" stroke-width="2.2" stroke-linecap="round"/></svg>
        </button>
      </div>
      <div class="sheet-body">
        
        <div class="action-opt">
          <div class="ic">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7" stroke="#1a2a3a" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z" stroke="#1a2a3a" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/></svg>
          </div>
          <div class="txt">
            <div class="title">Add Job Note</div>
            <div class="sub">Log machinery issues or delays</div>
          </div>
        </div>
        
        <div class="action-opt complete" onclick="markComplete()">
          <div class="ic">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none"><path d="M5 13l4 4L19 7" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/></svg>
          </div>
          <div class="txt">
            <div class="title">Mark as Complete</div>
            <div class="sub">Finish job and prepare for invoicing</div>
          </div>
        </div>
        
      </div>
    </div>
  </div>

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
      <div class="nav-item active" onclick="window.location.href='jobs-hub.html'">
        <div class="nav-icon active"><img src="images/nav-contract-work.png" alt="Contracting" /></div>
        <div class="nav-label">Contracting</div>
      </div>
      <!-- Stock On Hand -->
      <div class="nav-item " onclick="window.location.href='contracts-list.html'">
        <div class="nav-icon "><img src="images/nav-contracts.png" alt="Stock On Hand" style="filter:invert(30%) sepia(0%) saturate(0%) brightness(60%); width:auto; object-fit:contain;" /></div>
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
</main></div>
<script>
  const baseW=390,baseH=844,pad=32;
  const scale=()=>{const s=Math.min((innerWidth-pad)/baseW,(innerHeight-pad)/baseH,1);document.documentElement.style.setProperty('--app-scale',s.toFixed(4));};
  scale();addEventListener('resize',scale);

  // Populate from sessionStorage
  const jobId     = sessionStorage.getItem('jobId')     || 'JOB-2025-089';
  const jobTitle  = sessionStorage.getItem('jobTitle')  || 'Hay Cutting';
  let jobStatus = sessionStorage.getItem('jobStatus') || 'in-progress';

  document.getElementById('jobId').textContent  = jobId;
  document.getElementById('jobTitle').textContent = jobTitle;
  
  const pill = document.getElementById('statusPill');
  const labels = {scheduled:'Scheduled','in-progress':'In Progress',completed:'Completed'};
  
  function applyStatus() {
    pill.textContent = labels[jobStatus] || 'In Progress';
    pill.className = 'status-pill ' + jobStatus;
    
    const mainBtn = document.getElementById('mainActionBtn');
    
    if(jobStatus === 'completed') {
      document.getElementById('completedBanner').classList.add('show');
      mainBtn.textContent = "Generate Invoice";
      mainBtn.className = "btn-primary completed";
      mainBtn.onclick = () => window.location.href = 'invoice-preview.html';
    } else {
      document.getElementById('completedBanner').classList.remove('show');
      mainBtn.textContent = "Update Progress";
      mainBtn.className = "btn-primary";
      mainBtn.onclick = openUpdateSheet;
    }
  }
  
  applyStatus();

  function switchTab(tabId, el) {
    document.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));
    el.classList.add('active');
    
    document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));
    document.getElementById('tab-' + tabId).classList.add('active');
  }

  function openUpdateSheet(){
    document.getElementById('updateSheetBackdrop').classList.add('show');
  }
  function closeUpdateSheet(){
    document.getElementById('updateSheetBackdrop').classList.remove('show');
  }
  function handleBackdropClick(e){
    if(e.target===document.getElementById('updateSheetBackdrop')) closeUpdateSheet();
  }
  
  function markComplete() {
    jobStatus = 'completed';
    sessionStorage.setItem('jobStatus', jobStatus);
    applyStatus();
    closeUpdateSheet();
  }

</script>
</body></html>
"@

Set-Content -Path "job-detail.html" -Value $jobDetailHtml -NoNewline
Write-Host "Re-created job-detail.html"
