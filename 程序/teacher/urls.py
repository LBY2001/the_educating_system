from django.urls import  path
from teacher.views import index,teachercourse

urlpatterns = [
    path('', index.index, name="teacher_index"), #教师端首页

    path('login', index.login, name="teacher_login"),  # 加载登录表单
    path('dologin', index.dologin, name="teacher_dologin"),  # 执行登录
    path('logout', index.logout, name="teacher_logout"),  # 退出
    path('verify', index.verify, name="teacher_verify"),  # 输出验证码

    path('teacherindex',index.showindex,name="teacher_showindex"),#展示教师端首页
    path('teachcourse/<int:pIndex>',teachercourse.index,name="teacher_showcourse"),#展示教师端首页
    path('teacherstudent/<int:pIndex>',teachercourse.show_student,name="teacher_showstudent"),#展示教师端首页
    path('teacherscore/edit/<int:uid>', teachercourse.edit, name="teacher_score_edit"), #加载编辑表单
    path('teacherscore/update/<int:uid>', teachercourse.update, name="teacher_score_update"), #执行编辑
    path('teacherclassscore/<int:pIndex>',teachercourse.show_classscore,name="teacher_classscore"),#展示教师端首页

    path('teachcourse/showcourse<int:pIndex>',teachercourse.showcourse,name="teacher_showcourse"),#展示开课
    path('teachcourse/coursedel/<int:pid>',teachercourse.coursedel,name="teacher_course_del"),#删除开课
    path('teachcourse/courseadd',teachercourse.courseadd,name="teacher_course_add"),#添加开课
    path('teachcourse/courseinsert',teachercourse.courseinsert,name="teacher_course_insert"),#添加开课
    path('teacherscore/<int:pIndex>', teachercourse.show_score, name="teacher_score"),  # 打分
    path('teacherscore/edit/<int:uid>/<int:student_id>', teachercourse.edit, name="teacher_score_edit"),  # 打分
    path('teacherscore/update/<int:uid>/<int:student_id>', teachercourse.update, name="teacher_score_update"),  # 存分

]