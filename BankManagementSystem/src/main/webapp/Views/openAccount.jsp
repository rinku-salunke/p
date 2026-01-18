<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SBI - Quick Open Account</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f0f2f5; min-height: 100vh; display: flex; align-items: center; justify-content: center; font-size: 0.9rem; }
        .form-card { background: white; border-radius: 10px; box-shadow: 0 5px 15px rgba(0,0,0,0.08); width: 100%; max-width: 850px; border: none; }
        .card-header { background-color: #0056b3; color: white; padding: 12px; text-align: center; border-radius: 10px 10px 0 0 !important; }
        .section-title { font-size: 0.8rem; font-weight: 700; color: #0056b3; text-transform: uppercase; background: #f8f9fa; padding: 5px 10px; margin: 15px 0 10px 0; border-left: 4px solid #0056b3; }
        .form-label { margin-bottom: 2px; font-weight: 500; }
        .form-control, .form-select { padding: 6px 10px; }
        .btn-submit { background: #0056b3; color: white; padding: 10px; font-weight: 600; margin-top: 10px; }
    </style>
</head>
<body>

<div class="card form-card">
    <div class="card-header">
        <h4 class="mb-0">Account Opening Form</h4>
        <small>State Bank of India - Digital Portal</small>
    </div>
    <div class="card-body px-4 py-3">
        <form action="/saveAccount">
            
            <div class="section-title">Step 1: Personal & Contact Details</div>
            <div class="row g-3">
                <div class="col-md-6">
                    <label class="form-label">Full Name (as per Aadhaar)</label>
                    <input type="text" name="name" class="form-control" placeholder="Enter full name" required>
                </div>
                <div class="col-md-3">
                    <label class="form-label">Mobile Number</label>
                    <input type="number" name="mobNo" class="form-control" placeholder="Aadhaar linked" required>
                </div>
                <div class="col-md-3">
                    <label class="form-label">Date of Birth</label>
                    <input type="date" name="dob" class="form-control" required>
                </div>
            </div>

            <div class="section-title">Step 2: Address & KYC</div>
            <div class="row g-3">
                <div class="col-md-6">
                    <label class="form-label">Full Address</label>
                    <input type="text" name="address" class="form-control" placeholder="House, Street, City" required>
                </div>
                <div class="col-md-3">
                    <label class="form-label">Age</label>
                    <input type="number" name="age" class="form-control" required>
                </div>
                <div class="col-md-3">
                    <label class="form-label">Pincode</label>
                    <input type="number" name="pincode" class="form-control" required>
                </div>
            </div>

            <div class="row g-3 mt-1">
                <div class="col-md-6">
                    <label class="form-label">Aadhaar Card Number</label>
                    <input type="number" name="adharNo" class="form-control" placeholder="12-digit Aadhaar" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Initial Deposit</label>
                    <div class="input-group">
                        <span class="input-group-text">₹</span>
                        <input type="number" name="balance" class="form-control" value="500" min="500">
                    </div>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-12 text-center">
                    <button type="submit" class="btn btn-submit w-50">Open Account</button>
                </div>
            </div>

        </form>
    </div>
</div>

</body>
</html>