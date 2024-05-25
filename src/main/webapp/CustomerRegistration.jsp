<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="" rel="stylesheet">
</head>
<body>
    <div class="container mt-5" style="border-radius: 15px; border: 1px solid #ccc; padding: 20px;">
        <h2>Customer Registration</h2>
        <form action="Customer.jsp" method="post" onsubmit="return validateForm()">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username" name="t1" maxlength="25" value="<%= request.getParameter("t1") %>" required readonly>
                    </div>
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" name="t2" maxlength="255" required>
                    </div>
                    <div class="form-group">
                        <label for="gender">Gender</label>
                        <select class="form-control" id="gender" name="gender" required>
                            <option value="">Select Gender</option>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                            <option value="other">Other</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="Phone Number">Phone Number</label>
                        <input type="text" class="form-control" id="contact" name="t3" maxlength="10">
                    </div>
                    <div class="form-group">
                        <label for="address">Address</label>
                        <input type="text" class="form-control" id="address" name="t4" maxlength="255">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="t5" maxlength="255">
                    </div>
                    <div class="form-group">
                        <label for="aadharnumber">Aadhar Number</label>
                        <input type="text" class="form-control" id="aadharnumber" name="t6" maxlength="12">
                    </div>
                    <div class="form-group">
                        <label for="pancardnumber">Pancard Number</label>
                        <input type="text" class="form-control" id="pancardnumber" name="t7" maxlength="12">
                    </div><br>
                    <div class="form-group">
                    <button type="submit" class="btn btn-primary me-2" value="Submit" name="b1">Submit</button>
                    <button type="reset"  value="Reset" class="btn btn-primary">Reset</button>
                    </div>
                </div> 
            </div> 
        </form>
    </div>
  <script>
        function validatePhoneNumber(phoneNumber) {
            return /^[789]\d{9}$/.test(phoneNumber);
        }

        function validateAadharNumber(aadharNumber) {
            return /^\d{12}$/.test(aadharNumber);
        }

        function validatePanNumber(panNumber) {
            return /^[A-Z]{5}[0-9]{4}[A-Z]{1}$/.test(panNumber);
        }

        function validateForm() {
            var phoneNumber = document.getElementById('phoneNumber').value;
            var aadharNumber = document.getElementById('aadhaarNumber').value;
            var panNumber = document.getElementById('pan').value;

            var phoneValidationResult = validatePhoneNumber(phoneNumber);
            var aadharValidationResult = validateAadharNumber(aadharNumber);
            var panValidationResult = validatePanNumber(panNumber);

            if (!phoneValidationResult) {
                alert("Phone Number is invalid!");
                return false;
            }

            if (!aadharValidationResult) {
                alert("Aadhaar Number is invalid!");
                return false;
            }

            if (!panValidationResult) {
                alert("PAN Card Number is invalid!");
                return false;
            }

            // If all validations pass, return true
            return true;
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
