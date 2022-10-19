#前台大堂点餐端子路由文件
from django.urls import path,include

from web.views import index,showopen,showscore

urlpatterns = [
    path('', index.index, name="index"),

    #前端登陆退出的路由
    path('login', index.login, name="web_login"), #加载登录表单
    path('dologin', index.dologin, name="web_dologin"), #执行登录
    path('logout', index.logout, name="web_logout"), #退出
    path('verify', index.verify, name="web_verify"), #输出验证码

    #为url路由添加请求前缀web/,凡是带此前缀的url地址必须登录后才可访问
    path("web/",include([
        path('', index.webindex, name="web_index"), #前台大堂点餐首页
        path('showindex',index.showindex,name="web_showindex"),#展示学生端首页
        path('showcourse/<int:pIndex>',showopen.index,name="web_showcourse"),#显示课程信息
        path('comitdelete/<int:uid>',showscore.delete,name="web_deletecourse"),#添加选课信息

        path('showscore/<int:pIndex>', showscore.index, name="web_showscore"),  # 查询详细成绩信息
        path('selectcourse/<int:pIndex>', showscore.selecourse, name="web_selectcourse"),  # 添加选课信息
        path('comitselect/<int:uid>',showscore.insert,name="web_insertcourse"),#添加选课信息
        path('selectadd/<int:open_id>',showscore.selectadd,name="web_selectadd"),#添加选课信息
        path('showselect/<int:uid>', showscore.showselect, name="web_showselect"),  #查看已选课程
        path('selectchange/<int:select_id>/<int:open_id>', showscore.selectchange, name="web_selectchange"),  #查看已选课程
        path('selectdel/<int:select_id>', showscore.selectdel, name="web_selectdel"),  #查看已选课程
        path('notice/<int:pIndex>', showscore.notice, name="web_notice"),  # 查询详细成绩信息
    ]))
]
