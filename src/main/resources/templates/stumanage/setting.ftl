<#import "/spring.ftl" as s>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="utf-8">
    <title>管理员设置</title>
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
                    <li class="crumb-trail">管理员设置</li>
                </ol>
            </div>
        </header>
        <section id="content" class="table-layout animated fadeIn">
            <div class="tray tray-center">
                <div class="panel" id="spy7">
                    <div class="panel" id="spy7">
                        <div class="panel-heading">
                              <span class="panel-controls">
                            <a href="#" class="btn-default w75 fw600 ml10" data-toggle="modal"
                               data-target="#myModalAdd">
                                添加管理员
                            </a>
                            <a href="#" class="panel-control-collapse"></a>
                            <a href="#" class="panel-control-fullscreen"></a>
                        </span>
                        </div>
                    </div>
                    <div class="panel-body pn">
                        <div class="bs-component">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <td align="center">编号</td>
                                        <td align="center">昵称</td>
                                        <td align="center">账号</td>
                                        <td align="center">密码</td>
                                        <td align="center">手机号</td>
                                        <td align="center">操作</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="admin in admins">
                                        <td align="center">{{admin.id}}</td>
                                        <td align="center">{{admin.nickName}}</td>
                                        <td align="center">{{admin.userName}}</td>
                                        <td align="center">{{admin.passWord}}</td>
                                        <td align="center">{{admin.phone}}</td>
                                        <td align="center" v-if="admin.userName!=='admin'">
                                            <button data-toggle="modal" data-target="#myModalDel" @click="delAdmin(admin)">删除</button>
                                        </td>
                                    </tr>

                                    <tr v-if="admins.length==0">
                                        <td class="text-center" colspan="20">没有数据 ！</td>
                                    </tr>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td colspan="20">
                                            <div class="table-responsive">
                                                <div id="callBackPager"></div>
                                            </div>
                                        </td>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End: Content -->
    <#include '../include/footer.ftl' />
    </section>
    <div class="modal fade" id="myModalAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title" id="myModalLabel">添加管理员</h3>
                </div>
                <div class="modal-body">
                    <div class="admin-form">
                        <div class="section">
                            <label class="field-label">姓名</label>
                            <label class="field prepend-icon">
                                <div class="form-group">
                                    <input type="text" class="gui-input" v-model="register.nickName">
                                </div>
                            </label>
                        </div>
                        <div class="section">
                            <label class="field-label">用户名</label>
                            <label class="field prepend-icon">
                                <div class="form-group">
                                    <input type="text" class="gui-input" v-model="register.userName">
                                </div>
                            </label>
                        </div>
                        <div class="section">
                            <label class="field-label">密码</label>
                            <label class="field prepend-icon">
                                <div class="form-group">
                                    <input type="password" class="gui-input" v-model="register.passWord">
                                </div>
                            </label>
                        </div>
                        <div class="section">
                            <label class="field-label">再次输入新密码</label>
                            <label class="field prepend-icon">
                                <div class="form-group">
                                    <input type="password" class="gui-input" v-model="register.passWordTwo">
                                </div>
                            </label>
                        </div>
                        <div class="section">
                            <label class="field-label">手机号</label>
                            <label class="field prepend-icon">
                                <div class="form-group">
                                    <input type="text" class="gui-input" v-model="register.phone">
                                </div>
                            </label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" @click="registerM()">确定注册</button>
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
                register:{
                    nickName:"",
                    userName:"",
                    passWord:"",
                    passWordTwo:"",
                    phone:""
                },
                admins:[],
                record:{
                    page:1,
                    pageSize:10
                }
            },
            created:function () {
                this.queryAll();
            },
            watch: {
                'record.page': function () {
                    this.queryAll();
                }
            },
            methods:{
                queryAll:function () {
                    this.$http.post(contentPath+"/api/admin/findAll",this.record).then(
                    function (response) {
                        this.admins=response.data.data.list;
                        var temp = this;
                        $("#callBackPager").page({
                            total: response.data.data.total,
                            pageSize: response.data.data.pageSize,
                            firstBtnText: '首页',
                            lastBtnText: '尾页',
                            prevBtnText: '上一页',
                            nextBtnText: '下一页',
                            showInfo: true,
                            showJump: true,
                            jumpBtnText: '跳转',
                            infoFormat: '{start} ~ {end}条，共{total}条'
                        }, response.data.data.pageNum)
                                .on("pageClicked", function (event, pageIndex) {
                                    temp.record.page = pageIndex + 1;
                                }).on('jumpClicked', function (event, pageIndex) {
                            temp.record.page = pageIndex + 1;
                        });
                    },function (response) {
                                sweetAlert(response.data.message, "错误码" + response.data.code, "error");
                            })
                },
                delAdmin:function (admin) {
                    if(confirm("确定删除吗？")){
                        this.$http.get(contentPath+"/api/admin/del",{
                            params:{
                                id:admin.id
                            }
                        }).then(
                                function (response) {
                                    sweetAlert("删除成功", "删除成功" , "info");
                                    location.reload();
                                },function (response) {
                                    sweetAlert(response.data.message,"错误码"+response.data.code , "error");
                                })
                    }
                        },
                registerM:function () {
                            if (this.register.passWord === this.register.passWordTwo ) {
                                this.$http.post(contentPath+"/api/admin/register",this.register).then(
                                        function (response) {
                                            if (response.data.code === 1005) {
                                                sweetAlert("错误码"+response.data.code, response.data.message, "error");
                                            }else {
                                                sweetAlert(""+response.data.code, response.data.message, "info");
                                                location.reload();
                                            }
                                        }, function (response) {
                                            sweetAlert(response.data.message, "错误码" + response.data.code, "error");
                                        })
                            } else if(this.register.passWordTwo !== ""){
                                sweetAlert("添加失败", "密码不能为空", "info");
                            }else {
                            sweetAlert("添加失败", "两次新密码输入不一致", "info");
                                }
                    }
                }
        })

    </script>



</body>

</html>
