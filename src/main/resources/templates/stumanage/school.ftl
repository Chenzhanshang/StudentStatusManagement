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
                            <p align="center">姓名：${student.stuName!}</p>
                            <p align="center">性别：${student.sex!}</p>
                        </div>
                        <div class="col-md-12">
                        <p align="center">身份证号：${student.cardId!}</p>
                        <p align="center">籍贯：${student.nativePlace!}</p>
                        </div>
                    </div>
                    <div class="panel-body pn">
                        <div class="modal-body">
                            <div class="admin-form" align="center">
                                <div class="row" align="center  ">
                                    <div class="col-md-4">
                                        <div class="section">
                                            <label class="field-label">为该学生指定学号
                                            </label>
                                            <label class="field prepend-icon">
                                                <input type="text" class="gui-input" v-model="addStudent.stuId">
                                                <label class="field-icon">
                                                    <i class="fa fa-edit"></i>
                                                </label>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="section">
                                            <label class="field-label">选择学院
                                            </label>
                                            <label class="field select">
                                                <select v-model="addStudent.academy">
                                                    <option v-for="academy in academys" v-bind:value="academy">{{academy}}</option>
                                                </select>
                                                <i class="arrow double"></i>
                                            </label>
                                        </div>
                                    </div>
                            </div>
                            <div class="row">
                              <#--  <div class="col-md-4">
                                    <div class="section">
                                        <label class="field-label">选择系
                                        </label>
                                        <label class="field select">
                                            <select v-model="addStudent.department">
                                                <option v-for="department in departments" value="department">{{department}}</option>
                                            </select>
                                            <i class="arrow double"></i>
                                        </label>
                                    </div>
                                </div>-->
                                <div class="col-md-4">
                                    <div class="section">
                                        <label class="field-label">选择班级
                                        </label>
                                        <label class="field select">
                                            <select v-model="addStudent.clazz">
                                                <option value="一班">一班</option>
                                                <option value="二班">二班</option>
                                                <option value="三班">三班</option>
                                                <option value="四班">四班</option>
                                            </select>
                                            <i class="arrow double"></i>
                                        </label>
                                    </div>
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
            academys:[],
            departments:[],
            addStudent:{
                stuId:"",
                stuName:"${student.stuName!}",
                cardId:"${student.cardId!}",
                academy:"",
                department:"",
                clazz:""
            }
        },
        created:function () {
            this.queryAcademy();
        },
        /*watch:{
            'addStudent.academy':function () {
                this.queryDepartment();
            }
        },*/
        methods:{
            submit:function () {
                this.$http.post(contentPath+"/api/school/save",this.addStudent).then(
                    function (response) {
                        sweetAlert("保存成功，该学生的信息已经插入", "该学生的信息已经插入" , "info");
                    },function (response) {
                            sweetAlert(response.data.message,"错误码"+response.data.code , "error");
                        }
                )
            },
            queryAcademy:function () {
                this.$http.get(contentPath+"/api/school/queryAcademy").then(
                        function (response) {
                            this.academys=response.data.data;
                        },function (response) {
                            sweetAlert(response.data.message,"错误码"+response.data.code , "error");
                        }
                )
            },
            queryDepartment:function () {
                this.$http.get(contentPath+"/api/school/queryDepartment",{
                    params:{
                        academyName:this.addStudent.academy
                    }
                }).then(
                        function (response) {
                            this.departments=response.data.data;
                        },function (response) {
                            sweetAlert(response.data.message,"错误码"+response.data.code , "error");
                        }
                )
            }




        }


    })

</script>



</body>

</html>
