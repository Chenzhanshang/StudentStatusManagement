<#import "/spring.ftl" as s>
<!DOCTYPE html>
<html lang="zh_CN">
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
                            <span class="fa fa-table"></span>学生机构信息
                          </span>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;输入学号：
                        <input type="text" class=" btn-default btn-sm w85 fw600 ml10" v-model="queryStuId">

                        <button class="btn btn-default btn-sm w75 fw600 ml10" @click="findByStuId()">
                            学号查找
                        </button>
                    </div>
                    <div class="panel-body pn">
                        <div class="bs-component">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <td align="center">姓名</td>
                                        <td align="center">学号</td>
                                        <td align="center">学院</td>
                                        <td align="center">系</td>
                                        <td align="center">班</td>
                                        <td align="center">操作</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="school in schools">
                                        <td align="center">{{school.stuName}}</td>
                                        <td align="center">{{school.stuId}}</td>
                                        <td align="center">{{school.academy}}</td>
                                        <td align="center">{{school.department}}</td>
                                        <td align="center">{{school.clazz}}</td>
                                        <td align="center">
                                            <button data-toggle="modal" data-target="#myModalEdit" @click="chuan(school.stuId)">编辑</button>
                                        </td>
                                    </tr>
                                    <tr v-bind="searchSchoolResult" v-if="searchSchoolResult!==''">
                                        <td align="center">{{searchSchoolResult.id}}</td>
                                        <td align="center">{{searchSchoolResult.stuName}}</td>
                                        <td align="center">{{searchSchoolResult.cardId}}</td>
                                        <td align="center">{{searchSchoolResult.schoolTime}}</td>
                                        <td align="center">{{searchSchoolResult.createdBy}}</td>
                                        <td align="center">
                                            <button data-toggle="modal" data-target="#myModalEdit" @click="chuan(searchSchoolResult)">编辑</button>
                                        </td>
                                    </tr>
                                    <tr v-show="schools.length==0&&searchSchoolResult.length==0">
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
    <#include '../include/footer.ftl' />
    </section>
    <div class="modal fade" id="myModalEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title" id="myModalLabel">编辑学院信息</h3>
                </div>
                <div class="modal-body">
                    <div class="admin-form">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">姓名
                                    </label>
                                    <label class="field prepend-icon">
                                        <div>ddd</div>
                                    </label>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="section">
                                <label class="field-label">学号
                                </label>
                                <label class="field prepend-icon">
                                    <div>dasd   </div>
                                </label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">学院
                                    </label>
                                    <label class="field select">
                                        <select v-model="updateSchool.academy">
                                            <option :value="updateSchool.academy">{{updateSchool.academy}}</option>
                                            <option v-for="academy in academys" v-bind:value="academy" v-if="academy !== updateSchool.academy">{{academy}}</option>
                                        </select>
                                        <i class="arrow double"></i>
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">系
                                    </label>
                                    <label class="field select">
                                        <select v-model="updateSchool.department">
                                            <option :value="updateSchool.department">{{updateSchool.department}}</option>
                                            <option v-for="department in departments" v-bind:value="department" v-if="department !== updateSchool.department">{{department}}</option>
                                        </select>
                                        <i class="arrow double"></i>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="section">
                                    <label class="field-label">班
                                    </label>
                                    <label class="field select">
                                        <select v-model="updateSchool.clazz">
                                            <option value="一班">一班</option>
                                            <option value="二班">二班</option>
                                            <option value="三班">三班</option>
                                        </select>
                                        <i class="arrow double"></i>
                                    </label>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" @click="updateInfoSave()">保存修改</button>
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
            schools:[],
            updateSchool:{
                stuId:"",
                stuName:"",
                academy:"",
                department:"",
                clazz:""
            },
            academys:[],
            departments:[],
            queryStuId:"",
            searchSchoolResult:"",
            record:{
                page:1,
                pageSize:10
            }
        },
        created:function () {
            this.queryAll();
        },
        watch: {
            'updateSchool.academy':function (newVal) {
                console.log(newVal);
                if(newVal){
                    this.queryDepartment();
                }
            },
            'record.page': function () {
                this.queryAll();
            }
        },
        methods:{
            chuan:function (item) {
                this.$http.get(contentPath+"/api/school/findByStuId",{
                    params:{
                        stuId:item
                    }
                }).then(
                        function (response) {
                            this.updateSchool=response.data.data;
                        },function (response) {
                            sweetAlert(response.data.message,"错误码"+response.data.code , "error");
                        }
                );
                this.queryAcademy();
            },
            updateSchoolSave: function () {
                this.$http.post(contentPath+"/api/school/update",this.updateSchool).then(
                        function (response) {
                            sweetAlert("修改成功", "修改成功" , "info");
                        },function (response) {
                            sweetAlert(response.data.message,"错误码"+response.data.code , "error");
                        })
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
            findByStuId :function () {
                if(this.queryStuId===""){
                    sweetAlert("请输入学号", "请输入学号" , "info");
                }
                else{
                    this.$http.get(contentPath+"/api/school/findByStuId", {
                        params: {
                            stuId:this.queryStuId
                        }
                    })
                            .then(
                                    function (response) {
                                        $("#callBackPager").page("destroy");
                                        this.schools=[];
                                        this.searchSchoolResult=response.data.data;
                                    },function (response) {
                                        sweetAlert("出错了！","没有查该学生的学院信息,请重新输入 ", "error");
                                    })
                }
            },
            queryAll:function () {
                this.$http.post(contentPath+"/api/school/findAll",this.record).then(
                        function (response) {
                            this.schools=response.data.data.list;
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
            queryDepartment:function () {
                this.$http.get(contentPath+"/api/school/queryDepartment",{
                    params:{
                        academyName:this.updateSchool.academy
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
