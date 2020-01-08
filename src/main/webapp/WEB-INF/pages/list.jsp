<%--
  Created by IntelliJ IDEA.
  User: 20439
  Date: 2019/12/3
  Time: 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <%
        pageContext.setAttribute("ctp", request.getContextPath());
    %>
    <script src="${ctp }/static/jquery/jquery-3.4.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <link href="${ctp }/static/css/bootstrap.css" rel="stylesheet">
    <script src="${ctp }/static/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <br/>
    <!--标题-->
    <div class="row">
        <div class="col-md-12">
            <h1><fmt:message key="welcomeinfo"/></h1>
        </div>
    </div>
    <!--按钮-->
    <div class="row">
        <div class="col-md-4 col-lg-offset-8">
            <button class="btn btn-primary">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                <fmt:message key="add"/>
            </button>
            <button class="btn btn-danger">
                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                <fmt:message key="delete"/>
            </button>
        </div>
    </div>
    <!--显示表格数据-->
    <div class="row">
        <br/>
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th><fmt:message key="emp_id"/></th>
                    <th><fmt:message key="emp_name"/></th>
                    <th><fmt:message key="gender"/></th>
                    <th><fmt:message key="age"/></th>
                    <th><fmt:message key="email"/></th>
                    <th><fmt:message key="dept_name"/></th>
                </tr>
                </thead>
                <c:forEach items="${pageInfo.list }" var="emp">
                    <tr>
                        <th>${emp.empId }</th>
                        <th>${emp.empName }</th>
                        <th>${emp.gender }</th>
                        <th>${emp.age }</th>
                        <th>${emp.email }</th>
                        <th>${emp.department.deptName }</th>
                        <th>
                            <button class="btn btn-warning btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                <fmt:message key="update"/>
                            </button>
                            <button class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                <fmt:message key="delete"/>
                            </button>
                        </th>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <!--显示分页信息栏-->
    <div class="row">
        <!-- 分页文字信息-->
        <div class="col-md-6" id="page_info">
            当前第${pageInfo.pageNum }页，共${pageInfo.pages }页，共${pageInfo.total }条记录
        </div>
        <!-- 分页条信息-->
        <div class="col-md-6" id="page_nav">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${ctp }/emps?pn=1"><fmt:message key="first"/></a></li>
                    <c:if test="${pageInfo.hasPreviousPage }">
                        <li>
                            <a href="${ctp }/emps?pn=${pageInfo.pageNum-1 }" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                        <c:if test="${page_Num == pageInfo.pageNum }">
                            <li class="active"><a href="#">${page_Num }</a></li>
                        </c:if>
                        <c:if test="${page_Num != pageInfo.pageNum }">
                            <li><a href="${ctp }/emps?pn=${page_Num }">${page_Num }</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage }">
                        <li>
                            <a href="${ctp}/emps?pn=${pageInfo.pageNum+1 }" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <li><a href="${ctp}/emps?pn=${pageInfo.pages }"><fmt:message key="last"/></a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>
