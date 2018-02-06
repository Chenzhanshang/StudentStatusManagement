<#import "spring.ftl" as s>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<#include 'include/baselink.ftl'>
</head>
<body class="external-page external-alt sb-l-c sb-r-c">
<!-- Start: Main -->
<div id="main" class="animated fadeIn">

    <!-- Start: Content-Wrapper -->
    <section id="content_wrapper">
        <!-- Begin: Content -->
        <section id="content">
            <div class="admin-form theme-info mw500">
                <!-- Login Panel/Form -->
                <div class="panel mt30 mb25">

                    <form method="post" action="<@s.url '/login'/>">
                        <div class="panel-body bg-light p25 pb15">
                            <!-- Divider -->
                            <div class="section-divider mv30">
                            <#if errorMessage??>
                                <span>
                                        <b style="color: #FF0000">
                                        ${errorMessage}
                                        </b>
                                    </span>

                            <#else>
                                <span>欢迎使用学生档案管理系统</span>
                            </#if>
                            </div>
                            <!-- Username Input -->
                            <div class="section">
                                <label for="username" class="field-label text-muted fs18 mb10">账户</label>
                                <label for="username" class="field prepend-icon">
                                    <input type="text" name="username" id="username" class="gui-input">
                                    <label for="username" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>

                            <!-- Password Input -->
                            <div class="section">
                                <label for="username" class="field-label text-muted fs18 mb10">密码</label>
                                <label for="password" class="field prepend-icon">
                                    <input type="password" name="password" id="password" class="gui-input">
                                    <label for="password" class="field-icon">
                                        <i class="fa fa-lock"></i>
                                    </label>
                                </label>
                            </div>
                        </div>
                        <div class="panel-footer clearfix">
                            <div>
                                <div class="pull-left">
                                    <a href="/ops/resetPassword" class="button btn-primary block">重置密码</a>
                                </div>
                                <div class="pull-right">
                                    <button type="submit" class="button btn-primary block">登录</button>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </section>
        <!-- End: Content -->
    </section>
    <!-- End: Content-Wrapper -->
</div>
<#include 'include/footer_js.ftl'/>
</body>

</html>
