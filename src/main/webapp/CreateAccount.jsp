<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create New Account</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="" rel="stylesheet">
</head>
<body>
    <div class="container mt-5" style="border-radius: 15px; border: 1px solid #ccc; padding: 20px;">
        <h2>Create New Account</h2>
        <form action="Account.jsp" method="post">
            
                <div class="col">
                    <div class="form-group">
                        <label for="customer_id">Customer id</label>
                        <input type="text" class="form-control" id="customer_id" name="t1" value="<%= request.getAttribute("cstId") %>" required readonly>
                    </div>
                    <div class="form-group">
                        <label for="Account Type">Account Type</label>
                        <select class="form-control" id="Account Type" name="t2" required>
                            <option value="">Select Type</option>
                            <option value="Savings">Savings</option>
                            <option value="Current">Current</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="balance">Balance</label>
                        <input type="number" class="form-control" id="balance" name="t3" step="0.01" required>
                    </div>
                    <div class="form-group">
                        <label for="status">Status</label>
                        <select class="form-control" id="status" name="t4" required>
                            <option value="open">Open</option>
                            <option value="closed">Closed</option>
                        </select>
                    </div>
                
                
                    <div class="form-group">
                        <label for="creation_date">Date-Time</label>
                        <input type="datetime-local" id="creation_date" class="form-control" name="t5" maxlength="255">
                    </div>
                    
                    <div class="form-group">
                        <input type="checkbox" id="applyForATMCard" name="applyForATMCard">
                        <label for="applyForATMCard">Apply For ATM Card</label><br><br>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary me-2" value="CreateAccount" name="b1">Submit</button>
                        <button type="reset" value="Reset" class="btn btn-primary">Reset</button>
                    </div>
                
            </div>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
