<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">更新学生信息</h4>
            </div>
            <div class="modal-body" v-for="item in itemm">
                <h3>编号: {{item.id}}</h3>
                <h4>学生姓名:<input type="text" v-model="item.name"></h4>
                <h4>学号:<input type="text" v-model="item.stuId"></h4>
                <h4>性别:<input type="text" v-model="item.sex"></h4>
                <h4>年龄:<input type="text" v-model="item.age"></h4>
                <h4>地址:<input type="text" v-model="item.address"></h4>
                <h4>身份证号:<input type="text" v-model="item.idCard"></h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" @click="submit()">提交更改</button>
            </div>
        </div>
    </div>
</div>

<div id="oo">

    <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center"
           style="margin-top:18px">
        <tr align="center" bgcolor="#FAFAF1" height="25" v-if="seen">
            <td>编号</td>
            <td>学生姓名</td>
            <td>学号</td>
            <td>性别</td>
            <td>年龄</td>
            <td>地址</td>
            <td>身份证号</td>
        </tr>

        <tr>
            <td align="center">{{result.id}}</td>
            <td align="center">{{result.name}}</td>
            <td align="center">{{result.stuId}}</td>
            <td align="center">{{result.sex}}</td>
            <td align="center">{{result.age}}</td>
            <td align="center">{{result.address}}</td>
            <td align="center">{{result.idCard}}</td>
        </tr>
    </table>

    <table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center"
           style="margin-top:18px">
        <tr bgcolor="#E7E7E7">
            <td height="24" colspan="10" align="center">
            </td>
        </tr>

        <tr bgcolor="#E7E7E7">
            <td height="24" colspan="10" align="center">
                全部学生
            </td>
        </tr>
        <tr align="center" bgcolor="#FAFAF1" height="25">
            <td>编号</td>
            <td>学生姓名</td>
            <td>学号</td>
            <td>性别</td>
            <td>年龄</td>
            <td>地址</td>
            <td>身份证号</td>
            <td>操作</td>
        </tr>

        <tr v-for="item in items">
            <td align="center">{{item.id}}</td>
            <td align="center">{{item.name}}</td>
            <td align="center">{{item.stuId}}</td>
            <td align="center">{{item.sex}}</td>
            <td align="center">{{item.age}}</td>
            <td align="center">{{item.address}}</td>
            <td align="center">{{item.idCard}}</td>
            <td align="center">
                <button v-on:click="del(item.id)">删除</button>
                <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"
                        @click="chuan(item.id)">修改
                </button>
            </td>
        </tr>
        <tr align="right" bgcolor="#EEF4EA">
        </tr>
        <h3 align="center">
            <button onclick="addPage()">新添加学生</button>&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input v-model="search">
            <button @click="searcha()">搜索</button>
        </h3>


    </table>
</div>

<script src="../js/vue.min.js"></script>
<script src="../js/vue-resource.min.js"></script>

<script>
    var myModal = new Vue({
        el: '#myModal',
        data: {
            itemm: [],
        },
        methods: {
            shou: function (ida) {
                this.$http.get("/stumanage/student/findByID", {
                    params: {
                        idv: ida
                    }
                }).then(function (response) {
                    this.itemm = response.body;
                    console.log(this.itemm)
                });
            },
            submit: function () {
                this.$http.get("/stumanage/student/update", {
                    params: {
                        id: this.itemm[0].id,
                        name: this.itemm[0].name,
                        stuId: this.itemm[0].stuId,
                        sex: this.itemm[0].sex,
                        age: this.itemm[0].age,
                        address: this.itemm[0].address,
                        idCard: this.itemm[0].idCard
                    }
                }).then(function () {
                    window.alert("修改成功！！请返回刷新页面！！");
                });
            }
        }
    });

    var oo = new Vue({
        el: '#oo',
        data: {
            items: [
                /* {id : , name: ,stuId: ,sex: ,age: ,address : ,idCard : }*/
                /* {id : , name: ,stuId: ,sex: ,age: ,address : ,idCard : }*/
            ],
            search: "输入学号",
            result: "",
            seen: false
        },
        created: function () {
            this.find();
        },
        methods: {
            searcha: function () {
                this.$http.get("/stumanage/student/find/" + this.search).then(function (response) {
                    this.result = response.body;
                    this.seen = true;
                });
            },
            find: function () {
                this.$http.get("/stumanage/student/findall").then(function (response) {
                    this.items = response.body;
                });
            },
            chuan: function (id) {
                myModal.shou(id);
            },

            del: function (ids) {
                this.$http.get("/stumanage/student/delete", {
                            params: {
                                id: ids
                            }
                        }
                ).then(
                        function () {
                            this.find();
                        }
                )
            }
        }
    });

    function addPage() {
        window.open("sys.ftl", "_blank", "toolbar=yes,width=500, height=500");
    }

</script>
</body>
</html>