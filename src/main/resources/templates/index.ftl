<#import "spring.ftl" as s>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <meta charset="utf-8">
    <title>DashBoard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<#include 'include/baselink.ftl'>
</head>

<body class="dashboard-page">
<#include 'include/skin-toolbox.ftl'>
<div id="main">
<#include 'include/header.ftl'>
<#include 'include/sidebar.ftl'>
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
                    <li class="crumb-trail">控制台</li>
                </ol>
            </div>
        </header>
        <section id="content" class="table-layout animated fadeIn">
        </section>
        <#include 'include/footer.ftl' />
    </section>
</div>
<#include 'include/footer_js.ftl'/>
</body>

</html>
