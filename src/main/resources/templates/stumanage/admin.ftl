<#import "/spring.ftl" as s>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="utf-8">
    <title>用户设置</title>
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
                欢迎您！${tbAdmin.nickName!}
                <button data-toggle="modal" data-target="#myModalEditPass"   class="button btn-primary">修改管理员密码</button>
                <button data-toggle="modal" data-target="#myModalEditPhone"  class="button btn-primary">修改手机号</button>
            </div>
        </section>
    <#include '../include/footer.ftl' />
    </section>

    <div class="modal fade" id="myModalEditPass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title" id="myModalLabel">修改密码</h3>
                </div>
                <div class="modal-body">
                    <div class="admin-form">
                        <div class="section">
                            <label class="field-label">旧密码</label>
                            <label class="field prepend-icon">
                                <div class="form-group">
                                    <input type="password" class="gui-input" v-model="admin.passWord">
                                </div>
                            </label>
                        </div>
                        <div class="section">
                            <label class="field-label">新密码</label>
                            <label class="field prepend-icon">
                                <div class="form-group">
                                    <input type="password" class="gui-input" v-model="admin.passWordNew">
                                </div>
                            </label>
                        </div>
                        <div class="section">
                            <label class="field-label">再次输入新密码</label>
                            <label class="field prepend-icon">
                                <div class="form-group">
                                    <input type="password" class="gui-input" v-model="admin.passWordNewTwo">
                                </div>
                            </label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" @click="editPassSave()">确定修改</button>
                        <button type="button" class="btn btn-primary"  data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="myModalEditPhone" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title" id="myModalLabel">修改手机号</h3>
                </div>
                <div class="modal-body">
                    <div class="admin-form">
                        <div class="section">
                            <label class="field-label">现用手机号</label>
                            <label class="field prepend-icon">
                                <div class="form-group">
                                    <input type="text" class="gui-input" v-model="admin.phone">
                                </div>
                            </label>
                        </div>
                        <div class="section">
                            <label class="field-label">要更换的手机号</label>
                            <label class="field prepend-icon">
                                <div class="form-group">
                                    <input type="text" class="gui-input" v-model="admin.phoneNew">
                                </div>
                            </label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" @click="editPhoneSave()">确定修改</button>
                        <button type="button" class="btn btn-primary"  data-dismiss="modal">关闭</button>
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
        var aa = new Vue({
            el: "#main",
            data: {
                admin:{
                    passWord:"",
                    passWordNew:"",
                    passWordNewTwo:"",
                    phone:"",
                    phoneNew:""
                },
                tbAdmin:{
                    id:"",
                    nickName:"",
                    userName:"",
                    passWord:"",
                    phone:""
                }
            },
            created:function () {
                this.$http.get("/api/admin/getNowAdmin").then(
                    function (response) {
                        this.tbAdmin=response.body.data;
                    }, function (response) {
                        sweetAlert(response.data.message, "错误码" + response.data.code, "error");
                    })
            },
            methods: {
                editPassSave: function () {
                    if (this.admin.passWord === this.tbAdmin.passWord) {
                        if (this.admin.passWordNew === this.admin.passWordNewTwo && this.admin.passWordNew !== "") {
                                this.tbAdmin.passWord = this.admin.passWordNew;
                            this.$http.post("/api/admin/update", this.tbAdmin).then(
                                    function (response) {
                                        sweetAlert("修改成功", "下次登陆请用新密码", "info");
                                    }, function (response) {
                                        sweetAlert(response.data.message, "错误码" + response.data.code, "error");
                                    })
                        } else {
                            sweetAlert("修改失败", "两次新密码输入不一致", "info");
                        }
                    } else {
                        sweetAlert("修改失败", "请输入正确的现有密码", "info");
                    }

                },
                editPhoneSave: function () {
                    if (this.admin.phone === this.tbAdmin.phone) {
                        if (this.admin.phoneNew != ""){
                            this.tbAdmin.phone=this.admin.phone;
                            this.$http.post("/api/admin/update", this.tbAdmin).then(
                                    function (response) {
                                        sweetAlert("修改成功", "修改成功", "info");
                                    }, function (response) {
                                        sweetAlert(response.data.message, "错误码" + response.data.code, "error");
                                    })
                        }else{
                            sweetAlert("修改失败", "手机号不能为空", "info");
                        }
                    }else {
                        sweetAlert("修改失败", "请输入正确的现有手机号", "info");
                    }
                }
            }
        })
    </script>
</div>
</body>

</html>
