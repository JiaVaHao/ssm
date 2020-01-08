<%--
  Created by IntelliJ IDEA.
  User: 20439
  Date: 2019/12/3
  Time: 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
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
<fmt:setLocale value="${param.loc}"/>
<fmt:setBundle basename="conf.view"/>
<!--员工点击添加模态框-->
<div class="modal fade" tabindex="-1" role="dialog" id="emp_add_modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title"><fmt:message key="add_emp_info"/></h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method="post" id="emp_add_form">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label"><fmt:message key="emp_name"/></label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="empName" id="empName_add_input"
                                   placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><fmt:message key="gender"/></label>
                        <div class="col-sm-8">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="男" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="age_add_input" class="col-sm-2 control-label"><fmt:message key="age"/></label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="age" id="age_add_input" placeholder="age">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label"><fmt:message key="email"/></label>
                        <div class="col-sm-8">
                            <input type="email" class="form-control" name="email" id="email_add_input"
                                   placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="age_add_input" class="col-sm-2 control-label"><fmt:message key="dept_name"/></label>
                        <div class="col-sm-3">
                            <label for="dept_add_select"></label>
                            <select class="form-control" name="deptId" id="dept_add_select">
                            </select>
                        </div>
                    </div>
                </form>
                <div class="modal-footer">
                    <button type="button" class="btn btn-info" id="input_clear_btn"><fmt:message key="clear"/></button>
                    <button type="button" class="btn btn-default" data-dismiss="modal"><fmt:message key="cancel"/></button>
                    <button type="button" class="btn btn-primary" id="input_save_btn"><fmt:message key="post"/></button>
                </div>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!--员工修改模态框-->
<div class="modal fade" tabindex="-1" role="dialog" id="emp_update_modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title"><fmt:message key="update_emp_info"/></h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method="post" id="emp_update_form">
                    <div class="form-group">
                        <label for="empName_update_static" class="col-sm-2 control-label"><fmt:message key="emp_name"/></label>
                        <div class="col-sm-8">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><fmt:message key="gender"/></label>
                        <div class="col-sm-8">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="男" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="age_update_input" class="col-sm-2 control-label"><fmt:message key="age"/></label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="age" id="age_update_input" placeholder="age">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_update_input" class="col-sm-2 control-label"><fmt:message key="email"/></label>
                        <div class="col-sm-8">
                            <input type="email" class="form-control" name="email" id="email_update_input"
                                   placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="age_add_input" class="col-sm-2 control-label"><fmt:message key="dept_name"/></label>
                        <div class="col-sm-3">
                            <label for="dept_update_select"></label>
                            <select class="form-control" name="deptId" id="dept_update_select">
                            </select>
                        </div>
                    </div>
                </form>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"><fmt:message key="cancel"/></button>
                    <button type="button" class="btn btn-primary" id="update_save_btn"><fmt:message key="post"/></button>
                </div>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div class="container">
    <br/>
    <a href="index.jsp?loc=zh_CN">中文</a>|<a href="index.jsp?loc=en_US">English</a>
    <!--标题-->
    <div class="row">
        <div class="col-md-12">
            <h1><fmt:message key="welcomeinfo"/></h1>
        </div>
    </div>
    <!--按钮-->
    <div class="row">
        <div class="col-md-4 col-lg-offset-8">
            <button class="btn btn-primary" id="emp_add_btn">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                <fmt:message key="add"/>
            </button>
            <button class="btn btn-danger" id="delete_all_btn">
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
                    <th>
                        <label>
                            <input type="checkbox" id="check_all">
                        </label>
                    </th>
                    <th><fmt:message key="emp_id"/></th>
                    <th><fmt:message key="emp_name"/></th>
                    <th><fmt:message key="gender"/></th>
                    <th><fmt:message key="age"/></th>
                    <th><fmt:message key="email"/></th>
                    <th><fmt:message key="dept_name"/></th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <!--显示分页信息栏-->
    <div class="row">
        <!-- 分页文字信息-->
        <div class="col-md-6" id="page_info">
        </div>
        <!-- 分页条信息-->
        <div class="col-md-6" id="page_nav">
        </div>
    </div>
</div>

<script type="text/javascript">

    var totalRecord;//总记录数
    var currentPage;//当前页

    $(function () {
        to_page(1);
    });

    function to_page(pn) {
        $.ajax({
            url: "${ctp }/emps",
            type: "GET",
            data: "pn=" + pn,
            contextType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {
                //员工信息
                build_emps_table(result);
                //分页信息
                build_page_info(result);
                //分页数据
                bulid_page_nav(result);
            }
        });
    }

    function build_emps_table(result) {
        //清空表格
        $("#emps_table tbody").empty();
        var emps = result.extend.pageInfo.list;
        $.each(emps, function (index, item) {
            var checkBox = $("<td><input type='checkbox' class='check_item'></td>");
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(item.gender);
            var ageTd = $("<td></td>").append(item.age);
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>").append(item.department.deptName);
            var editBtn = $("<button></button>").addClass("btn btn-warning btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("<fmt:message key='update'/>");
            //添加修改员工自定义属性
            editBtn.attr("edit_id", item.empId);
            var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                .append("<fmt:message key='delete'/>");
            //添加删除员工自定义属性
            deleteBtn.attr("delete_id", item.empId);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(deleteBtn);
            $("<tr></tr>").append(checkBox).append(empIdTd).append(empNameTd).append(genderTd)
                .append(ageTd).append(emailTd).append(deptNameTd).append(btnTd)
                .appendTo("#emps_table tbody");
        })
    }

    function build_page_info(result) {
        $("#page_info").empty();
        $("#page_info").append("当前第" + result.extend.pageInfo.pageNum + "页，共"
            + result.extend.pageInfo.pages + "页，共" + result.extend.pageInfo.total + "条记录");
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;
    }

    function bulid_page_nav(result) {
        $("#page_nav").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        if (result.extend.pageInfo.hasPreviousPage) {
            var firstPageLi = $("<li></li>").append($("<a></a>)").append("<fmt:message key='first'/>")
                .attr("href", "#"));
            var prePageLi = $("<li></li>").append($("<a></a>)").append("&laquo;"));
            //添加单击事件
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        }
        if (result.extend.pageInfo.hasNextPage) {
            var nextPageLi = $("<li></li>").append($("<a></a>)").append("&raquo;"));
            var lastPageLi = $("<li></li>").append($("<a></a>)").append("<fmt:message key='last'/>")
                .attr("href", "#"));
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
        }
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>)").append(item));
            if (result.extend.pageInfo.pageNum == item)
                numLi.addClass("active");
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);
        var nav = $("<nav></nav>").append(ul);
        nav.appendTo("#page_nav");
    }

    function reset_form() {
        document.getElementById("emp_add_form").reset();
        $("#emp_add_form").find("*").removeClass("has-success has-error");
        $("#emp_add_form").find(".help-block").text("");
    }


    $("#emp_add_btn").click(function () {
        reset_form();
        getDepts("#dept_add_select");
        $("#emp_add_modal").modal({
            backdrop: "static"
        })
    });

    function getDepts(ele) {
        $("#dept_add_select").empty();
        $.ajax({
            url: "${ctp }/depts",
            type: "GET",
            contextType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {
                $.each(result.extend.depts, function () {
                    var optionEle = $("<option></option>").append(this.deptName).attr('value', this.deptId);
                    optionEle.appendTo(ele);
                })
            }
        })
    }

    <!--前端数据校验方法抽取-->
    function show_validate_msg(ele, status, msg) {
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if (status == "success")
            $(ele).parent().addClass("has-success");
        else if (status == "error")
            $(ele).parent().addClass("has-error");
        $(ele).next("span").text(msg);
    }

    function validate_add_form() {
        //拿到要校验的数据
        var empName = $("#empName_add_input").val();
        var regName = /^[\u2E80-\u9FFFa-zA-Z0-9_-]{2,8}$/;
        if (!regName.test(empName)) {
            show_validate_msg("#empName_add_input", "error", "用户名必须是2～8位汉子数字或英文的组合");
            return false;
        } else {
            show_validate_msg("#empName_add_input", "success", "");
        }
        var age = $("#age_add_input").val();
        var regAge = /^(1[89]|[234]\d|50)$/;
        if (!regAge.test(age)) {
            show_validate_msg("#age_add_input", "error", "年龄必须是18～50之间");
            return false;
        } else {
            show_validate_msg("#age_add_input", "success", "");
        }
        var email = $("#email_add_input").val();
        var regEmail = /^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/;
        if (!regEmail.test(email)) {
            show_validate_msg("#email_add_input", "error", "邮箱必须是xxx@xxx.xxx格式");
            return false;
        } else {
            show_validate_msg("#email_add_input", "success", "");
        }
        return true;
    }

    $("#empName_add_input").change(function () {
        var empName = this.value;
        //发送ajax请求检验用户名是否可用
        $.ajax({
            url: "${ctp }/checkname",
            data: "empName=" + empName,
            type: "POST",
            contextType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {
                if (result.code == 1) {
                    show_validate_msg("#empName_add_input", "success", result.extend.validate_msg);
                    $("#input_save_btn").attr("ajax_validate", "success");
                } else {
                    show_validate_msg("#empName_add_input", "error", result.extend.validate_msg);
                    $("#input_save_btn").attr("ajax_validate", "error");
                }
            }
        })
    });

    $("#input_clear_btn").click(function () {
        reset_form();
    });

    $("#input_save_btn").click(function () {
        if (!validate_add_form())
            return false;
        //先判断ajax请求检验用户名是否成功
        if ($(this).attr("ajax_validate") == "error")
            return false;
        //模态框中的表单数据提交给服务器进行保存
        $.ajax({
            url: "${ctp }/emp",
            type: "POST",
            data: decodeURIComponent($("#emp_add_form").serialize()),
            contextType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {
                if (result.code == 1) {
                    $("#emp_add_modal").modal('hide');
                    to_page(totalRecord);
                } else {
                    //哪个字段有错就显示哪个字段
                    if (undefined != result.extend.errorFields.empName)
                        show_validate_msg("#empName_add_input", "error", result.extend.errorFields.empName);
                    if (undefined != result.extend.errorFields.age)
                        show_validate_msg("#age_add_input", "error", result.extend.errorFields.age);
                    if (undefined != result.extend.errorFields.email)
                        show_validate_msg("#email_add_input", "error", result.extend.errorFields.email);
                }
            }
        })
    });

    //全选框单击事件
    $("#check_all").click(function () {
        $(".check_item").prop("checked", $(this).prop("checked"));
    });

    //给edit_btn在页面显示完之后添加单击事件
    $(document).on("click", ".edit_btn", function () {
        $("#dept_update_select").empty();
        $("#emp_update_form").find("*").removeClass("has-success has-error");
        $("#emp_update_form").find(".help-block").text("");
        //提取出员工信息并显示
        getDepts("#dept_update_select");
        getEmp($(this).attr("edit_id"));
        //把员工id传递给更新按钮
        $("#update_save_btn").attr("edit_id", $(this).attr("edit_id"));
        $("#emp_update_modal").modal({
            backdrop: "static"
        })
    });

    //给delete_btn在页面显示完之后添加单击事件
    $(document).on("click", ".delete_btn", function () {
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        if (confirm("确认删除【" + empName + "】吗？")) {
            $.ajax({
                url: "${ctp }/emp/" + $(this).attr("delete_id"),
                type: "DELETE",
                contextType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (result) {
                    alert(result.msg);
                    to_page(currentPage);
                }
            })
        }
    });

    $(document).on("click", ".check_item", function () {
        var flag = $(".check_item:checked").length == $(".check_item").length;
        $("#check_all").prop("checked",flag);
    });

    $("#delete_all_btn").click(function () {
        var empNames = "";
        var empIds = "";
        $.each($(".check_item:checked"),function () {
            empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
            empIds += $(this).parents("tr").find("td:eq(1)").text()+"-";
        });
        empNames = empNames.substring(0,empNames.length-1);
        empIds = empIds.substring(0,empIds.length-1);
        if(confirm("确认删除【"+empNames+"】吗？")){
            $.ajax({
                url:"${ctp }/emp/"+empIds,
                type:"DELETE",
                contextType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (result) {
                    alert(result.msg);
                    to_page(currentPage);
                }
            })
        }
    });

    function getEmp(id) {
        $.ajax({
            url: "${ctp }/emp/" + id,
            type: "GET",
            contextType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (result) {
                var empData = result.extend.emp;
                $("#empName_update_static").text(empData.empName);
                $("#emp_update_form input[name=gender]").val([empData.gender]);
                $("#age_update_input").val(empData.age);
                $("#email_update_input").val(empData.email);
                $("#dept_update_select").val([empData.deptId]);
            }
        })
    }

    $("#update_save_btn").click(function () {
        //校验数据
        var age = $("#age_update_input").val();
        var regAge = /^(1[89]|[234]\d|50)$/;
        if (!regAge.test(age)) {
            show_validate_msg("#age_update_input", "error", "年龄必须是18～50之间");
            return false;
        } else {
            show_validate_msg("#age_update_input", "success", "");
        }
        var email = $("#email_update_input").val();
        var regEmail = /^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/;
        if (!regEmail.test(email)) {
            show_validate_msg("#email_update_input", "error", "邮箱必须是xxx@xxx.xxx格式");
            return false;
        } else {
            show_validate_msg("#email_update_input", "success", "");
        }
        //发送ajax请求保存员工信息
        $.ajax({
            url: "${ctp }/emp/" + $(this).attr("edit_id"),
            type: "PUT",
            data: decodeURIComponent($("#emp_update_form").serialize()),
            contextType: "application/json;charset=utf-8",
            dataType: "json",
            success: function () {
                $("#emp_update_modal").modal("hide");
                to_page(currentPage);
            }
        })
    })
</script>

</body>
</html>