<#import "spring.ftl" as s>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="utf-8">
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<#include 'include/baselink.ftl'>
</head>
<body class="external-page external-alt sb-l-c sb-r-c">
<div id="main" class="animated fadeIn">

    <section id="content_wrapper">
        <section id="content">
            <div class="admin-form theme-info mw500">
                <div class="panel mt30 mb25">
                        <div class="panel-body bg-light p25 pb15">

                            <div class="section-divider mv30">
                                <span>欢迎使用学生档案管理系统</span>
                            </div>
                            <div class="section">
                                <label for="username" class="field-label text-muted fs18 mb10">账号</label>
                                <label for="username" class="field prepend-icon">
                                    <input type="text" v-model="admin.userName" class="gui-input">
                                    <label for="username" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="section">
                                <label for="username" class="field-label text-muted fs18 mb10">密码</label>
                                <label for="password" class="field prepend-icon">
                                    <input  type="password" v-model="admin.passWord" class="gui-input">
                                    <label for="password" class="field-icon">
                                        <i class="fa fa-lock"></i>
                                    </label>
                                </label>
                            </div>
                        </div>
                        <div class="panel-footer clearfix">
                            <div>
                                <div class="pull-left">
                                    <button data-toggle="modal" data-target="#myModald"  class="button btn-primary">点一下</button>
                                </div>
                                <div class="pull-right">
                                    <button class="button btn-primary block" @click="login(admin)">登录</button>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </section>
    </section>
</div>
<#include 'include/footer_js.ftl'/>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3 class="modal-title" id="myModalLabel">注册管理员</h3>
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
                                <input type="text" class="gui-input" v-model="register.passWord">
                            </div>
                        </label>
                    </div>
                    <div class="section">
                        <label class="field-label">再次输入新密码</label>
                        <label class="field prepend-icon">
                            <div class="form-group">
                                <input type="text" class="gui-input" v-model="register.passWord">
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
                    <button type="button" class="btn btn-primary" @click="register()">确定注册</button>
                    <button type="button" class="btn btn-primary"  data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<@s.url '/assets/js/jquery.pagination.min.js'/>"></script>
<script src="<@s.url '/assets/plugins/ueditor/ueditor.config.js'/>"></script>
<script src="<@s.url '/assets/plugins/ueditor/ueditor.all.min.js'/>"></script>
<script>

    var app=new Vue({
        el:"#main",
        data:{
            admin:{
                userName:"",
                passWord:""
            }
        },
        methods:{
            login:function (admin) {
                if (this.admin.userName === "" || this.admin.passWord === "") {
                    sweetAlert("账号密码不能为空", "请输入账号和密码", "info");
                } else {
                    this.$http.post(contentPath + "/api/admin/find",admin).then(
                            function (response) {
                                if (response.data.code === 1000) {
                                    sweetAlert("登陆失败", response.data.message, "info");
                                }
                                else if (response.data.code === 1001) {
                                    sweetAlert("登陆失败", response.data.message, "info");
                                } else {
                                    sweetAlert("登陆成功", "即将跳转首页", "info");
                                    window.location.href = "http://localhost:8080/stumanage/admin/index"
                                }
                            }, function (response) {
                                sweetAlert(response.data.message, "错误码" + response.data.code, "error");
                            })
                }
            }
        }

    })

</script>
</body>

</html>
