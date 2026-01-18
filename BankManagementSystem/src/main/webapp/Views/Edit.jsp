<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SBI Elite | Enterprise Modification System</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --sbi-primary: #1a4da1;
            --sbi-bg: #f3f6f9;
            --text-main: #1e293b;
            --text-muted: #64748b;
            --border-color: #e2e8f0;
            --card-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px -1px rgba(0, 0, 0, 0.1);
        }

        body { 
            background-color: var(--sbi-bg);
            font-family: 'Inter', sans-serif;
            color: var(--text-main);
            line-height: 1.5;
        }

        /* Top Bar Management */
        .top-utility-bar {
            background: #fff;
            border-bottom: 1px solid var(--border-color);
            padding: 0.75rem 2rem;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .main-wrapper {
            max-width: 1200px;
            margin: 2.5rem auto;
            padding: 0 1.5rem;
        }

        /* The Professional Layout Grid */
        .grid-container {
            display: grid;
            grid-template-columns: 320px 1fr;
            gap: 2rem;
        }

        /* Sidebar Status Card */
        .status-sidebar {
            background: #fff;
            border-radius: 12px;
            border: 1px solid var(--border-color);
            padding: 1.5rem;
            height: fit-content;
            box-shadow: var(--card-shadow);
        }

        /* Main Form Card */
        .edit-form-card {
            background: #fff;
            border-radius: 12px;
            border: 1px solid var(--border-color);
            box-shadow: var(--card-shadow);
            overflow: hidden;
        }

        .form-header {
            padding: 1.5rem 2rem;
            border-bottom: 1px solid var(--border-color);
            background: #fafbfc;
        }

        .section-divider {
            font-size: 0.75rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: var(--sbi-primary);
            margin: 2rem 0 1.5rem;
            display: flex;
            align-items: center;
        }

        .section-divider::after {
            content: "";
            flex: 1;
            height: 1px;
            background: var(--border-color);
            margin-left: 1rem;
        }

        /* Form Controls */
        .form-label {
            font-weight: 500;
            font-size: 0.875rem;
            margin-bottom: 0.5rem;
            color: var(--text-main);
        }

        .form-control {
            border: 1.5px solid var(--border-color);
            padding: 0.6rem 0.8rem;
            border-radius: 8px;
            font-size: 0.95rem;
            transition: all 0.2s;
        }

        .form-control:focus {
            border-color: var(--sbi-primary);
            box-shadow: 0 0 0 3px rgba(26, 77, 161, 0.1);
        }

        .input-readonly {
            background-color: #f8fafc;
            color: var(--text-muted);
            cursor: not-allowed;
            border-style: dashed;
        }

        /* Professional Buttons */
        .btn-sbi-save {
            background-color: var(--sbi-primary);
            border: none;
            color: white;
            padding: 0.75rem 2rem;
            border-radius: 8px;
            font-weight: 600;
            transition: opacity 0.2s;
        }

        .btn-sbi-save:hover {
            opacity: 0.9;
            color: white;
        }

        .btn-sbi-ghost {
            color: var(--text-muted);
            text-decoration: none;
            font-weight: 600;
            font-size: 0.9rem;
        }

        .btn-sbi-ghost:hover {
            color: #ef4444;
        }

        .metadata-badge {
            font-family: 'Monaco', 'Consolas', monospace;
            background: #f1f5f9;
            padding: 0.2rem 0.6rem;
            border-radius: 4px;
            font-size: 0.85rem;
        }
    </style>
</head>
<body>

<header class="top-utility-bar d-flex justify-content-between align-items-center">
    <div class="d-flex align-items-center">
        <div class="bg-primary text-white p-2 rounded me-3">
            <i class="fas fa-user-shield"></i>
        </div>
        <h6 class="mb-0 fw-bold">SBI <span class="text-primary">ELITE</span> ADMIN <small class="text-muted ms-2">v2.4.0</small></h6>
    </div>
    <div class="d-flex align-items-center gap-4">
        <span class="small fw-medium"><i class="fas fa-circle text-success me-2"></i>Encrypted Node Active</span>
        <div class="vr"></div>
        <div class="d-flex align-items-center gap-2">
            <span class="small fw-bold">ID: AD-9921</span>
            <img src="https://ui-avatars.com/api/?name=Admin&size=32&background=1a4da1&color=fff" class="rounded-circle" alt="Admin">
        </div>
    </div>
</header>

<div class="main-wrapper">
    <nav aria-label="breadcrumb" class="mb-4">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="saveAccount" class="text-decoration-none">Main Dashboard</a></li>
            <li class="breadcrumb-item"><a href="#" class="text-decoration-none">Account Registry</a></li>
            <li class="breadcrumb-item active">Edit Record</li>
        </ol>
    </nav>

    <div class="grid-container">
        <aside class="status-sidebar">
            <h6 class="fw-bold mb-3">Account Summary</h6>
            <div class="mb-4">
                <label class="text-muted small d-block">System Reference</label>
                <span class="metadata-badge text-primary">#${bnk.accNo}</span>
            </div>
            <div class="mb-4">
                <label class="text-muted small d-block">Account Holder</label>
                <span class="fw-bold">${bnk.name}</span>
            </div>
            <hr>
            <div class="mb-4">
                <label class="text-muted small d-block">Available Ledger</label>
                <h4 class="fw-bold text-success mb-0">₹ ${bnk.balance}</h4>
                <small class="text-muted">Last Updated: Just Now</small>
            </div>
            <div class="alert alert-info py-2 small border-0 mb-0">
                <i class="fas fa-info-circle me-2"></i> KYC records are verified and current.
            </div>
        </aside>

        <main class="edit-form-card">
            <div class="form-header d-flex justify-content-between align-items-center">
                <h5 class="fw-bold mb-0">Modify Personnel Record</h5>
                <span class="badge bg-light text-dark border">Edit Mode</span>
            </div>

            <form action="updateAccount" method="post" class="p-4 p-md-5 pt-md-0">
                <input type="hidden" name="accNo" value="${bnk.accNo}">

                <div class="section-divider">Core Identification</div>
                <div class="row g-4">
                    <div class="col-md-12">
                        <label class="form-label">Full Legal Name (as per ID)</label>
                        <input type="text" name="name" class="form-control" value="${bnk.name}" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Aadhaar Number <i class="fas fa-lock ms-1 small text-muted"></i></label>
                        <input type="text" name="adharNo" class="form-control input-readonly" value="${bnk.adharNo}" readonly>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Date of Birth</label>
                        <input type="date" name="dob" class="form-control" value="${bnk.dob}">
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Age Index</label>
                        <input type="number" name="age" class="form-control" value="${bnk.age}">
                    </div>
                </div>

                <div class="section-divider">Financials & Contact</div>
                <div class="row g-4">
                    <div class="col-md-6">
                        <label class="form-label">Registered Mobile Number</label>
                        <div class="input-group">
                            <span class="input-group-text bg-light">+91</span>
                            <input type="text" name="mobNo" class="form-control" value="${bnk.mobNo}" required>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Adjust Ledger Balance</label>
                        <div class="input-group">
                            <span class="input-group-text bg-light">₹</span>
                            <input type="number" name="balance" class="form-control fw-bold text-success" value="${bnk.balance}">
                        </div>
                    </div>
                    <div class="col-12">
                        <label class="form-label">Primary Communication Address</label>
                        <textarea name="address" class="form-control" rows="3" placeholder="Enter complete address details...">${bnk.address}</textarea>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Postal Index Code (PIN)</label>
                        <input type="text" name="pincode" class="form-control" value="${bnk.pincode}">
                    </div>
                </div>

                <div class="mt-5 pt-4 border-top d-flex justify-content-between align-items-center">
                    <a href="saveAccount" class="btn-sbi-ghost">
                        <i class="fas fa-arrow-left me-2"></i> Discard Changes
                    </a>
                    <button type="submit" class="btn btn-sbi-save px-5">
                        Confirm & Update Record
                    </button>
                </div>
            </form>
        </main>
    </div>
</div>

<footer class="text-center py-5">
    <p class="text-muted extra-small fw-bold letter-spacing-2">SBI INTERNAL NETWORK • ISO/IEC 27001 SECURED • 2026</p>
</footer>

</body>
</html>