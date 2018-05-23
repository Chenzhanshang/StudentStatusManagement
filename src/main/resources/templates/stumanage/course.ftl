<#import "/spring.ftl" as s>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <title>学生课程设置</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<#include '../include/baselink.ftl'>
    <link rel="stylesheet" type="text/css" href="<@s.url '/assets/css/jquery.pagination.css'/>">
</head>

<body class="dashboard-page">
<#include '../include/skin-toolbox.ftl'>
<!-- Start: Main -->
<div id="main">
<#include '../include/header.ftl'>
<#include '../include/sidebar.ftl'>
    <section id="content_wrapper">
        <header id="topbar" class="alt">

        </header>
        <section id="content" class="table-layout animated fadeIn">
            <div class="tray tray-center">
                <div class="panel" id="spy7">
                    <div class="panel-heading">
                          <span class="panel-title">
                            <span class="fa fa-table"></span>学生课程设置
                          </span>
                        <section id="content" class="table-layout animated fadeIn">
                                <div class="mw800 center-block">
                                    <div class="admin-form">
                                        <div class="panel heading-border">
                                            <div class="panel-body bg-light">
                                                <div class="section-divider mb40">
                                                    <span>查找学生</span>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="section">
                                                            <div class="smart-widget sm-left sml-120">
                                                                <label class="button">学号</label>
                                                                <input type="text" class="gui-input" v-model="searchStuId"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                <div class="panel-footer">
                                                    <button class="button btn-primary" @click="queryAll()">查找该生所有课程</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </section>
                    <div class="panel-body pn">
                        <div class="bs-component">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <td align="center">编号</td>
                                        <td align="center">课程名称</td>
                                        <td align="center">任课老师</td>
                                        <td align="center">成绩</td>
                                        <td align="center">成绩分析</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr v-for="course in courses">
                                        <td align="center">{{course.id}}</td>
                                        <td align="center">{{course.courseName}}</td>
                                        <td align="center">{{course.teacher}}</td>
                                        <td align="center">{{course.grade}}</td>
                                        <td align="center">{{course.analyze}}</td>
                                        <td align="center">
                                            <button data-toggle="modal" data-target="#myModalEdit" @click="trans(course)">修改课程信息</button>
                                            <button data-toggle="modal" data-target="#myModalEdit" @click="delCourse(course)">删除该课程</button>
                                        </td>
                                    </tr>
                                    <tr>

                                        <button data-toggle="modal" data-target="#myModalAdd">为该学生添加课程</button>
                                    </tr>
                                    <tr v-show="courses.length==0">
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


    <div class="modal fade" id="myModalEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h3 class="modal-title" id="myModalLabel">修改课程信息</h3>
                </div>
                <div class="modal-body">
                <div class="admin-form">
                    <div class="section">
                        <label class="field-label">课程名称</label>
                        <label class="field prepend-icon">
                            <div class="form-group">
                                <input type="text" class="gui-input"
                                       v-model="editCourse.courseName">
                            </div>
                        </label>
                    </div>
                    <div class="section-divider mv40">
                        <span class=".fa .fa-pencil"></span>
                    </div>
                    <div class="section">
                        <label class="field-label">任课老师</label>
                        <label class="field prepend-icon">
                            <div class="form-group">
                                <input type="text" class="gui-input" v-model="editCourse.teacher">
                            </div>
                        </label>
                    </div>
                    <div class="section">
                        <label class="field-label">成绩</label>
                        <label class="field prepend-icon">
                            <div class="form-group">
                                <input type="text" class="gui-input" v-model="editCourse.grade">
                            </div>
                        </label>
                    </div>
                    <div class="section">
                        <label class="field-label">成绩分析</label>
                        <label class="field prepend-icon">
                            <div class="form-group">
                                <input type="text" class="gui-input" v-model="editCourse.analyze">
                            </div>
                        </label>
                    </div>
                </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" @click="editCoursem()"  data-dismiss="modal">确定</button>
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
                    <h3 class="modal-title" id="myModalLabel">添加课程</h3>
                </div>
                <div class="modal-body">
                    <div class="admin-form">
                        <div class="section">
                            <label class="field-label">课程名称</label>
                            <label class="field prepend-icon">
                                <div class="form-group">
                                    <input type="text" class="gui-input" v-model="addCourse.courseName">
                                </div>
                            </label>
                        </div>
                            <div class="section-divider mv40">
                                <span class=".fa .fa-pencil"></span>
                            </div>
                            <div class="section">
                                <label class="field-label">任课老师</label>
                                <label class="field prepend-icon">
                                    <div class="form-group">
                                        <input type="text" class="gui-input" v-model="addCourse.teacher">
                                    </div>
                                </label>
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" @click="addCoursem()">确定</button>
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
                    el: "#main",
                    data: {
                        addCourse:{
                            courseName:"",
                            teacher:""
                        },
                        searchStuId:"",
                        courses:{},
                        showCourse:{},
                        pageInfo:{
                            page:1,
                            pageSize:10
                        },
                        editCourse:{}
                    },
                    methods: {
                        trans:function (item) {
                            this.editCourse=item;
                        },
                        queryAll:function () {
                            this.$http.get(contentPath+"/api/course/findAll",
                             {
                                   params: {
                                        stuId:this.searchStuId,
                                        page:this.pageInfo.page,
                                        pageSize:this.pageInfo.pageSize
                            }
                            }).then(function (response) {
                                this.courses=response.data.data.list;
                                sweetAlert("下拉查看所有课程", "下拉查看所有课程" , "info");
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
                                            temp.pageInfo.page = pageIndex + 1;
                                        }).on('jumpClicked', function (event, pageIndex) {
                                    temp.pageInfo.page = pageIndex + 1;
                                });
                            },function (response) {
                                sweetAlert(response.data.message, "错误码" + response.data.code, "error");
                            })
                        },
                        addCoursem:function () {
                            this.$http.get(contentPath+"/api/course/save",{
                                params:{
                                    courseName:this.addCourse.courseName,
                                    teacher:this.addCourse.teacher,
                                    stuId:this.searchStuId
                                }
                            }).then(function (response) {
                                sweetAlert("添加成功", "添加课程成功" , "info");
                                window.location.reload();
                            },function (response) {
                                sweetAlert(response.data.message, "错误码" + response.data.code, "error");
                            }
                            )},
                        editCoursem:function () {
                            this.$http.post(contentPath+"/api/course/edit", this.editCourse)
                                    .then(function (response) {
                                sweetAlert("修改成功", "修改课程信息成功" , "info");
                                window.location.reload();
                            },function (response) {
                                sweetAlert(response.data.message, "错误码" + response.data.code, "error");
                            }
                            
                            )},
                        delCourse:function (course) {
                            if(confirm("确定要删除此课程吗？")){
                            this.$http.get(contentPath + "/api/course/del/" + course.id)
                                    .then(function (response) {
                                                sweetAlert("删除成功", "删除课程信息成功", "info");
                                                window.location.reload();
                                            }, function (response) {
                                                sweetAlert(response.data.message, "错误码" + response.data.code, "error");
                                            }
                                    )
                        }
                        }
                            
                        



                    }

                })
    </script>
</body>

</html>
