<#import "/spring.ftl" as s>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="utf-8">
    <title>学生学籍设置</title>
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
                    <li class="crumb-trail">学生学籍设置</li>
                </ol>
            </div>
        </header>
        <section id="content" class="table-layout animated fadeIn">
            <div class="tray tray-center">
                <div class="panel" id="spy7">
                    <div class="panel-heading">
                          <span class="panel-title">
                            <span class="fa fa-table"></span>学生学籍信息
                          </span>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;输入学号：
                            <input type="text" class=" btn-default btn-sm w85 fw700 ml20" v-model="queryStuId">

                        <button class="btn btn-default btn-sm w75 fw600 ml10" @click="findByStuId()">
                            学号查找
                        </button>
                        <span class="panel-controls">
                            <a href="#" class="btn-default w75 fw600 ml10" data-toggle="modal"
                               data-target="#myModalAdd">
                                添加新学生
                            </a>
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
                                        <td align="center">性别</td>
                                        <td align="center">身份证号</td>
                                        <td align="center">入学时间</td>
                                        <td align="center">创建人</td>
                                        <td align="center">操作</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="info in infos">
                                        <td align="center">{{info.id}}</td>
                                        <td align="center">{{info.stuName}}</td>
                                        <td align="center">{{info.sex}}</td>
                                        <td align="center">{{info.cardId}}</td>
                                        <td align="center">{{info.schoolTime}}</td>
                                        <td align="center">{{info.createdBy}}</td>
                                        <td align="center">
                                            <button data-toggle="modal" data-target="#myModalShow" @click="showInfoo(info)">详细</button>
                                            <button data-toggle="modal" data-target="#myModalEdit" @click="editInfo(info)">编辑</button>
                                            <#--传后台身份证号查插入的学籍返回在另一个页面上-->

                                        </td>
                                    </tr>
                                    <tr v-bind="queryStuIdResult" v-if="queryStuIdResult!==''">
                                        <td align="center">{{queryStuIdResult.id}}</td>
                                        <td align="center">{{queryStuIdResult.stuName}}</td>
                                        <td align="center">{{queryStuIdResult.sex}}</td>
                                        <td align="center">{{queryStuIdResult.cardId}}</td>
                                        <td align="center">{{queryStuIdResult.schoolTime}}</td>
                                        <td align="center">{{queryStuIdResult.createdBy}}</td>
                                        <td align="center">
                                            <button data-toggle="modal" data-target="#myModalShow" @click="showInfoo(queryStuIdResult)">详细</button>
                                            <button data-toggle="modal" data-target="#myModalEdit" @click="editInfo(queryStuIdResult)">编辑</button>
                                        <#--传后台身份证号查插入的学籍返回在另一个页面上-->
                                        </td>
                                    </tr>
                                    <tr v-show="infos.length==0&&queryStuIdResult.length==0">
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
    <div class="modal fade" id="myModalShow" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title" id="myModalLabel">查看学籍详情</h3>
                </div>
                <div class="modal-body">
                    <div class="admin-form">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">姓名
                                    </label>
                                    <div class="form-group">
                                        {{showInfo.stuName}}
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">性别
                                    </label>
                                    <div class="form-group">
                                        {{showInfo.sex}}
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="section">
                            <label class="field-label">身份证号
                            </label>
                            <div class="form-group">
                                {{showInfo.cardId}}
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">民族
                                    </label>
                                    <div class="form-group">
                                        {{showInfo.nation}}
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">籍贯
                                    </label>
                                    <div class="form-group">
                                        {{showInfo.nativePlace}}
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="section">
                            <label class="field-label">出生地
                            </label>
                            <div class="form-group">
                                {{showInfo.birthPlace}}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">政治面貌
                                    </label>
                                    <div class="form-group">
                                        {{showInfo.politicsStatus}}
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">婚否
                                    </label>
                                    <div class="form-group">
                                        {{showInfo.weddingStatus}}
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">学籍状态
                                    </label>
                                    <div class="form-group">
                                        {{showInfo.schoolStatus}}
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">入学时间</label>
                                    <div class="form-group">
                                        {{showInfo.schoolTime}}
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="modal fade" id="myModalEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title" id="myModalLabel">编辑学籍信息</h3>
                </div>
                <div class="modal-body">
                    <div class="admin-form">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">姓名
                                    </label>
                                    <label class="field prepend-icon">
                                        <input type="text" class="gui-input" v-model="updateInfo.stuName">
                                        <label class="field-icon">
                                            <i class="fa fa-edit"></i>
                                        </label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">性别
                                    </label>
                                    <label class="field select">
                                        <select v-model="updateInfo.sex">
                                            <option value="男">男</option>
                                            <option value="女">女</option>
                                        </select>
                                        <i class="arrow double"></i>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="section">
                            <label class="field-label">身份证号
                            </label>
                            <label class="field prepend-icon">
                                <input type="text" class="gui-input" v-model="updateInfo.cardId">
                                <label class="field-icon">
                                    <i class="fa fa-edit"></i>
                                </label>
                            </label>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">民族
                                    </label>
                                    <label class="field prepend-icon">
                                        <input type="text" class="gui-input" v-model="updateInfo.nation">
                                        <label class="field-icon">
                                            <i class="fa fa-edit"></i>
                                        </label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">籍贯
                                    </label>
                                    <label class="field prepend-icon">
                                        <input type="text" class="gui-input" v-model="updateInfo.nativePlace">
                                        <label class="field-icon">
                                            <i class="fa fa-edit"></i>
                                        </label>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="section">
                            <label class="field-label">出生地
                            </label>
                            <label class="field prepend-icon">
                                <input type="text" class="gui-input" v-model="updateInfo.birthPlace">
                                <label class="field-icon">
                                    <i class="fa fa-edit"></i>
                                </label>
                            </label>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">政治面貌
                                    </label>
                                    <label class="field select">
                                        <select v-model="updateInfo.politicsStatus">
                                            <option value="群众">群众</option>
                                            <option value="团员">团员</option>
                                            <option value="党员">党员</option>
                                        </select>
                                        <i class="arrow double"></i>
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">婚否
                                    </label>
                                    <label class="field select">
                                        <select v-model="updateInfo.weddingStatus">
                                            <option value="未婚">未婚</option>
                                            <option value="已婚">已婚</option>
                                        </select>
                                        <i class="arrow double"></i>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">学籍状态
                                    </label>
                                    <label class="field select">
                                        <select v-model="updateInfo.schoolStatus">
                                            <option value="在读">在读</option>
                                            <option value="已毕业">已毕业</option>
                                        </select>
                                        <i class="arrow double"></i>
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">入学时间</label>
                                    <label class="field prepend-icon">
                                        <div class="form-group">
                                            <input type="text" class="gui-input" v-model="updateInfo.schoolTime">
                                        </div>
                                    </label>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" @click="delInfo(updateInfo)">注销此学籍</button>
                        <button type="button" class="btn btn-primary" @click="updateInfoSave()">保存修改</button>
                        <button type="button" class="btn btn-primary"  data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="myModalAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title" id="myModalLabel">添加新学生</h3>
                </div>
                <div class="modal-body">
                    <div class="admin-form">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">姓名
                                    </label>
                                    <label class="field prepend-icon">
                                        <input type="text" class="gui-input" v-model="addInfo.stuName">
                                        <label class="field-icon">
                                            <i class="fa fa-edit"></i>
                                        </label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">性别
                                    </label>
                                    <label class="field select">
                                        <select v-model="addInfo.sex">
                                            <option value="男">男</option>
                                            <option value="女">女</option>
                                        </select>
                                        <i class="arrow double"></i>
                                    </label>
                                </div>
                            </div>
                        </div>

                            <div class="section">
                                <label class="field-label">身份证号
                                </label>
                                <label class="field prepend-icon">
                                    <input type="text" class="gui-input" v-model="addInfo.cardId">
                                    <label class="field-icon">
                                        <i class="fa fa-edit"></i>
                                    </label>
                                </label>
                            </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">民族
                                    </label>
                                    <label class="field prepend-icon">
                                        <input type="text" class="gui-input" v-model="addInfo.nation">
                                        <label class="field-icon">
                                            <i class="fa fa-edit"></i>
                                        </label>
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">籍贯
                                    </label>
                                    <label class="field prepend-icon">
                                        <input type="text" class="gui-input" v-model="addInfo.nativePlace">
                                        <label class="field-icon">
                                            <i class="fa fa-edit"></i>
                                        </label>
                                    </label>
                                </div>
                            </div>
                        </div>


                        <div class="section">
                            <label class="field-label">出生地
                            </label>
                            <label class="field prepend-icon">
                                <input type="text" class="gui-input" v-model="addInfo.birthPlace">
                                <label class="field-icon">
                                    <i class="fa fa-edit"></i>
                                </label>
                            </label>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">政治面貌
                                    </label>
                                    <label class="field select">
                                        <select v-model="addInfo.politicsStatus">
                                            <option value="群众">群众</option>
                                            <option value="团员">团员</option>
                                            <option value="党员">党员</option>
                                        </select>
                                        <i class="arrow double"></i>
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">婚否
                                    </label>
                                    <label class="field select">
                                        <select v-model="addInfo.weddingStatus">
                                            <option value="未婚">未婚</option>
                                            <option value="已婚">已婚</option>
                                        </select>
                                        <i class="arrow double"></i>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                        <div class="section">
                            <label class="field-label">学籍状态
                            </label>
                            <label class="field select">
                                <select v-model="addInfo.schoolStatus">
                                    <option value="在读">在读</option>
                                    <option value="已毕业">已毕业</option>
                                </select>
                                <i class="arrow double"></i>
                            </label>
                        </div>
                            </div>
                            <div class="col-md-4">
                        <div class="section">
                            <label class="field-label">入学时间</label>
                            <label class="field prepend-icon">
                                <div class="form-group">
                                    <input type="text" class="gui-input" v-model="addInfo.schoolTime">
                                </div>
                            </label>
                        </div>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" @click="saveAddInfo()">确定添加</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal" >关闭</button>
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
                queryStuId:"",
                queryStuIdResult:"",
                updateInfo:{
                    stuName:"",
                    sex:"",
                    cardId:"",
                    nation:"",
                    nativePlace:"",
                    birthPlace:"",
                    politicsStatus:"",
                    weddingStatus:"",
                    schoolStatus:"",
                    schoolTime:""
                },
                addInfo:{
                    stuName:"",
                    sex:"",
                    cardId:"",
                    nation:"",
                    nativePlace:"",
                    birthPlace:"",
                    politicsStatus:"",
                    weddingStatus:"",
                    schoolStatus:"",
                    schoolTime:""
                },
                showInfo:{},
                infos:[],
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
                chuan:function (cardId) {
                            window.location.href="http://localhost:8080/stumanage/info/findByCardId/"+cardId;
                            },
                search: function () {
                    $("#callBackPager").page("destroy");
                    this.queryAll();
                },
                queryAll:function () {
                    this.$http.post(contentPath+"/api/info/findAll",this.record).then(
                    function (response) {
                        this.infos=response.data.data.list;
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
                showInfoo:function (item) {
                    this.showInfo=item;
                },
                editInfo:function (item) {
                    this.updateInfo=item;
                    
                },
                delInfo:function () {
                    this.$http.post(contentPath+"/api/info/del",this.updateInfo).then(
                        function (response) {
                            sweetAlert("删除成功，该学生机构和课程都已清楚", "该学生机构和课程都已清楚" , "info");
                            location.reload();
                        },function (response) {
                                sweetAlert(response.data.message,"错误码"+response.data.code , "error");
                            })
                        },
                saveAddInfo:function () {
                    this.$http.post(contentPath+"/api/info/save",this.addInfo).then(
                            function (response) {
                                sweetAlert("保存成功", "保存成功,请给该生指派学院等学校信息" , "info");
                                this.chuan(this.addInfo.cardId);
                            },function (response) {
                                sweetAlert(response.data.message,"错误码"+response.data.code , "error");
                            })
                },
                findByStuId :function () {
                    if(this.queryStuId===""){
                        sweetAlert("请输入学号", "请输入学号" , "info");
                    }
                    else{
                        this.$http.get(contentPath+"/api/info/findByStuId", {
                            params: {
                                stuId:this.queryStuId
                                 }
                        })
                            .then(
                                function (response) {
                                    $("#callBackPager").page("destroy");
                                    this.infos=[];
                                    this.queryStuIdResult=response.data.data;
                                },function (response) {
                                    sweetAlert("没有查该学生的学籍信息,请重新输入","错误码"+response.data.code , "error");
                                })
                    }
                },
                updateInfoSave: function () {
                    this.$http.post(contentPath+"/api/info/update",this.updateInfo).then(
                            function (response) {
                                sweetAlert("修改成功", "修改成功" , "info");
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
