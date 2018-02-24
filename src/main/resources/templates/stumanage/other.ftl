<#import "/spring.ftl" as s>
<!DOCTYPE html>
<html lang="zh_CN" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <title>学生奖惩设置</title>
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
                    <li class="crumb-trail">学生奖惩设置</li>
                </ol>
            </div>
        </header>
        <section id="content" class="table-layout animated fadeIn">
            <div class="tray tray-center">
                <div class="panel" id="spy7">
                    <div class="panel-heading">
                          <span class="panel-title">
                            <span class="fa fa-table"></span>学生奖惩信息
                          </span>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;输入学号：
                        <input type="text" class=" btn-default btn-sm w85 fw700 ml20" v-model="queryStuId">
                        <button class="btn btn-default btn-sm w75 fw600 ml10" @click="findByStuId()">
                            学号查找
                        </button>
                        <span class="panel-controls">
                            <a href="#" class="panel-control-collapse"></a>
                            <a href="#" class="panel-control-fullscreen"></a>
                        </span>
                    </div>
                    <div class="panel-body pn">
                        <div class="bs-component">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <td align="center">编号</td>
                                        <td align="center">姓名</td>
                                        <td align="center">学号</td>
                                        <td align="center">奖惩信息</td>
                                        <td align="center">操作</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-bind="queryStuIdResult" v-if="queryStuIdResult!==''">
                                        <td align="center">{{queryStuIdResult.id}}</td>
                                        <td align="center">{{queryStuIdResult.stuName}}</td>
                                        <td align="center">{{queryStuIdResult.stuId}}</td>
                                        <td align="center">{{queryStuIdResult.experience}}</td>
                                        <td align="center">
                                            <button data-toggle="modal" data-target="#myModalShow" @click="show(queryStuIdResult)">详细</button>
                                            <button data-toggle="modal" data-target="#myModalEdit" @click="edit(queryStuIdResult)">编辑</button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
    <#include '../include/footer.ftl' />
    </section>
    <div class="modal fade" id="myModalEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title" id="myModalLabel">编辑奖惩信息</h3>
                </div>
                <div class="modal-body">
                    <div class="admin-form">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">编号
                                    </label>
                                    <div class="form-group">
                                        {{editOther.id}}
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">姓名
                                    </label>
                                        <div class="form-group">{{editOther.stuName}}</div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">学号</label>
                                            <div class="form-group">{{editOther.stuId}}</div>
                                </div>
                            </div>
                        </div>

                        <div class="section">
                            <label class="field-label">奖惩信息
                            </label>
                            <label for="description" class="field prepend-icon">
                            <textarea class="gui-textarea"
                                    v-model="editOther.experience"></textarea>
                                <label class="field-icon">
                                    <i class="fa fa-edit"></i>
                                </label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" @click="editOtherSave()">保存修改</button>
                        <button type="button" class="btn btn-primary"  data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="myModalShow" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h3 class="modal-title" id="myModalLabel">详细奖惩信息</h3>
                    </div>
                    <div class="modal-body">
                        <div class="admin-form">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="section">
                                        <label class="field-label">编号
                                        </label>

                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="section">
                                        <label class="field-label">姓名</label>
                                            <div class="form-group">{{showOther.stuName}}</div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="section">
                                        <label class="field-label">学号
                                            <label class="field select">
                                                <div class="form-group">{{showOther.stuId}}</div>
                                            </label>
                                    </div>
                                </div>
                            </div>

                            <div class="section">
                                <label class="field-label">奖惩信息
                                </label>
                                    <div class="form-group">{{showOther.experience}}</div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary"  data-dismiss="modal">关闭</button>
                        </div>
                    </div>
                </div>
            </div>
    </div>

</div>
<#include '../include/footer_js.ftl'/>
<script src="<@s.url '/assets/js/jquery.pagination.min.js'/>"></script>
<script src="<@s.url '/assets/plugins/ueditor/ueditor.config.js'/>"></script>
<script src="<@s.url '/assets/plugins/ueditor/ueditor.all.min.js'/>"></script>
<script>
    var app = new Vue({
        el:"#main",
        data:{
            queryStuIdResult:{
                id:"",
                stuName:"",
                stuId:"",
                experience:""
            },
            queryStuId:"",
            editOther:{},
            showOther:{}
        },
        methods:{
            show:function (item) {
                this.showOther=item;
            },
            edit:function (item) {
                this.editOther=item;
            },
            editOtherSave :function () {
                this.$http.post(contentPath+"/api/school/update",this.editOther).then(
                    function (response) {
                        sweetAlert("保存成功，该学生的信息已经插入", "该学生的信息已经插入" , "info");
                    },function (response) {
                            sweetAlert(response.data.message,"错误码"+response.data.code , "error");
                        }
                )
            },
            findByStuId:function () {
                if(this.queryStuId===""){
                    sweetAlert("请输入学号", "请输入学号" , "info");
                }
                else{
                this.$http.get(contentPath+"/api/school/findByStuId",{
                    params: {
                        stuId:this.queryStuId
                }
                    }).then(
                        function (response) {
                            this.queryStuIdResult=response.data.data;
                        },function (response) {
                            sweetAlert("没有查该学生的奖惩信息,请重新输入","错误码"+response.data.code , "error");
                        })}
            }



        }
    })

</script>



</body>

</html>
