<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SBI Corporate | Account Management</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --sbi-navy: #0a2540;
            --sbi-blue: #0056b3;
            --sidebar-width: 260px;
            --bg-gray: #f6f9fc;
            --border-color: #e6e9eb;
        }

        body { 
            background-color: var(--bg-gray);
            font-family: 'Inter', sans-serif;
            margin: 0;
            overflow-x: hidden;
        }

        /* Sidebar Navigation */
        .sidebar {
            width: var(--sidebar-width);
            background: var(--sbi-navy);
            height: 100vh;
            position: fixed;
            color: white;
            padding: 20px;
            z-index: 100;
        }

        .main-content {
            margin-left: var(--sidebar-width);
            padding: 30px;
            min-height: 100vh;
        }

        /* Dashboard Top Bar */
        .top-bar {
            background: white;
            padding: 15px 30px;
            margin: -30px -30px 30px -30px;
            border-bottom: 1px solid var(--border-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        /* Professional Data Cards */
        .record-card {
            background: white;
            border: 1px solid var(--border-color);
            border-radius: 8px;
            padding: 0;
            margin-bottom: 15px;
            transition: all 0.2s;
        }

        .record-card:hover {
            border-color: var(--sbi-blue);
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }

        .card-header-flex {
            display: flex;
            align-items: center;
            padding: 15px 20px;
            border-bottom: 1px solid #f8f9fa;
            background: #fafbfc;
        }

        .status-indicator {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background: #28a745;
            margin-right: 10px;
        }

        .data-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            padding: 20px;
        }

        .data-item label {
            display: block;
            font-size: 0.7rem;
            text-transform: uppercase;
            font-weight: 700;
            color: #6c757d;
            margin-bottom: 4px;
            letter-spacing: 0.5px;
        }

        .data-item span {
            font-size: 0.9rem;
            font-weight: 500;
            color: var(--sbi-navy);
        }

        /* Action Buttons */
        .btn-group-sm .btn {
            padding: 5px 12px;
            font-weight: 600;
            font-size: 0.8rem;
        }

        .nav-link {
            color: rgba(255,255,255,0.7);
            padding: 12px 15px;
            border-radius: 6px;
            margin-bottom: 5px;
            display: flex;
            align-items: center;
        }

        .nav-link.active {
            background: var(--sbi-blue);
            color: white;
        }

        .nav-link i { width: 25px; }

        .balance-box {
            background: #eef2ff;
            border-radius: 6px;
            padding: 10px 15px;
            border-left: 4px solid var(--sbi-blue);
        }
    </style>
</head>
<body>

<div class="sidebar d-none d-lg-block">
    <div class="mb-5 px-3">
        <h4 class="fw-bold"><i class="fas fa-university me-2"></i>SBI CORE</h4>
        <small class="opacity-50">Enterprise Resource Portal</small>
    </div>
    
    <nav>
        <a href="#" class="nav-link active"><i class="fas fa-users"></i> Account Holders</a>
        <a href="/" class="nav-link"><i class="fas fa-user-plus"></i> Open New Account</a>
        <a href="transactionLogs" class="nav-link"><i class="fas fa-chart-line"></i> Transaction Logs</a>
        <a href="#" class="nav-link"><i class="fas fa-cog"></i> System Settings</a>
    </nav>
</div>

<div class="main-content">
    <div class="top-bar">
        <div>
            <h5 class="mb-0 fw-bold">Customer Directory</h5>
            <small class="text-muted">Reviewing ${data.size()} active accounts</small>
        </div>
        <div class="d-flex gap-3">
            <div class="input-group input-group-sm" style="width: 250px;">
                <span class="input-group-text bg-white border-end-0"><i class="fas fa-search text-muted"></i></span>
                <input type="text" class="form-control border-start-0 shadow-none" placeholder="Filter records...">
            </div>
            <button class="btn btn-primary btn-sm px-4">Export CSV</button>
        </div>
    </div>

    <div class="container-fluid">
        <c:forEach var="bank" items="${data}">
            <div class="record-card">
                <div class="card-header-flex justify-content-between">
                    <div class="d-flex align-items-center">
                        <div class="status-indicator"></div>
                        <h6 class="mb-0 fw-bold text-dark">ID-${bank.accNo} | ${bank.name}</h6>
                    </div>
                    <div class="btn-group btn-group-sm">
                        <a href="edit?accNo=${bank.accNo}" class="btn btn-outline-secondary"><i class="fas fa-edit me-1"></i> Modify</a>
                        <a href="delete?accNo=${bank.accNo}" class="btn btn-outline-danger" onclick="return confirm('Confirm Deletion?')"><i class="fas fa-trash-alt me-1"></i> Terminate</a>
                    </div>
                </div>
                
                <div class="data-grid">
                    <div class="data-item">
                        <label>Primary Contact</label>
                        <span><i class="fas fa-phone me-2 text-muted"></i>${bank.mobNo}</span>
                    </div>
                    <div class="data-item">
                        <label>KYC Verification</label>
                        <span><i class="fas fa-id-card me-2 text-muted"></i>Aadhaar: ${bank.adharNo}</span>
                    </div>
                    <div class="data-item">
                        <label>Age / DOB</label>
                        <span>${bank.age} Years (${bank.dob})</span>
                    </div>
                    <div class="data-item balance-box">
                        <label class="text-primary">Ledger Balance</label>
                        <span class="fs-6 fw-bold">₹ ${bank.balance}</span>
                    </div>
                    <div class="data-item">
                        <label>Postal Code</label>
                        <span>${bank.pincode}</span>
                    </div>
                    <div class="data-item" style="grid-column: span 3;">
                        <label>Registered Permanent Address</label>
                        <span><i class="fas fa-map-marker-alt me-2 text-muted"></i>${bank.address}</span>
                    </div>
                </div>
            </div>
        </c:forEach>

        <c:if test="${empty data}">
            <div class="text-center py-5 mt-5 bg-white border rounded">
                <i class="fas fa-inbox fa-3x text-light mb-3"></i>
                <h5 class="text-muted">No active account records found in the directory.</h5>
                <a href="/" class="btn btn-primary mt-3">Initiate Onboarding</a>
            </div>
        </c:if>
    </div>
</div>

</body>
</html>