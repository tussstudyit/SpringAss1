<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Aipo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fStyle.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container">
        <c:set var="activePage" value="basic-information" />
        <jsp:include page="sidebar.jsp" />
        <main class="main-content">
            <div class="content-header">
                <h1 class="content-title">Basic information</h1>
                <button class="btn btn-config">⚙ Configuration</button>
            </div>

            <div class="config-list">
                <div class="config-item">
                    <div class="config-title">Access from the house</div>
                    <div class="config-description">
                        It is the address to access from the house to the "Aipo". The house of the user, please contact us to this address.
                    </div>
                    <div class="config-input-group">
                        <span class="config-label">Aipo site(in-house)</span>
                        <input type="text" class="config-input" value="Http : // 1 57.7.209 /" readonly>
                    </div>
                    <div class="config-action">
                        <a href="#" class="btn-edit">To edit</a>
                    </div>
                </div>

                <div class="config-item">
                    <div class="config-title">Access from outside the company</div>
                    <div class="config-description">
                        The address for accessing the "Aipo" from outside the company. The user of the outside, please contact us to this address.
                    </div>
                    <div class="config-input-group">
                        <span class="config-label">Aipo site(Outside)</span>
                        <input type="text" class="config-input" value="" placeholder="Not configured" readonly>
                    </div>
                    <div class="config-action">
                        <a href="#" class="btn-edit">To edit</a>
                    </div>
                </div>
            </div>

            <footer class="footer">
                <p class="footer-text">MobleWorld © Inc. Patent 8.1.5</p>
            </footer>
        </main>
    </div>
</body>
</html>

