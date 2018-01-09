<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加学生</title>
</head>
<body>
<form id="form1">
    <p>学生编号：<input v-model="items.id"></p>
    <p>学生姓名：<input type="text" v-model="items.name"></p>
    <p>学生学号：<input type="text" v-model="items.stuId"></p>
    <p>性别:<input type="text" v-model="items.sex"></p>
    <p>年龄:<input type="text" v-model="items.age"></p>
    <p>地址:<input type="text" v-model="items.address"></p>
    <p>身份证号：<input type="text" v-model="items.idCard"></p>
    <input type="button" id="ajaxBtn" value="提交" v-on:click="submit"/>
</form>
</body>

<script src="../js/vue.min.js"></script>
<script src="../js/vue-resource.min.js"></script>

<script>
    var form1 = new Vue({
        el: '#form1',
        data: {
            items: {
                id: "",
                name: "",
                stuId: "",
                sex: "",
                age: "",
                address: "",
                idCard: ""
            }
        },
        methods: {
            submit: function () {
                console.log(this.items);
                this.$http.post("/stumanage/student/save", this.items).then(
                        function () {
                            window.open('student.ftl', name, 'height=400, width=400, top=0, left=0, toolbar=yes, menubar=yes, scrollbars=yes, resizable=yes,location=yes, status=yes');
                        });
            }
        }
    });

</script>
</html>