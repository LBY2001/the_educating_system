#会员信息管理的视图文件
from django.shortcuts import render
from django.http import HttpResponse
from django.core.paginator import Paginator
from datetime import datetime
# Create your views here.
from myadmin.models import Member, Selectcourse, User, Couresetable

def index(request,pIndex=1):
    '''浏览信息'''
    umod = Selectcourse.objects
    ulist = umod.all()
    mywhere=[]

    for vo in ulist:
        ulist2 = User.objects.get(username = vo.student_id)
        vo.teacher_id = ulist2.nickname
        if Couresetable.objects.filter(course_id = vo.course_id).count() > 0:
            ulist2 = Couresetable.objects.get(course_id = vo.course_id)
            vo.college_id = ulist2.credit
            vo.course_id = ulist2.course_name

    #执行分页处理
    pIndex = int(pIndex)
    page = Paginator(ulist,10) #以每页5条数据分页
    maxpages = page.num_pages #获取最大页数
    #判断当前页是否越界
    if pIndex > maxpages:
        pIndex = maxpages
    if pIndex < 1:
        pIndex = 1
    list2 = page.page(pIndex) #获取当前页数据
    plist = page.page_range #获取页码列表信息
    context = {"memberlist":list2,'plist':plist,'pIndex':pIndex,'maxpages':maxpages,'mywhere':mywhere}
    return render(request,"myadmin/member/index.html",context)

def delete(request,uid=0):
    '''执行信息删除'''
    try:
        ob = Member.objects.get(id=uid)
        ob.status = 9
        ob.update_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        ob.save()
        context = {'info':"删除成功！"}
    except Exception as err:
        print(err)
        context = {'info':"删除失败！"}
    return render(request,"myadmin/info.html",context)

def add(request):
    '''加载信息添加表单'''
    return render(request,"myadmin/member/add.html")

def insert(request):
    '''执行信息添加'''
    try:
        #实例化model，封装信息，并执行添加操作
        ob = Selectcourse()
        ob.student_id = request.POST["name"]
        ob.course_id = request.POST["phone"]
        ob.id = Selectcourse.objects.all().count() + 1
        if User.objects.filter(username = ob.student_id).count() > 0:
            if Couresetable.objects.filter(course_id = ob.course_id).count() > 0:
                if Selectcourse.objects.filter(student_id = ob.student_id).filter(course_id = ob.course_id).count() == 0:
                    ob.save()
                    context = {'info':"添加成功！"}
                else:
                    context = {'info': "不能重复选择课程，添加失败！"}
            else:
                context = {'info': "未查询到该课程，添加失败！"}
        else:
            context = {'info': "未查询到该学生，添加失败！"}

    except Exception as err:
        print(err)
        context = {'info':"添加失败！"}
    return render(request,"myadmin/info.html",context)