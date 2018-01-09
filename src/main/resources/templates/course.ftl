<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>更新学生</title>
</head>
<body>
<form id="form1">
    <p>学生编号：{{item.id}}</p>
    <p>学生姓名：{{item.name}}</p>
    <p>学生学号：<input type="text" v-model="items[2]"></p>
    <p>性别:<input type="text" v-model="items[3]"></p>
    <p>年龄:<input type="text" v-model="items[4]"></p>
    <p>地址:<input type="text" v-model="items[5]"></p>
    <p>身份证号：<input type="text" v-model="items[6]"></p>
    <input type="button" id="ajaxBtn" value="提交" v-on:click="submit"/>
</form>
</body>

<script src="../js/vue.min.js"></script>
<script src="../js/vue-resource.min.js"></script>

<script>
    var form1 = new Vue({
        el: '#form1',
        data: {
            items: [],
        },
        create: function () {
            this.
        }
        methods: {
            submit: function () {
                this.$http.get("/stumanage/student/save", {
                    params: {
                        id: this.items[0],
                        name: this.items[1],
                        stuId: this.items[2],
                        sex: this.items[3],
                        age: this.items[4],
                        address: this.items[5],
                        idCard: this.items[6]
                    }
                }).then(function () {

                    window.open('student.ftl', name, 'height=400, width=400, top=0, left=0, toolbar=yes, menubar=yes, scrollbars=yes, resizable=yes,location=yes, status=yes');
                    window.close();
                });
            },
        }
    });

</script>
</html>