
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Registration</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: #f5efdf;
            color: #111827;
            margin: 0;
            min-height: 100vh;
            padding: 40px 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            width: 100%;
            max-width: 520px;
            background: #ffffff;
            padding: 35px;
            border-radius: 16px;
            border: 1px solid #e4dccb;
            box-shadow: 0 12px 35px rgba(10, 25, 47, 0.12);
        }

        .header {
            text-align: center;
            margin-bottom: 28px;
        }

        .header h2 {
            color: #102a43;
            margin: 0 0 10px;
            font-size: 28px;
        }

        .header p {
            color: #64748b;
            font-size: 14px;
            margin: 0;
        }

        .accent-line {
            width: 65px;
            height: 4px;
            background: #1769aa;
            border-radius: 5px;
            margin: 15px auto 0;
        }

        label {
            display: block;
            margin-top: 18px;
            margin-bottom: 7px;
            font-weight: bold;
            color: #172033;
            font-size: 14px;
        }

        input {
            display: block;
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            background: #fffdf8;
            color: #111827;
            font-size: 15px;
            outline: none;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        input:focus {
            border-color: #1769aa;
            box-shadow: 0 0 0 3px rgba(23, 105, 170, 0.14);
        }

        button {
            width: 100%;
            margin-top: 26px;
            padding: 14px;
            background: #123b63;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.2s, transform 0.2s;
        }

        button:hover {
            background: #1769aa;
            transform: translateY(-1px);
        }

        .error {
            color: #991b1b;
            background: #fef2f2;
            border: 1px solid #fecaca;
            border-radius: 8px;
            padding: 12px;
            font-size: 14px;
        }

        .footer {
            text-align: center;
            margin-top: 24px;
            padding-top: 18px;
            border-top: 1px solid #eee6d7;
            font-size: 14px;
        }

        a {
            color: #1769aa;
            font-weight: bold;
            text-decoration: none;
        }

        a:hover {
            color: #102a43;
            text-decoration: underline;
        }

        @media (max-width: 480px) {
            body {
                padding: 20px 12px;
            }

            .container {
                padding: 24px 20px;
            }

            .header h2 {
                font-size: 24px;
            }
        }
    </style>
</head>

<body>
<div class="container">

    <div class="header">
        <h2>Employee Registration</h2>
        <p>Enter the details to register a new employee</p>
        <div class="accent-line"></div>
    </div>

    <c:if test="${not empty errorMessage}">
        <p class="error"><c:out value="${errorMessage}"/></p>
    </c:if>

    <form action="${pageContext.request.contextPath}/employees"
          method="post">

        <label for="name">Employee Name</label>
        <input id="name" type="text" name="name"
               value="${employee.name}" required maxlength="100">

        <label for="email">Email Address</label>
        <input id="email" type="email" name="email"
               value="${employee.email}" required maxlength="150">

        <label for="department">Department</label>
        <input id="department" type="text" name="department"
               value="${employee.department}"
               required maxlength="100">

        <label for="salary">Salary</label>
        <input id="salary" type="number" name="salary"
               min="0.01" step="0.01"
               value="${employee.salary}" required>

        <button type="submit">Register Employee</button>
    </form>

    <div class="footer">
        Already registered?
        <a href="${pageContext.request.contextPath}/employees">
            View Employee List
        </a>
    </div>

</div>
</body>
</html>
