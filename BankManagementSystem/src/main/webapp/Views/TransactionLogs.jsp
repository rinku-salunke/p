<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SBI CORE | Transaction Audit Terminal</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --sbi-dark: #0f172a;      /* Sidebar Navy */
            --sbi-blue: #1a4da1;      /* Primary Blue */
            --sbi-footer: #2c007e;    /* Footer Deep Purple */
            --sbi-yellow: #ffcc00;    /* Footer Accent */
            --sidebar-width: 260px;
            --bg-light: #f3f6f9;
        }

        body { font-family: 'Inter', sans-serif; background-color: var(--bg-light); margin: 0; display: flex; flex-direction: column; min-height: 100vh; }

        /* Sidebar Navigation */
        .sidebar { width: var(--sidebar-width); background-color: var(--sbi-dark); height: 100vh; position: fixed; color: white; padding: 1.5rem; z-index: 1000; }
        .sidebar-brand { display: flex; align-items: center; gap: 12px; margin-bottom: 3rem; border-bottom: 1px solid rgba(255,255,255,0.1); padding-bottom: 1rem; }
        .nav-link { color: rgba(255,255,255,0.7); padding: 0.8rem 1rem; border-radius: 8px; text-decoration: none; display: flex; align-items: center; gap: 12px; transition: 0.3s; margin-bottom: 0.5rem; }
        .nav-link:hover, .nav-link.active { background-color: var(--sbi-blue); color: white; }

        /* Main Workspace */
        .main-content { margin-left: var(--sidebar-width); flex: 1; padding: 2.5rem; }
        
        /* Filter Panel Styling */
        .filter-card { background: white; border-radius: 12px; border: 1px solid #e2e8f0; box-shadow: 0 1px 3px rgba(0,0,0,0.1); }
        .form-control:focus, .form-select:focus { border-color: var(--sbi-blue); box-shadow: 0 0 0 3px rgba(26, 77, 161, 0.1); }

        /* Table Design */
        .log-container { background: white; border-radius: 12px; border: 1px solid #e2e8f0; overflow: hidden; box-shadow: 0 1px 3px rgba(0,0,0,0.1); }
        .table thead { background-color: #f8fafc; border-bottom: 2px solid #f1f5f9; }
        .table thead th { font-size: 0.75rem; text-transform: uppercase; color: #64748b; padding: 1rem; letter-spacing: 0.05em; }
        .table tbody td { vertical-align: middle; padding: 1rem; border-bottom: 1px solid #f1f5f9; font-size: 0.9rem; }

        /* Status & Money Styles */
        .amount-up { color: #10b981; font-weight: 700; }
        .amount-down { color: #ef4444; font-weight: 700; }
        .badge-status { padding: 0.35rem 0.75rem; border-radius: 99px; font-size: 0.7rem; font-weight: 700; text-transform: uppercase; }
        .bg-success-subtle { background: #dcfce7; color: #166534; }
        .bg-danger-subtle { background: #fee2e2; color: #991b1b; }

        /* SBI FOOTER Integration */
        footer { background-color: var(--sbi-footer); color: white; margin-left: var(--sidebar-width); padding: 30px 0 0 0; }
        .footer-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; padding: 0 40px; }
        .footer-column h5 { color: var(--sbi-yellow); font-size: 14px; margin-bottom: 15px; text-transform: uppercase; }
        .footer-column ul { list-style: none; padding: 0; font-size: 12px; }
        .footer-column a { color: rgba(255,255,255,0.8); text-decoration: none; }
        .footer-warning { background: #1a004b; padding: 15px 40px; margin-top: 30px; font-size: 11px; border-top: 3px solid #00a1e1; }
    </style>
</head>
<body>

    <div class="sidebar">
        <div class="sidebar-brand">
            <i class="fas fa-university fs-3"></i>
            <div>
                <h5 class="mb-0 fw-bold">SBI CORE</h5>
                <small class="opacity-50">Enterprise Resource Portal</small>
            </div>
        </div>
        <nav>
            <a href="saveAccount" class="nav-link"><i class="fas fa-users"></i> Account Holders</a>
            <a href="openAccount.jsp" class="nav-link"><i class="fas fa-user-plus"></i> Open New Account</a>
            <a href="transactionLogs" class="nav-link active"><i class="fas fa-exchange-alt"></i> Transaction Logs</a>
            <a href="#" class="nav-link"><i class="fas fa-cog"></i> System Settings</a>
        </nav>
    </div>

    <div class="main-content">
        <div class="d-flex justify-content-between align-items-end mb-4">
            <div>
                <h3 class="fw-bold text-dark mb-1">Audit Trail</h3>
                <p class="text-muted small mb-0">Reviewing systemic financial movements for Jan 16, 2026</p>
            </div>
            <button class="btn btn-white border shadow-sm btn-sm"><i class="fas fa-download me-2"></i>Export CSV</button>
        </div>

        <div class="filter-card p-4 mb-4">
            <form action="filterTransactions" method="get" class="row g-3 align-items-end">
                <div class="col-md-4">
                    <label class="form-label small fw-bold">Search ID / Reference</label>
                    <div class="input-group">
                        <span class="input-group-text bg-light"><i class="fas fa-search"></i></span>
                        <input type="text" name="searchQuery" class="form-control" placeholder="Acc No or Txn ID...">
                    </div>
                </div>
                <div class="col-md-3">
                    <label class="form-label small fw-bold">From Date</label>
                    <input type="date" name="fromDate" class="form-control">
                </div>
                <div class="col-md-3">
                    <label class="form-label small fw-bold">To Date</label>
                    <input type="date" name="toDate" class="form-control">
                </div>
                <div class="col-md-2">
                    <button type="submit" class="btn btn-primary w-100 fw-bold">APPLY FILTERS</button>
                </div>
            </form>
        </div>

        <div class="log-container">
            <div class="p-3 bg-white border-bottom d-flex justify-content-between align-items-center">
                <select class="form-select form-select-sm w-auto" id="typeFilter">
                    <option value="all">All Transactions</option>
                    <option value="deposit">Deposits</option>
                    <option value="withdrawal">Withdrawals</option>
                </select>
                <div class="small text-muted">Showing <strong>3</strong> active logs</div>
            </div>
            
            <table class="table mb-0" id="transactionTable">
                <thead>
                    <tr>
                        <th>Date & Time</th>
                        <th>Reference ID</th>
                        <th>Account Holder</th>
                        <th>Type</th>
                        <th>Amount</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="text-muted">16-Jan-2026 02:15 PM</td>
                        <td class="fw-bold text-primary">#TXN-9901</td>
                        <td>rinku Ashok salunke <br><small class="text-muted">ID-19</small></td>
                        <td><span class="fw-500">Deposit</span></td>
                        <td class="amount-up">+ ₹ 500.0</td>
                        <td><span class="badge-status bg-success-subtle">Success</span></td>
                    </tr>
                    <tr>
                        <td class="text-muted">16-Jan-2026 01:45 PM</td>
                        <td class="fw-bold text-primary">#TXN-9855</td>
                        <td>rinku A salunke <br><small class="text-muted">ID-21</small></td>
                        <td><span class="fw-500">Withdrawal</span></td>
                        <td class="amount-down">- ₹ 200.0</td>
                        <td><span class="badge-status bg-success-subtle">Success</span></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <footer>
        <div class="footer-grid">
            <div class="footer-column">
                <h5>Home</h5>
                <ul>
                    <li><a href="#">Interest Rates</a></li>
                    <li><a href="#">Download Forms</a></li>
                    <li><a href="#">RTI 2005</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h5>NRI</h5>
                <ul>
                    <li><a href="#">Accounts</a></li>
                    <li><a href="#">Investments</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h5>Business</h5>
                <ul>
                    <li><a href="#">CAG & MCG</a></li>
                    <li><a href="#">SME - Loans</a></li>
                </ul>
            </div>
            <div class="footer-column">
                <h5>Security</h5>
                <ul>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Customer Care</a></li>
                </ul>
            </div>
        </div>
        <div class="footer-warning">
            <strong>IMPORTANT:</strong> State Bank of India never asks for your user ID / PIN / OTP through phone or email. Any such attempt is phishing. Inform us at <strong>epg.cms@sbi.co.in</strong>
        </div>
        <div class="bg-white text-muted small py-2 px-4 d-flex justify-content-between">
            <span>&copy; 2026 State Bank of India (APM Id: Webs_Info_875)</span>
            <span>Best viewed in Edge / Chrome 1420x768</span>
        </div>
    </footer>

    <script>
        // Real-time Type Filter
        document.getElementById('typeFilter').addEventListener('change', function() {
            const val = this.value.toLowerCase();
            const rows = document.querySelectorAll('#transactionTable tbody tr');
            rows.forEach(row => {
                const text = row.cells[3].innerText.toLowerCase();
                row.style.display = (val === 'all' || text.includes(val)) ? '' : 'none';
            });
        });
    </script>
</body>
</html>