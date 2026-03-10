<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management - Aipo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fStyle.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="container">
        <c:set var="activePage" value="user-management" />
        <jsp:include page="sidebar.jsp" />
        <main class="main-content">
            <div class="content-header">
                <h1 class="content-title">User management</h1>
                <button id="addUserBtn" class="btn btn-primary">
                    + To add a user
                </button>
            </div>
            <div class="search-section">
                <div class="search-controls">
                    <select class="search-select" id="stateFilter">
                        <option value="">All states</option>
                        <option value="effectiveness">Effectiveness</option>
                        <option value="inactive">Inactive</option>
                    </select>
                    <button class="btn btn-search" id="searchBtn">Search</button>
                </div>
                <div class="action-buttons">
                    <button class="btn btn-action" id="removeBtn">Remove</button>
                    <button class="btn btn-action" id="enableBtn">to enable</button>
                    <button class="btn btn-action" id="disableBtn">to disable</button>
                    <button class="btn btn-action" id="changeOrderBtn">to change the order of the user</button>
                </div>
            </div>
            <div class="table-wrapper">
                <table class="user-table">
                    <thead>
                        <tr>
                            <th class="col-checkbox"><input type="checkbox" id="selectAll"></th>
                            <th class="col-state">State</th>
                            <th class="col-username">username</th>
                            <th class="col-name">name</th>
                            <th class="col-department">Department name</th>
                            <th class="col-title">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>
                                <input type="checkbox" class="checkbox-row" value="${user.id}">
                            </td>

                            <td class="user-state">
                                <c:choose>
                                    <c:when test="${user.id % 2 == 0}">
                                        Effectiveness
                                    </c:when>
                                    <c:otherwise>
                                        Inactive
                                    </c:otherwise>
                                </c:choose>
                            </td>

                            <td>${user.loginName}</td>

                            <td>${user.firstName} ${user.lastName}</td>

                            <td>${user.department}</td>

                            <td>
                                <c:choose>
                                    <c:when test="${user.disabled == 'F' || user.disabled == null}">
                                        <span style="color: green; font-weight: bold;">Enabled</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span style="color: red; font-weight: bold;">Disabled</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="pagination-wrapper">
                <div class="pagination-buttons">
                    <button class="btn btn-action" id="removeBtn2">Remove</button>
                    <button class="btn btn-action" id="enableBtn2">to enable</button>
                    <button class="btn btn-action" id="disableBtn2">to disable</button>
                </div>
                <div class="pagination-info">1 - 7 / 7</div>
            </div>
            <footer class="footer">
                <p class="footer-text">MobleWorld © Inc. Patent 8.1.5</p>
            </footer>
        </main>
    </div>

    <div id="addUserModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Add User</h2>
                <button class="modal-close" id="modalCloseBtn">&times;</button>
            </div>
            <form id="addUserForm"
                  class="modal-form"
                  method="post"
                  action="${pageContext.request.contextPath}/users/add">
                <div class="form-section">
                    <h3>Login Information</h3>
                    <div class="form-row">
                        <label>Login name</label>
                        <input type="text" name="loginName" required>
                    </div>
                    <div class="form-row">
                        <label>Password</label>
                        <input type="password" name="password" required>
                    </div>
                    <div class="form-row">
                        <label>Password confirmation</label>
                        <input type="password" name="passwordConfirm" required>
                    </div>
                </div>

                <div class="form-section">
                    <h3>Name</h3>
                    <div class="form-row">
                        <label>First name</label>
                        <input type="text" name="firstName" required>
                    </div>
                    <div class="form-row">
                        <label>Last name</label>
                        <input type="text" name="lastName" required>
                    </div>
                    <div class="form-row">
                        <label>Furigana name</label>
                        <input type="text" name="furiganaName">
                    </div>
                </div>

                <div class="form-section">
                    <h3>Contact Information</h3>
                    <div class="form-row">
                        <label>Mail address</label>
                        <input type="email" name="email" required>
                    </div>
                    <div class="form-row">
                        <label>Mobile e-mail address</label>
                        <input type="email" name="mobileEmailAddress">
                    </div>
                </div>

                <div class="form-section">
                    <h3>Telephone</h3>
                    <div class="form-row">
                        <label>Telephone number (outside line)</label>
                        <input type="tel" name="telephoneOutside">
                    </div>
                    <div class="form-row">
                        <label>Telephone number (extension)</label>
                        <input type="tel" name="telephoneExtension">
                    </div>
                    <div class="form-row">
                        <label>Telephone number (mobile)</label>
                        <input type="tel" name="telephoneMobile">
                    </div>
                </div>

                <div class="form-section">
                    <h3>Mug shot</h3>
                    <div class="form-row">
                        <input type="file" name="mugshot" accept="image/*">
                    </div>
                </div>

                <div class="form-section">
                    <h3>Department</h3>
                    <p style="font-size: 12px; color: #666; margin-bottom: 10px;">Please add the department on the left side.</p>
                    <div class="department-selector">
                        <div class="dept-column">
                            <label>Department</label>
                            <select multiple id="deptAvailable" size="8">
                                <option>IT Department</option>
                                <option>HR Department</option>
                                <option>Sales Department</option>
                                <option>Marketing Department</option>
                                <option>Finance Department</option>
                            </select>
                            <div class="dept-delete">
                                <button type="button" class="btn btn-small" id="removeDeptBtn">Delete</button>
                            </div>
                        </div>

                        <div class="dept-column">
                            <label>Department List</label>
                            <select multiple id="deptSelected" size="8"></select>
                            <div class="dept-add">
                                <button type="button" class="btn btn-small" id="addDeptBtn">&lt;Add</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <h3>Position & Privileges</h3>
                    <div class="form-row">
                        <label>Position</label>
                        <select name="position">
                            <option value="">-- Select Position --</option>
                            <option value="manager">Manager</option>
                            <option value="staff">Staff</option>
                            <option value="trainee">Trainee</option>
                        </select>
                    </div>
                    <button type="button" class="btn btn-small" id="addPositionBtn">The New Input</button>
                </div>

                <div class="form-section">
                    <h3>Administrative privileges</h3>
                    <div class="form-row checkbox">
                        <input type="checkbox" id="adminCheckbox" name="isAdmin">
                        <label for="adminCheckbox">To administrator</label>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Add</button>
                    <button type="button" class="btn btn-action" id="modalCloseBtn2">Close</button>
                </div>
            </form>
        </div>
    </div>

    <div id="modalOverlay" class="modal-overlay"></div>
    <script>

        var addUserBtn = document.getElementById('addUserBtn');
        var addUserModal = document.getElementById('addUserModal');
        var modalOverlay = document.getElementById('modalOverlay');
        var modalCloseBtn = document.getElementById('modalCloseBtn');
        var modalCloseBtn2 = document.getElementById('modalCloseBtn2');
        var addUserForm = document.getElementById('addUserForm');

        if (addUserBtn) {
            addUserBtn.addEventListener('click', function(e) {
                e.preventDefault();
                openModal();
            });
        }

        if (modalCloseBtn) {
            modalCloseBtn.addEventListener('click', function() {
                closeModal();
            });
        }

        if (modalCloseBtn2) {
            modalCloseBtn2.addEventListener('click', function() {
                closeModal();
            });
        }

        if (modalOverlay) {
            modalOverlay.addEventListener('click', function() {
                closeModal();
            });
        }

        if (addUserForm) {
            addUserForm.addEventListener('submit', function(e) {

                var formData = new FormData(this);
                var formValues = Object.fromEntries(formData);

                if (formValues.password !== formValues.passwordConfirm) {
                    e.preventDefault();
                    alert('Passwords do not match!');
                    return;
                }
                // TODO: Send to backend API
                // fetch('/users/add', {
                //     method: 'POST',
                //     body: formData
                // });

            });
        }

        var addDeptBtn = document.getElementById('addDeptBtn');
        var removeDeptBtn = document.getElementById('removeDeptBtn');
        var deptAvailable = document.getElementById('deptAvailable');
        var deptSelected = document.getElementById('deptSelected');

        if (addDeptBtn) {
            addDeptBtn.addEventListener('click', function(e) {
                e.preventDefault();
                var selectedOptions = deptAvailable.selectedOptions;
                for (var i = selectedOptions.length - 1; i >= 0; i--) {
                    var option = selectedOptions[i];
                    deptSelected.appendChild(option);
                }
            });
        }

        if (removeDeptBtn) {
            removeDeptBtn.addEventListener('click', function(e) {
                e.preventDefault();
                var selectedOptions = deptSelected.selectedOptions;
                for (var i = selectedOptions.length - 1; i >= 0; i--) {
                    var option = selectedOptions[i];
                    deptAvailable.appendChild(option);
                }
            });
        }

        function openModal() {
            addUserModal.classList.add('active');
            modalOverlay.classList.add('active');
            document.body.style.overflow = 'hidden';
        }

        function closeModal() {
            addUserModal.classList.remove('active');
            modalOverlay.classList.remove('active');
            document.body.style.overflow = '';
        }

        var selectAllCheckbox = document.getElementById('selectAll');
        if (selectAllCheckbox) {
            selectAllCheckbox.addEventListener('change', function() {
                var checkboxes = document.querySelectorAll('.checkbox-row');
                checkboxes.forEach(function(checkbox) {
                    checkbox.checked = selectAllCheckbox.checked;
                });
            });
        }

        var stateFilter = document.getElementById('stateFilter');
        var searchBtn = document.getElementById('searchBtn');
        var tableRows = document.querySelectorAll('.user-table tbody tr');

        function performSearch() {
            var selectedState = stateFilter.value.toLowerCase();
            var visibleCount = 0;

            tableRows.forEach(function(row) {
                var state = row.cells[1].textContent.toLowerCase();
                var stateMatch = !selectedState || state.includes(selectedState);
                if (stateMatch) {
                    row.style.display = '';
                    visibleCount++;
                } else {
                    row.style.display = 'none';
                }
            });
            var paginationInfo = document.querySelector('.pagination-info');
            if (paginationInfo) {
                var totalRows = tableRows.length;
                paginationInfo.textContent = visibleCount + ' / ' + totalRows + ' results';
            }
        }

        if (searchBtn) {
            searchBtn.addEventListener('click', function() {
                performSearch();
            });
        }

        var removeBtn = document.getElementById('removeBtn');
        var enableBtn = document.getElementById('enableBtn');
        var disableBtn = document.getElementById('disableBtn');
        var changeOrderBtn = document.getElementById('changeOrderBtn');

        function getSelectedUsers() {
            var selected = [];
            document.querySelectorAll('.checkbox-row:checked').forEach(function(checkbox) {
                var row = checkbox.closest('tr');
                selected.push({
                    username: row.cells[2].textContent,
                    name: row.cells[3].textContent
                });
            });
            return selected;
        }

        if (removeBtn) {
            removeBtn.addEventListener('click', function () {

                var selected = document.querySelector('.checkbox-row:checked');

                if (!selected) {
                    alert('Please select a user');
                    return;
                }

                var userId = selected.value;

                if (confirm('Are you sure you want to delete this user?')) {

                    window.location.href = "${pageContext.request.contextPath}/users/delete?id=" + userId;

                }

            });
        }

        if (enableBtn) {
            enableBtn.addEventListener('click', function() {
                var selectedCheckbox = document.querySelector('.checkbox-row:checked');

                if (!selectedCheckbox) {
                    alert('Please select at least one user to enable');
                    return;
                }

                var userId = selectedCheckbox.value;

                if (confirm('Enable this user?')) {
                    window.location.href = "${pageContext.request.contextPath}/users/enable?id=" + userId;
                }
            });
        }

        if (disableBtn) {
            disableBtn.addEventListener('click', function() {
                var selectedCheckbox = document.querySelector('.checkbox-row:checked');

                if (!selectedCheckbox) {
                    alert('Please select at least one user to disable');
                    return;
                }

                var userId = selectedCheckbox.value;

                if (confirm('Disable this user?')) {
                    window.location.href = "${pageContext.request.contextPath}/users/disable?id=" + userId;
                }
            });
        }

        if (changeOrderBtn) {
            changeOrderBtn.addEventListener('click', function() {
                var selected = getSelectedUsers();
                if (selected.length === 0) {
                    alert('Please select at least one user to change order');
                    return;
                }
                var newOrder = prompt('Enter new order number:');
                if (newOrder !== null && newOrder.trim() !== '') {
                    alert('Order changed for ' + selected.length + ' user(s) to: ' + newOrder);
                    // TODO: Send to backend for actual order change
                }
            });
        }

        var removeBtn2 = document.getElementById('removeBtn2');
        var enableBtn2 = document.getElementById('enableBtn2');
        var disableBtn2 = document.getElementById('disableBtn2');

        if (removeBtn2) {
            removeBtn2.addEventListener('click', function() {
                var selected = document.querySelector('.checkbox-row:checked');

                if (!selected) {
                    alert('Please select a user');
                    return;
                }

                var userId = selected.value;

                if (confirm('Are you sure you want to delete this user?')) {
                    window.location.href = "${pageContext.request.contextPath}/users/delete?id=" + userId;
                }
            });
        }

        if (enableBtn2) {
            enableBtn2.addEventListener('click', function() {

                var selectedCheckbox = document.querySelector('.checkbox-row:checked');

                if (!selectedCheckbox) {
                    alert('Please select at least one user to enable');
                    return;
                }

                var userId = selectedCheckbox.value;

                if (confirm('Enable this user?')) {

                    window.location.href = "${pageContext.request.contextPath}/users/enable?id=" + userId;

                }
            });
        }

        if (disableBtn2) {
            disableBtn2.addEventListener('click', function() {

                var selectedCheckbox = document.querySelector('.checkbox-row:checked');

                if (!selectedCheckbox) {
                    alert('Please select at least one user to disable');
                    return;
                }

                var userId = selectedCheckbox.value;

                if (confirm('Disable this user?')) {

                    window.location.href = "${pageContext.request.contextPath}/users/disable?id=" + userId;

                }
            });
        }
    </script>
</body>
</html>
