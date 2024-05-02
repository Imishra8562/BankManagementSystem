<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Registration</title>
</head>
<body>
    <div align="center">
        <h2 style="color: blue">Customer Registration</h2>

        <form action="Customer.jsp" method="post" onsubmit="return validateForm()">
            <table border="1">
                <tr>
                    <td><label for="username">User name:</label></td>
                    <td><input type="text" id="username" name="t1" value="<%= request.getParameter("t1") %>" required readonly></td>
                </tr>
                <tr>
                    <td><label for="name">Name:</label></td>
                    <td><input type="text" id="name" name="t2" required></td>
                </tr>
                <tr>
                    <td colspan="2">
                         <label>Gender:</label>
                         <input type="radio" id="male" name="gender" value="male" />
                         <label for="male">Male</label>
                         <input type="radio" id="female" name="gender" value="female" />
                         <label for="female">Female</label>
                         <input type="radio" id="other" name="gender" value="other" /><label for="other">Other</label>
                     </td>
                 </tr>
                <tr>
                    <td><label for="phoneNumber">Phone Number:</label></td>
                    <td><input type="text" id="phoneNumber" name="t3" required></td>
                </tr>
                <tr>
                    <td><label for="address">Address:</label></td>
                    <td><input type="text" id="address" name="t4" required></td>
                </tr>
                <tr>
                    <td><label for="email">Email:</label></td>
                    <td><input type="email" id="email" name="t5" required></td>
                </tr>
                <tr>
                    <td><label for="aadhaarNumber">Aadhar Number:</label></td>
                    <td><input type="text" id="aadhaarNumber" name="t6" placeholder="Enter Aadhaar Number" required></td>
                </tr>
                <tr>
                    <td><label for="pan">PanCard Number:</label></td>
                    <td><input type="text" id="panNumber" name="t7" required></td>
                </tr>
                <tr>
                    <td><label for="other_details">Other Details:</label></td>
                    <td><textarea id="other_details" name="t8"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Submit" name="b1"></td>
                </tr>
            </table>
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
        var panNumber = document.getElementById('panNumber').value;

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
    
</body>
</html>
