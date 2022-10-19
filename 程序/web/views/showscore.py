#成绩查询视图管理
from django.shortcuts import render
from django.http import HttpResponse
from django.core.paginator import Paginator
from django.shortcuts import redirect
from django.urls import reverse

from myadmin.models import Scoretable,Selectcourse,Couresetable,User,Collegetable,opentable,openCourseTable,Classtable,Judge,openHistory,Notice

def index(request,pIndex=1):
    '''展示学生分数'''
    stu_id=request.session['webuser']['username']
    studentname=request.session['webuser']['nickname']
    sclist = Classtable.objects.filter(student_id=stu_id)

    mywhere = []
    # 获取、判断并封装状态status搜索条件
    status = request.GET.get('student_id', '')
    if status != '':
        ulist = sclist.filter(status=status)
        mywhere.append("student_id=" + status)

    ulist = sclist.order_by("open_id")  # 对id排序
    # 执行分页处理
    pIndex = int(pIndex)
    page = Paginator(ulist, 8)  # 以每页10条数据分页
    maxpages = page.num_pages  # 获取最大页数
    # 判断当前页是否越界
    if pIndex > maxpages:
        pIndex = maxpages
    if pIndex < 1:
        pIndex = 1
    list2 = page.page(pIndex)  # 获取当前页数据
    plist = page.page_range  # 获取页码列表信息

    for vo in list2:
        temp = openHistory.objects.get(open_id=vo.open_id)
        tod = Couresetable.objects.get(course_id=temp.course_id)

        vo.credit = tod.credit

        uod = User.objects.get(username=vo.student_id)

        vo2 = Couresetable.objects.get(course_id=tod.course_id)
        vo.coursename = vo2.course_name
        obtemp = User.objects.get(username=vo.student_id)
        vo.credit = vo2.credit
        vo.studentname = obtemp.nickname

    context = {"scorelist": list2, 'plist': plist, 'pIndex': pIndex, 'maxpages': maxpages, 'mywhere': mywhere}
    return render(request, "web/score.html", context)

def selecourse(request,pIndex=1):
    if Judge.objects.get(judge_id=1).judge == 2:
        context = {'info': "选课时间未开启"}
        return render(request, "web/info.html", context)

    stu_id = request.session['webuser']['username']
    studentname = request.session['webuser']['nickname']
    secolist=openCourseTable.objects

    mywhere = []
    # 获取、判断并封装状态status搜索条件
    status = request.GET.get('status', '')
    if status != '':
        ulist = secolist.filter(select_id=status)
        mywhere.append("status=" + status)

    ulist = secolist.order_by("open_id")  # 对id排序
    # 执行分页处理
    pIndex = int(pIndex)
    page = Paginator(ulist, 8)  # 以每页10条数据分页
    maxpages = page.num_pages  # 获取最大页数
    # 判断当前页是否越界
    if pIndex > maxpages:
        pIndex = maxpages
    if pIndex < 1:
        pIndex = 1
    list2 = page.page(pIndex)  # 获取当前页数据
    plist = page.page_range  # 获取页码列表信息

    for vo in list2:
        user = User.objects.get(username=vo.teacher_id)
        vo.teachername = user.nickname
        course = Couresetable.objects.get(course_id=vo.course_id)
        vo.coursename = course.course_name

        if vo.time == 1:
            vo.coursetime = "周一上午"
        elif vo.time == 2:
            vo.coursetime = "周一下午"
        elif vo.time == 3:
            vo.coursetime = "周二上午"
        elif vo.time == 4:
            vo.coursetime = "周二下午"
        elif vo.time == 5:
            vo.coursetime = "周三上午"
        elif vo.time == 6:
            vo.coursetime = "周三下午"
        elif vo.time == 7:
            vo.coursetime = "周四上午"
        elif vo.time == 8:
            vo.coursetime = "周四下午"
        elif vo.time == 9:
            vo.coursetime = "周五上午"
        elif vo.time == 10:
            vo.coursetime = "周五下午"

    context = {"scorelist": list2, 'plist': plist, 'pIndex': pIndex, 'maxpages': maxpages, 'mywhere': mywhere}
    return render(request, "web/selectcourse.html", context)

def insert(request,uid):
    '''执行信息添加'''
    try:
        oblist = openCourseTable.objects.get(id=uid)
        #ob.id=request.POST['id']
        ob=Selectcourse()
        ob.id=oblist.id
        ob.student_id=request.session['webuser']['username']
        ob.course_id=oblist.course_id
        ob.teacher_id=oblist.teacher_id
        ob.college_id=oblist.college_id
        ob.save()
        context = {'info':"选课成功！"}
    except Exception as err:
        print(err)
        context = {'info':"选课失败！"}
    return render(request,"web/info.html",context)

def delete(request,uid=1):
    try:
        ob=Selectcourse.objects.get(id=uid)
        ob.delete()
        context={'info':"删除选课成功！"}
    except Exception as err:
        context={'info':"删除选课失败！"}
    return render(request,"web/info.html",context)

def selectadd(request,open_id=1):
    '''开课添加'''
    try:
        ob=Selectcourse()
        ob2 = Selectcourse.objects
        test = ob2.filter(student_id=request.session['webuser']['username'],main=1)

        # 选课数量控制
        if len(test) <= 3:
            ob.main = 1
        else:
            test2 = ob2.filter(student_id=request.session['webuser']['username'],main=2)
            if len(test2) <= 1:
                ob.main = 2
            else:
                raise ValueError("选课已满")

        # 选课重复控制
        testt = ob2.filter(student_id=request.session['webuser']['username'])
        open_idset = set()
        for i in testt:
            open_idset.add(i.open_id)
        if open_id in open_idset:
            raise ValueError("选课重复")
        else:
            ob.open_id = open_id

        ob.student_id = request.session['webuser']['username']

        temp = openCourseTable.objects.get(open_id=open_id)
        if temp.number == 10:
            raise ValueError("选课人数已满")
        if ob.main == 1:
            temp.number = temp.number + 1
        temp.save()
        ob.save()
        context = {'info': "添加成功！"}
    except Exception as err:
        print(err)
        context = {'info': err}
    return render(request, "web/info.html", context)

def showselect(request,uid=0):
    if Judge.objects.get(judge_id=1).judge == 2:
        context = {'info': "选课时间未开启"}
        return render(request, "web/info.html", context)
    # 添加选课
    stu_id = request.session['webuser']['username']
    studentname = request.session['webuser']['nickname']
    sclist = Selectcourse.objects.filter(student_id=stu_id)
    mywhere = []
    # 获取、判断并封装状态status搜索条件
    status = request.GET.get('student_id', '')
    if status != '':
        ulist = sclist.filter(student_id=status)
        mywhere.append("student_id=" + status)

    ulist = sclist.order_by("open_id")  # 对id排序
    # 执行分页处理
    pIndex = int(uid)
    page = Paginator(ulist, 8)  # 以每页10条数据分页
    maxpages = page.num_pages  # 获取最大页数
    # 判断当前页是否越界
    if pIndex > maxpages:
        pIndex = maxpages
    if pIndex < 1:
        pIndex = 1
    list2 = page.page(pIndex)  # 获取当前页数据
    plist = page.page_range  # 获取页码列表信息

    for vo in list2:

        temp = openCourseTable.objects.get(open_id=vo.open_id)
        tod = Couresetable.objects.get(course_id=temp.course_id)
        vo.credit = tod.credit
        vo2 = Couresetable.objects.get(course_id=tod.course_id)
        vo.coursename = vo2.course_name

        obtemp = User.objects.get(username=temp.teacher_id)
        vo.teachername = obtemp.nickname
        vo.number = temp.number
        if temp.time == 1:
            vo.coursetime = "周一上午"
        elif temp.time == 2:
            vo.coursetime = "周一下午"
        elif temp.time == 3:
            vo.coursetime = "周二上午"
        elif temp.time == 4:
            vo.coursetime = "周二下午"
        elif temp.time == 5:
            vo.coursetime = "周三上午"
        elif temp.time == 6:
            vo.coursetime = "周三下午"
        elif temp.time == 7:
            vo.coursetime = "周四上午"
        elif temp.time == 8:
            vo.coursetime = "周四下午"
        elif temp.time == 9:
            vo.coursetime = "周五上午"
        elif temp.time == 10:
            vo.coursetime = "周五下午"

        if vo.main == 1:
            vo.ismain = "主选"
        elif vo.main == 2:
            vo.ismain = "备选"

    context = {"selectlist": list2, 'plist': plist, 'pIndex': pIndex, 'maxpages': maxpages, 'mywhere': mywhere}
    return render(request, "web/showselect.html", context)

def selectchange(request,select_id=1,open_id=1):
    '''主选备选转换'''
    try:
        ob=Selectcourse.objects.get(select_id=select_id)
        num1=len(Selectcourse.objects.filter(student_id=request.session['webuser']['username'],main=1))
        num2 = len(Selectcourse.objects.filter(student_id=request.session['webuser']['username'], main=2))
        print(ob.main)
        temp = openCourseTable.objects.get(open_id=open_id)
        if ob.main == 1:
            if num2 == 2:
                raise ValueError("备选课程数已满")
            else:
                ob.main = 2
                temp.number = temp.number - 1
                temp.save()
                ob.save()
                context = {'info': "选课改为备选"}

        elif ob.main == 2:
            if num1 == 4:
                raise ValueError("主选课程数已满")
            else:
                ob.main = 1
                if temp.number == 10:
                    raise ValueError("选课班级已满员")
                temp.number = temp.number + 1
                temp.save()
                ob.save()
                context = {'info': "备选改为主选"}

    except Exception as err:
        print(err)
        context = {'info': err}
    return render(request, "web/info.html", context)

def selectchange(request,select_id=1,open_id=1):
    '''主选备选转换'''
    try:
        ob=Selectcourse.objects.get(select_id=select_id)
        num1=len(Selectcourse.objects.filter(student_id=request.session['webuser']['username'],main=1))
        num2 = len(Selectcourse.objects.filter(student_id=request.session['webuser']['username'], main=2))
        print(ob.main)
        temp = openCourseTable.objects.get(open_id=open_id)
        if ob.main == 1:
            if num2 == 2:
                raise ValueError("备选课程数已满")
            else:
                ob.main = 2
                temp.number = temp.number - 1
                temp.save()
                ob.save()
                context = {'info': "选课改为备选"}

        elif ob.main == 2:
            if num1 == 4:
                raise ValueError("主选课程数已满")
            else:
                ob.main = 1
                if temp.number == 10:
                    raise ValueError("选课班级已满员")
                temp.number = temp.number + 1
                temp.save()
                ob.save()
                context = {'info': "备选改为主选"}

    except Exception as err:
        print(err)
        context = {'info': err}
    return render(request, "web/info.html", context)

def selectdel(request,select_id=1):
    '''选课删除'''
    try:
        ob = Selectcourse.objects.get(select_id=select_id)
        ob2 = openCourseTable.objects.get(open_id=ob.open_id)
        if ob.main == 1:
            ob2.number = ob2.number - 1
            ob2.save()
        ob.delete()
        context = {'info': "删除成功！"}
    except Exception as err:
        print(err)
        context = {'info': "删除失败！"}
    return render(request, "web/info.html", context)

def notice(request,pIndex=0):
    '''展示学生分数'''
    stu_id = request.session['webuser']['username']
    studentname = request.session['webuser']['nickname']
    sclist = Notice.objects.filter(student_id=stu_id)

    mywhere = []
    # 获取、判断并封装状态status搜索条件
    status = request.GET.get('student_id', '')
    if status != '':
        ulist = sclist.filter(status=status)
        mywhere.append("student_id=" + status)

    ulist = sclist.order_by("-time")  # 对id排序
    # 执行分页处理
    pIndex = int(pIndex)
    page = Paginator(ulist, 8)  # 以每页10条数据分页
    maxpages = page.num_pages  # 获取最大页数
    # 判断当前页是否越界
    if pIndex > maxpages:
        pIndex = maxpages
    if pIndex < 1:
        pIndex = 1
    list2 = page.page(pIndex)  # 获取当前页数据
    plist = page.page_range  # 获取页码列表信息

    for vo in list2:
        '''emm没啥写的'''

    context = {"scorelist": list2, 'plist': plist, 'pIndex': pIndex, 'maxpages': maxpages, 'mywhere': mywhere}
    return render(request, "web/notice.html", context)