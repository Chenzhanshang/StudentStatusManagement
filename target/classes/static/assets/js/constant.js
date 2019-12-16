var contentPath = "/stumanage";


jQuery(document).ready(function() {
    "use strict";

    /*$.ajax({
        type: "POST",
        url: contentPath+"/api/system/menu/menuTree",
        async: false,
        beforeSend: function (xhr) {
            xhr.setRequestHeader("Content-type", "application/json;charset=UTF-8");
        },
        dataType: "json",
        data: '',
        success: function (data) {
            var str = '<li class="sidebar-label pt20">首页</li><li class="active"><a href="'+contentPath+'/"><span class="glyphicon glyphicon-home"></span> <span class="sidebar-title">控制台</span></a></li>'
            // console.log(data);

            if(data.data!=null){
                $.each(data.data.children,function (i, e) {
                    //拼装0层菜单，0层菜单全部是标签
                    str = str+ '<li class="sidebar-label pt15">'+e.text+'</li>';
                    str = makeMenu(e.children,str,1);
                });
            }*/
/*
            $('#menuBar').html(str);

            function makeMenu(data,str1,level) {
                //0 标签  1 菜单  2分组  3 普通页面
                // console.log(data);
                $.each(data,function (i, e) {
                    var child =  e.children;

                    if(e.type ===0){
                        str1 = str1+ '<li class="sidebar-label pt15">'+e.text+'</li>';
                    }
                    // 拼装第一层组
                    if(e.type ===2 && level === 1){
                        str1 = str1 + '<li><a class="accordion-toggle" href="#"><span class="glyphicon glyphicon-tower"></span><span class="sidebar-title">'+e.text+'</span><span class="caret"></span></a>';
                        str1 = str1 + '<ul class="nav sub-nav">';

                        str1 =  makeMenu(child,str1,level + 1);
                        // thisLevel = thisLevel -1;
                        str1 = str1 + '</ul></li>';
                    }
                    // 拼装第一层菜单
                    if(e.type ===1 && level===1){
                        str1 += '<li><a href="'+ contentPath + e.path +'"><span class="glyphicon glyphicon-calendar"></span> <span class="sidebar-title">'+ e.text +'</span> </a></li>'
                    }
                    if(e.type ===3){
                        //什么都不操作
                    }
                    // 拼装非第一层组
                    if(e.type ===2 && level !== 1){
                        str1 = str1 + '<li><a class="accordion-toggle" href="#"><span class="glyphicon glyphicon-tower"></span>'+e.text+'<span class="caret"></span></a>';
                        str1 = str1 + '<ul class="nav sub-nav">';

                        str1 =  makeMenu(child,str1,level + 1);
                        str1 = str1 + '</ul></li>';
                    }
                    // 拼装非第一层菜单
                    if(e.type ===1 && level !== 1){
                        str1 += '<li><a href="'+ contentPath + e.path +'">'+ e.text +'</a></li>'
                    }

                });
                return str1;
            }
        },
        error:function (data) {
        }
    });*/

    Core.init();

    $('.admin-panels').adminpanel({
        grid: '.admin-grid',
        draggable: true,
        preserveGrid: true,
        mobile: true,
        onStart: function() {
            // Do something before AdminPanels runs
        },
        onFinish: function() {
            $('.admin-panels').addClass('animated fadeIn').removeClass('fade-onload');
        },
        onSave: function() {
            $(window).trigger('resize');
        }
    });
    setActiveClassForMenu();

   /* $.post(contentPath+"/login/getCurrentPrincipal", null, function(data){
        $('#vueheader').find('> ul.nav.navbar-nav.navbar-right > li > a > b').text(data.data.name);
    },"json");*/

});
function setActiveClassForMenu() {
    var pathname = location.pathname;
    if(pathname.length>0){
        var lastChar = pathname.charAt(pathname.length-1);
        if(lastChar === '/'){
            pathname = pathname.substring(0, pathname.length-1);
        }
    }

    var result = setActive(pathname);
    if(result==false){
        var referrer = document.referrer.replace(location.protocol+'//'+location.host,'');
        setActive(referrer);
    }
    function setActive(pathname){
        var $menu = $("[href='"+pathname+"'");
        if($menu.length>=1){
            $menu.parent('li').addClass('active')
                .parent('ul').prev('.accordion-toggle').addClass('menu-open');
            return true;
        }
        return false;
    }
}

function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    var context = "";
    if (r != null) {
        context = r[2];
    }
    reg = null;
    r = null;
    return context == null || context == "" || context == "undefined" ? "" : context;
}

function imageInit() {
    var appTemp = this;
    var id ="";
    if (appTemp.id != undefined){
        id = appTemp.id;
    }
    $( id + ' .fileupload-btn').each(function () {
        var key = $(this).data('key');
        var type = $(this).data('type');
        var groupName = $(this).data('group');
        var myDropzone = new Dropzone(this, {
            url: contentPath+"/images/fileUpload?loanOrderNo=" + appTemp.orderNo + "&category="
                 + type,
            previewsContainer: $(this).attr('_target'),
            previewTemplate: '<div class="custom-dz-preview-box"><img data-dz-thumbnail /><a class="custom-dz-preview-box-delete" href="javascript:;">删除</a></div>'
        });
        myDropzone.on("success", function (file, resp) {
            var data = {
                orderNo: appTemp.orderNo,
                videoKey: key,
                imageType: type,
                groupName: groupName,
                videoValue: resp.data.key
            };
            appTemp.$http.post(contentPath+"/api/v1/order/proof", data).then(function (response) {
                appTemp.uploadedFiles[file.name] = response.data.data;
            }, function (response) {
                sweetAlert(response.data.message, "错误码" + response.data.code, "error");
            });
        });
    });

    $('body').on('click', id + ' .custom-dz-preview-box-delete', function () {
        var name = $(this).prev().attr('alt');
        var imageId = $(this).data('id') || appTemp.uploadedFiles[name].id;
        var thisTemp = $(this);
        swal({
                title: "你确定删除该照片",
                text: "删除后，将无法找回该文件",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "是",
                cancelButtonText:"取消",
                closeOnConfirm: false
            },
            function(){
                appTemp.$http.post(contentPath+"/api/v1/order/del?imageId=" + imageId)
                    .then(function (response) {
                        thisTemp.parent('.custom-dz-preview-box').remove();
                        swal({
                            title: "已删除",
                            text: "该图片已经删除",
                            timer: 1000,
                            showConfirmButton: false
                        });
                    }, function (response) {
                        swal("删除失败!", response.data.message, "success");
                    });
            });
    });

    $('body').on('click', id +  ' .custom-dz-preview-box img', function () {
        var localPath = $(this).attr('alt');
        var remotePath = '';
        if (localPath && appTemp.uploadedFiles[localPath].videoValue) {
            remotePath = appTemp.uploadedFiles[localPath].videoValue;
        } else {
            remotePath = $(this).attr('real');
        }
        appTemp.$http.get(contentPath+"/images/views?path=" + remotePath)
            .then(function (response) {
                layer.open({
                    type: 1,
                    title: '图片信息',
                    area: ['700px', '600px'],
                    shade: 0,
                    offset: [Math.random() * ($(window).height() - 480),
                        Math.random() * ($(window).width() - 300)
                    ],
                    maxmin: true,
                    content: '<div id="viewImg' + appTemp.imgBox
                    + '" class="viewer iviewer_cursor"></div>',
                    zIndex: layer.zIndex,
                    success: function (layero) {
                        layer.setTop(layero);
                        $("#viewImg" + appTemp.imgBox).iviewer({src: response.data,zoom_base: 100,zoom: 100,zoom_min: 25});
                    }
                });
            }, function (response) {
                sweetAlert(response.data.message, "错误码" + response.data.code, "error");
            });
        appTemp.imgBox = appTemp.imgBox + 1;
    });
};

var digitUppercase = function(n) {
    var fraction = ['角', '分'];
    var digit = [
        '零', '壹', '贰', '叁', '肆',
        '伍', '陆', '柒', '捌', '玖'
    ];
    var unit = [
        ['元', '万', '亿'],
        ['', '拾', '佰', '仟']
    ];
    var head = n < 0 ? '欠' : '';
    n = Math.abs(n);
    var s = '';
    for (var i = 0; i < fraction.length; i++) {
        s += (digit[Math.floor(n * 10 * Math.pow(10, i)) % 10] + fraction[i]).replace(/零./, '');
    }
    s = s || '整';
    n = Math.floor(n);
    for (var i = 0; i < unit[0].length && n > 0; i++) {
        var p = '';
        for (var j = 0; j < unit[1].length && n > 0; j++) {
            p = digit[n % 10] + unit[1][j] + p;
            n = Math.floor(n / 10);
        }
        s = p.replace(/(零.)*零$/, '').replace(/^$/, '零') + unit[0][i] + s;
    }
    return head + s.replace(/(零.)*零元/, '元')
            .replace(/(零.)+/g, '零')
            .replace(/^整$/, '零元整');
};

Array.prototype.contain = function (item) {
    for (var i = 0; i < this.length; i++) {
        // 严格比较，即类型与数值必须同时相等。
        if (this[i] === item) {
            return true;
        }
    }
    return false;
};
Array.prototype.delete = function (varElement) {
    for (var i = 0; i < this.length; i++) {
        // 严格比较，即类型与数值必须同时相等。
        if (this[i] === varElement) {
            this.splice(i, 1);
            break;
        }
    }
    return this;
};
String.prototype.format = function () {

    if (arguments.length <= 0) return this;

    var ref = this;

    for (var i = 0; i < arguments.length; i++) {
        ref = ref.replace(new RegExp("\\{" + i + "\\}", "gm"), arguments[i]);
    }

    return ref;
};

function splitMoney(val) {
    if(val == undefined || val == ''){
        return '';
    }
    //根据`.`作为分隔，将val值转换成一个数组
    var aIntNum = val.toString().split('.');
    // 整数部分
    var iIntPart = aIntNum[0];
    // 小数部分（传的值有小数情况之下）
    var iFlootPart = aIntNum.length > 1 ? '.' + aIntNum[1] : '';
    var rgx = /(\d+)(\d{3})/;
    // 如果整数部分位数大于或等于5
    if (iIntPart.length >= 5) {
        // 根据正则要求，将整数部分用逗号每三位分隔
        while (rgx.test(iIntPart)) {
            iIntPart = iIntPart.replace(rgx, '$1' + ',' + '$2');
        }
    }
    // 如果小数部分位数大于或等于5
    if (iFlootPart && iFlootPart.length >= 5) {
        // 根据正则要求，将小数部分用每三位分隔按空格号分开
        while (rgx.test(iFlootPart)) {
            iFlootPart = iFlootPart.replace(/(\d{3})/g, '$1 ');
        }
    }
    // 将整数部分和小数组部分合并在一起，并返回
    return iIntPart + iFlootPart;
}