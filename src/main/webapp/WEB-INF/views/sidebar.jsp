<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<aside class="sidebar">
    <nav class="menu">
        <ul class="menu-list">
            <li class="menu-item <c:if test="${activePage == 'basic-information'}">active</c:if>">
                <a href="${pageContext.request.contextPath}/">Basic information</a>
            </li>
            <li class="menu-item <c:if test="${activePage == 'import'}">active</c:if>">
                <a href="#">import</a>
            </li>
            <li class="menu-item <c:if test="${activePage == 'user-management'}">active</c:if>">
                <a href="${pageContext.request.contextPath}/user-management">User management</a>
            </li>
            <li class="menu-item <c:if test="${activePage == 'department'}">active</c:if>">
                <a href="#">Department management</a>
            </li>
            <li class="menu-item <c:if test="${activePage == 'position'}">active</c:if>">
                <a href="#">Position management</a>
            </li>
            <li class="menu-item <c:if test="${activePage == 'equipment'}">active</c:if>">
                <a href="#">Equipment management</a>
            </li>
            <li class="menu-item <c:if test="${activePage == 'application'}">active</c:if>">
                <a href="#">Application management</a>
            </li>
            <li class="menu-item <c:if test="${activePage == 'workflow'}">active</c:if>">
                <a href="#">Workflow management</a>
            </li>
            <li class="menu-item <c:if test="${activePage == 'timecard'}">active</c:if>">
                <a href="#">Time card management</a>
            </li>
            <li class="menu-item <c:if test="${activePage == 'access-rights'}">active</c:if>">
                <a href="#">Access rights management</a>
            </li>
            <li class="menu-item <c:if test="${activePage == 'event-log'}">active</c:if>">
                <a href="#">Event Log Management</a>
            </li>
        </ul>
    </nav>
</aside>

