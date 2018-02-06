<#import "/spring.ftl" as s>
<!DOCTYPE html>
<html lang="zh_CN" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <title>学生机构设置</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<#include '../include/baselink.ftl'>
    <link rel="stylesheet" type="text/css" href="<@s.url '/assets/css/jquery.pagination.css'/>">
</head>

<body class="dashboard-page">
<#include '../include/skin-toolbox.ftl'>
<div id="main">
<#include '../include/header.ftl'>
<#include '../include/sidebar.ftl'>
    <section id="content_wrapper">
        <header id="topbar" class="alt">
            <div class="topbar-left">
                <ol class="breadcrumb">
                    <li class="crumb-active">
                        <a href="<@s.url '/'/>">控制台</a>
                    </li>
                    <li class="crumb-icon">
                        <a href="<@s.url '/'/>">
                            <span class="glyphicon glyphicon-home"></span>
                        </a>
                    </li>
                    <li class="crumb-link">
                        <a href="<@s.url '/'/>">首页</a>
                    </li>
                    <li class="crumb-trail">学生机构设置</li>
                </ol>
            </div>
        </header>
        <section id="content" class="table-layout animated fadeIn">
            <div class="tray tray-center">
                <div class="panel" id="spy7">
                    <div class="panel-heading">
                          <span class="panel-title">
                            <span class="fa fa-table"></span>学生机构设置
                          </span>
                </div>
                    <div class="tab-pane active">
                        <div class="col-md-12">
                            <p>姓名：${student.stuName!}</p>
                            <p>性别：${student.sex!}</p>
                        </div>
                        <div class="col-md-12">
                        <p>身份证号：${student.cardId!}</p>
                        <p>籍贯：${student.nativePlace!}</p>
                        </div>
                    </div>
                    <div class="panel-body pn">
                        <div class="modal-body">
                            <div class="admin-form">
                                <div class="section">
                                    <label class="field-label">为该学生指定学号</label>
                                    <label class="field prepend-icon">
                                        <div class="form-group">
                                            <input type="text" class="gui-input" v-model="addStudent.stuId">
                                        </div>
                                    </label>
                                </div>
                                <div class="section">
                                    <label class="field-label">姓名</label>
                                    <label class="field prepend-icon">
                                        <div class="form-group">
                                            姓名必须与上面的保持一致
                                            <input type="text" class="gui-input" v-model="addStudent.stuName">
                                        </div>
                                    </label>
                                </div>
                                <div class="section">
                                    <label class="field-label">身份证号</label>
                                    <label class="field prepend-icon">
                                        <div class="form-group">
                                            再次输入上面的身份证号
                                            <input type="text" class="gui-input" v-model="addStudent.cardId">
                                        </div>
                                    </label>
                                </div>
                                <div class="section">
                                    <label class="field-label">为该学生指定学院</label>
                                    <label class="field prepend-icon">
                                        <div class="form-group">
                                            <input type="text" class="gui-input" v-model="addStudent.academy">
                                        </div>
                                    </label>
                                </div>
                                <div class="section">
                                    <label class="field-label">为该学生指定系</label>
                                    <label class="field prepend-icon">
                                        <div class="form-group">
                                            <input type="text" class="gui-input" v-model="addStudent.department">
                                        </div>
                                    </label>
                                </div>
                                <div class="section">
                                    <label class="field-label">为该学生指定班</label>
                                    <label class="field prepend-icon">
                                        <div class="form-group">
                                            <input type="text" class="gui-input" v-model="addStudent.clazz">
                                        </div>
                                    </label>
                                </div>
                            </div>

                        </div>
                        <button type="button" class="btn btn-primary" @click="submit()">确定提交</button>

                    </div>
                </div>
            </div>
        </section>
    <#include '../include/footer.ftl' />
    </section>
</div>
<#include '../include/footer_js.ftl'/>
<script src="<@s.url '/assets/js/jquery.pagination.min.js'/>"></script>
<script src="<@s.url '/assets/plugins/ueditor/ueditor.config.js'/>"></script>
<script src="<@s.url '/assets/plugins/ueditor/ueditor.all.min.js'/>"></script>
<script>
    var app = new Vue({
        el:"#main",
        data:{
            addStudent:{
                stuId:"",
                stuName:"",
                cardId:"",
                academy:"",
                department:"",
                clazz:""
            }
        },
        methods:{
            submit:function () {
                this.$http.post(contentPath+"/api/school/save",this.addStudent).then(
                    function (response) {
                        sweetAlert("保存成功，该学生的信息已经插入", "该学生的信息已经插入" , "info");
                        location.reload();
                    },function (response) {
                            sweetAlert(response.data.message,"错误码"+response.data.code , "error");
                        }

                )
            },


        }


    })

</script>



</body>

</html>
