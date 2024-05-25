<!DOCTYPE html>
<html>
<head>
<title>Admin_DashBoard</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="style.css" rel="stylesheet">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">User DashBoard</a>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item dropdown">
           <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Transactions</a>
           <ul class="dropdown-menu">
             <li><a class="dropdown-item" href="Deposit.html">Deposit Funds</a></li>
             <li><hr class="dropdown-divider"></li>
             <li><a class="dropdown-item" href="Withdraw.html">Withdraw Funds</a></li>
             <li><hr class="dropdown-divider"></li>
             <li><a class="dropdown-item" href="Transferpage.jsp">Transfer Funds</a></li>
           </ul>
       </li>
       <li class="nav-item"><a class="nav-link mx-lg-2" href="Statementspage.jsp">Recent Transactions</a></li>
       <li class="nav-item"><a class="nav-link mx-lg-2" href="UpdateCustomer.jsp">Update Details</a></li>                  
	</ul>
      <form method="post" action="ViewBalance.jsp">
            <button class="btn btn-outline-success me-2" type="submit" value="Balance" name="b1">View Balance</button>
      </form>
      <form>
           <button class="btn btn-outline-success me-2" id="profile" type="button" onclick="loadProfile()">Profile</button>
      </form>
      <form method="post" action="logout.jsp">
			<button class="btn btn-outline-success me-2"  type="submit">Logout</button>
	  </form>
    </div>
  </div>
</nav>
<section id="Profile">
</section>
    <script>
    function loadProfile() {
        var profileSection = document.getElementById("Profile");
        if (profileSection.innerHTML.trim() === "") {
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    profileSection.innerHTML = this.responseText;
                }
            };
            xhr.open("GET", "Profile.jsp", true);
            xhr.send();
        } else {
            profileSection.innerHTML = ""; // Clearing the profile section
        }
    }

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>