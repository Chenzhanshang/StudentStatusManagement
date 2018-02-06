function imageExt() {
    var appTemp = this;
    var id = "";
    var times = 0;
    if (appTemp.id != undefined) {
        id = appTemp.id;
    }
    $(id + ' .fileupload-btn').each(function () {
        var key = $(this).data('key');
        var type = $(this).data('type');
        var groupName = $(this).data('group');
        var orderNo = appTemp.orderNo;
        if (orderNo == null || orderNo == '') {
            orderNo = $(this).attr('order');
        }

        var myDropzone = new Dropzone(this, {
            url: contentPath + "/images/fileUpload?loanOrderNo=" + orderNo + "&category="
            + type,
            previewsContainer: $(this).attr('_target'),
            previewTemplate: '<div class="custom-dz-preview-box"><img data-dz-thumbnail /><a class="custom-dz-preview-box-delete" href="javascript:;">删除</a></div>'
        });
        myDropzone.on("success", function (file, resp) {
            var data = {
                orderNo: orderNo,
                videoKey: key,
                imageType: type,
                groupName: groupName,
                videoValue: resp.data.key
            };
            appTemp.$http.post(contentPath + "/api/v1/order/proof", data).then(function (response) {
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
                cancelButtonText: "取消",
                closeOnConfirm: false
            },
            function () {
                appTemp.$http.post(contentPath + "/api/v1/order/del?imageId=" + imageId)
                    .then(function (response) {
                        thisTemp.parent('.custom-dz-preview-box').remove();
                        swal({
                            title: "已删除",
                            text: "该图片已经删除",
                            timer: 1000,
                            showConfirmButton: false
                        });
                        var list = this.uploadedFiles;
                        Object.keys(list).forEach(function (item) {
                            if (list[item].id === imageId){
                                delete list[item];
                            }
                        });
                    }, function (response) {
                        swal("删除失败!", response.data.message, "error");
                    });
            });
    });


    $(id + ' .dropzone-previews').off('click').delegate("img", 'click', function () {
        var tdContainer = $(this).parent().parent();
        var obj = selectedImg(tdContainer, appTemp, $(this)[0]);
        var viewer;
        var flag = false;
        layer.open({
            type: 1,
            title: '图片信息',
            area: ['700px', '600px'],
            anim: 3,
            shade: 0,
            offset: [Math.random() * ($(window).height() - 480),
                Math.random() * ($(window).width() - 300)
            ],
            maxmin: true,
            content: '<div id="viewImg' + times + '" class="viewer iviewer_cursor" style="width: 100%">' + obj.imgs + '</div>',
            zIndex: layer.zIndex,
            success: function (layero) {
                layer.setTop(layero);
                var imgWrapper = document.getElementById('viewImg' + times);
                viewer = new Viewer(imgWrapper, {
                    url: 'data-original',
                    inline: true,
                    fullscreen: false,
                    keyboard: false,
                    loop: false,
                    button: false,
                    ready: function () {
                        flag = true
                    }
                });
                // when viewer first viewed the img ,chang the index
                imgWrapper.addEventListener('viewed', function () {
                    var that = this;
                    if (flag) {
                        setTimeout(function () {
                            that.viewer.view(obj.seleceted);
                            flag = false
                        }, 1)
                    } else {
                    }
                }, false);

                var callback = function (records) {
                    records.map(function (record) {
                        var width = record.target.style.width.toString();
                        var ele = $(record.target).children('.layui-layer-content').children('.viewer-container');
                        ele.css({
                            width: 'auto',
                            height: 'auto'
                        });
                        // var fa = ele.children('.viewer-canvas').css({
                        //     width: '100%',
                        //     height: '80%',
                        //     display: 'flex',
                        //     alignItems: 'center',
                        //     justifyContent: 'center'
                        // });
                        ele.children('viewer-footer').css({
                            bottom: '50px'
                        });
                        // var son = fa.children('img');
                        // son.css({
                        //     marginLeft: '',
                        //     marginTop: ''
                        // })
                    });
                };

                var mo = new MutationObserver(callback);
                var option = {
                    'attribute': true,
                    'attributeOldValue': true,
                    'attributeFilter': [
                        'style'
                    ]
                };
                var ele = $('#viewImg' + times).parent().parent();

                mo.observe(ele[0], option);
                times++
            }
        });
    });
}

function selectedImg(node, appTemp, clickImg) {
    var arr = node.children();
    var imgs = [];
    var paths = [];
    for (var i = 0; i < arr.length; i++) {
        var img = $(arr[i]).children('img')[0];
        if (img) {
            var path = getUrl(img, appTemp);
            paths.push(path);
            var ele = '<img src=' + path + ' style="display:none"  width="100%" height="100%"/>';
            imgs.push(ele)
        }
    }
    var index = paths.indexOf(getUrl(clickImg, appTemp));
    return {
        imgs: imgs,
        seleceted: index
    }
}

function getUrl(ele, appTemp) {
    var localPath = $(ele).attr('alt');
    var remotePath = '';
    if (localPath && appTemp.uploadedFiles[localPath]  && appTemp.uploadedFiles[localPath].videoValue) {
        remotePath = appTemp.uploadedFiles[localPath].videoValue;
    } else {
        remotePath = $(ele).attr('real');
    }
    $.ajax({
        type: "get",
        url: contentPath + "/images/views?path=" + remotePath,
        cache: true,
        async: false,
        dataType: "json",
        success: function (data) {
            remotePath = data;
        }
    });
    return remotePath
}
