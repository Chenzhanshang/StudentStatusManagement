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
                                        <td align="center">
                                            <button data-toggle="modal" data-target="#myModalDel" @click="delAdmin(admin)">删除</button>
                                        </td>
                                    </tr>

                                    <tr v-show="admins.length==0">
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
</div>
<#include '../include/footer_js.ftl'/>
    <script src="<@s.url '/assets/js/jquery.pagination.min.js'/>"></script>
    <script src="<@s.url '/assets/plugins/ueditor/ueditor.config.js'/>"></script>
    <script src="<@s.url '/assets/plugins/ueditor/ueditor.all.min.js'/>"></script>
    <script>
        var app = new Vue({
            el:"#main",
            data:{

                admins:[],
                record:{
                    page:1,
                    pageSize:10
                }
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
                    this.$http.get(contentPath+"/api/admin/del",{
                        params:{
                            id:admin.id;
                        }
                    }).then(
                        function (response) {
                            sweetAlert("删除成功", "删除成功" , "info");
                            location.reload();
                        },function (response) {
                                sweetAlert(response.data.message,"错误码"+response.data.code , "error");
                            })
                        }
                }
        })

    </script>



</body>

</html>
