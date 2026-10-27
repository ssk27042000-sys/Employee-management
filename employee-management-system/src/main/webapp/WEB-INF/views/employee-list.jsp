
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Directory</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 40px 20px;
            min-height: 100vh;
            font-family: Arial, sans-serif;
            background: #f5efdf;
            color: #111827;
        }

        .employee-section {
            max-width: 1200px;
            margin: 0 auto;
            padding: 30px;
            border-radius: 18px;
            background: #ffffff;
            border: 1px solid #e4dccb;
            box-shadow: 0 12px 35px rgba(10, 25, 47, 0.12);
        }

        .section-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 15px;
            margin-bottom: 25px;
        }

        .employee-section h2 {
            color: #102a43;
            margin: 0 0 8px;
            font-size: 28px;
        }

        .section-subtitle {
            color: #64748b;
            margin: 0;
            font-size: 14px;
        }

        .accent-line {
            width: 65px;
            height: 4px;
            margin-top: 14px;
            background: #1769aa;
            border-radius: 5px;
        }

        .add-button {
            display: inline-block;
            padding: 12px 18px;
            border-radius: 8px;
            background: #123b63;
            color: #ffffff;
            text-decoration: none;
            font-weight: bold;
            font-size: 14px;
            transition: background 0.2s, transform 0.2s;
        }

        .add-button:hover {
            background: #1769aa;
            transform: translateY(-1px);
        }

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
            border: 1px solid #e5e7eb;
            border-radius: 12px;
        }

        .employee-table {
            width: 100%;
            min-width: 700px;
            border-collapse: collapse;
            color: #172033;
            background: #ffffff;
        }

        .employee-table thead {
            background: #102a43;
            color: #ffffff;
        }

        .employee-table th {
            padding: 17px 16px;
            text-align: left;
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 0.8px;
            font-weight: bold;
            white-space: nowrap;
        }

        .employee-table td {
            padding: 16px;
            border-bottom: 1px solid #eee6d7;
            font-size: 14px;
        }

        .employee-table tbody tr {
            transition: background 0.2s ease;
        }

        .employee-table tbody tr:nth-child(even) {
            background: #fffdf8;
        }

        .employee-table tbody tr:hover {
            background: #edf5fc;
        }

        .employee-table tbody tr:last-child td {
            border-bottom: none;
        }

        .employee-id {
            display: inline-block;
            padding: 6px 11px;
            border-radius: 7px;
            background: #dbeafe;
            color: #123b63;
            font-weight: bold;
        }

        .employee-name {
            color: #102a43;
            font-weight: bold;
        }

        .email-text {
            color: #475569;
            overflow-wrap: anywhere;
        }

        .department-badge {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 20px;
            background: #eaf2f8;
            border: 1px solid #c5d9ea;
            color: #123b63;
            font-size: 12px;
            font-weight: bold;
        }

        .salary-text {
            color: #123b63;
            font-weight: bold;
            white-space: nowrap;
        }

        .empty-message {
            text-align: center;
            padding: 35px !important;
            color: #64748b;
            background: #fffdf8;
        }

        .footer-link {
            margin-top: 22px;
            font-size: 14px;
        }

        .footer-link a {
            color: #1769aa;
            font-weight: bold;
            text-decoration: none;
        }

        .footer-link a:hover {
            color: #102a43;
            text-decoration: underline;
        }

        @media (max-width: 600px) {
            body {
                padding: 20px 12px;
            }

            .employee-section {
                padding: 20px 14px;
            }

            .employee-section h2 {
                font-size: 23px;
            }

            .section-header {
                align-items: flex-start;
            }
        }
    </style>
</head>

<body>

<div class="employee-section">

    <div class="section-header">
        <div>
            <h2>Employee Directory</h2>
            <p class="section-subtitle">
                View and manage registered employee information
            </p>
            <div class="accent-line"></div>
        </div>

        <a class="add-button"
           href="${pageContext.request.contextPath}/employees/new">
            + Add Employee
        </a>
    </div>

    <div class="table-wrapper">
        <table class="employee-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Employee Name</th>
                    <th>Email Address</th>
                    <th>Department</th>
                    <th>Salary</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="employee" items="${employees}">
                    <tr>
                        <td>
                            <span class="employee-id">
                                <c:out value="${employee.id}"/>
                            </span>
                        </td>

                        <td>
                            <span class="employee-name">
                                <c:out value="${employee.name}"/>
                            </span>
                        </td>

                        <td>
                            <span class="email-text">
                                <c:out value="${employee.email}"/>
                            </span>
                        </td>

                        <td>
                            <span class="department-badge">
                                <c:out value="${employee.department}"/>
                            </span>
                        </td>

                        <td>
                            <span class="salary-text">
                                ₹ <c:out value="${employee.salary}"/>
                            </span>
                        </td>
                    </tr>
                </c:forEach>

                <c:if test="${empty employees}">
                    <tr>
                        <td colspan="5" class="empty-message">
                            No employees registered yet.
                            Please add your first employee.
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>

    <div class="footer-link">
        <a href="${pageContext.request.contextPath}/employees/new">
            ← Back to Employee Registration
        </a>
    </div>

</div>

</body>
</html>
