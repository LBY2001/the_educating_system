from django.shortcuts import  render
from django.http import  HttpResponse
from django.shortcuts import redirect
from django.urls import  reverse
from django.core.paginator import Paginator
from django.db.models import Q

from myadmin.models import opentable,Teachertable,Couresetable,User,Collegetable,Selectcourse,Scoretable,openCourseTable,Classtable,Judge,openHistory

def index(request,pIndex=1):
    stu_id = request.session['teacheruser']['username']
    teachername = request.session['teacheruser']['nickname']
    seco=opentable.objects
    secolist = seco.filter(teacher_id=stu_id)
    #olist = opentable.objects.all()
    mywhere = []
    # 获取并判断搜索条件
    kw = request.GET.get("keyword", None)
    if kw:
        ulist = secolist.filter(semester__contains=kw)
        mywhere.append('keyword=' + kw)
    ulist = secolist.order_by('id')
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
        vo.teachername = teachername
        tod = Couresetable.objects.get(course_id=vo.course_id)
        vo.tname = tod.course_name
        vo.xuefen = tod.credit

        cod=Collegetable.objects.get(college_id=vo.college_id)
        vo.collegename=cod.college_name

    opencourselist = openHistory.objects.get(teacher_id=stu_id)

    context = {"courselist": list2, 'plist': plist, 'pIndex': pIndex, 'maxpages': maxpages, 'mywhere': mywhere, 'opencourselisr': opencourselist}
    return render(request, "teacher/teachcourse.html", context)

def show_student(request,pIndex):#展示所教授课程的学生名单
    stu_id = request.session['teacheruser']['username']
    teachername = request.session['teacheruser']['nickname']
    seco = Selectcourse.objects
    secolist = seco.filter(teacher_id=stu_id)

    mywhere = []
    # 获取、判断并封装状态status搜索条件
    status = request.GET.get('status', '')
    if status != '':
        ulist = secolist.filter(status=status)
        mywhere.append("status=" + status)

    ulist = secolist.order_by("course_id")  # 对id排序
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
        vo.teachername = teachername
        tod = Couresetable.objects.get(course_id=vo.course_id)
        vo.tname = tod.course_name
        vo.xuefen = tod.credit

        uod = User.objects.get(username=vo.student_id)
        vo.studentname = uod.nickname

        cold = Collegetable.objects.get(college_id=vo.college_id)
        vo.collegename = cold.college_name

    context = {"studentlist": list2, 'plist': plist, 'pIndex': pIndex, 'maxpages': maxpages, 'mywhere': mywhere}
    return render(request, "teacher/studentshow.html", context)

def show_score(request,pIndex=1):
    try:
        tea_id=request.session['teacheruser']['username']
        teachername=request.session['teacheruser']['nickname']
        templist = openHistory.objects.filter(teacher_id=tea_id)
        tempidset = set()
        for i in templist:
            tempidset.add(i.open_id)

        sclist=Classtable.objects.filter(open_id__in=tempidset)
        mywhere = []
        print(sclist[0])
        # 获取、判断并封装状态status搜索条件
        status = request.GET.get('status', '')
        if status != '':
            ulist = sclist.filter(teacher_id=tea_id)
            mywhere.append("status=" + status)

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
            vo.teachername=teachername
            temp = openHistory.objects.get(open_id=vo.open_id)
            tod = Couresetable.objects.get(course_id=temp.course_id)

            vo.xuefen = tod.credit

            uod = User.objects.get(username=vo.student_id)
            vo.studentname = uod.nickname

            vo2 = Couresetable.objects.get(course_id=tod.course_id)
            vo.coursename = vo2.course_name
            obtemp = User.objects.filter(username=vo.student_id)
            vo.studentname = obtemp.first().nickname
            vo.credit = vo2.credit

        context = {"scorelist": list2, 'plist': plist, 'pIndex': pIndex, 'maxpages': maxpages, 'mywhere': mywhere}
        return render(request, "teacher/teacherscore.html", context)
    except Exception as err:
        print(err)
        context = {'info': "无授课班级或授课班级无人选课"}
        return render(request, "teacher/info.html", context)

def edit(request,uid=0,student_id=0):
    '''打分'''
    try:
        ob = Classtable.objects.filter(open_id=uid).get(student_id=student_id)
        context = {'user':ob}
        return render(request,"teacher/edit.html",context)
    except Exception as err:
        print(err)
        context = {'info':"没有找到要修改的信息！"}
        return render(request,"teacher/info.html",context)

def update(request,uid=0,student_id=0):
    '''执行信息编辑'''
    try:
        ob = Classtable.objects.filter(open_id=uid,student_id=student_id)
        ob.update(score=request.POST['score'])
        context = {'info':"修改成功！"}
    except Exception as err:
        print(err)
        context = {'info':"修改失败！"}
    return render(request,"teacher/info.html",context)

def show_classscore(request,pIndex=1):
    tea_id=request.session['teacheruser']['username']
    teachername=request.session['teacheruser']['nickname']
    scod=Scoretable.objects
    sclist=scod.filter(teacher_id=tea_id)

    mywhere = []
    # 获取、判断并封装状态status搜索条件
    status = request.GET.get('status', '')
    if status != '':
        ulist = sclist.filter(status=status)
        mywhere.append("status=" + status)

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
        vo.teachername=teachername
        tod = Couresetable.objects.get(course_id=vo.course_id)
        vo.tname = tod.course_name
        vo.xuefen = tod.credit

        uod = User.objects.get(username=vo.student_id)
        vo.studentname = uod.nickname

    context = {"scorelist": list2, 'plist': plist, 'pIndex': pIndex, 'maxpages': maxpages, 'mywhere': mywhere}
    return render(request, "teacher/teacherclassscore.html", context)


def showcourse(request,pIndex):#展示开课
    if Judge.objects.get(judge_id=1).judge == 2:
        context = {'info': "选课时间未开启"}
        return render(request, "teacher/info.html", context)
    '''浏览信息'''
    umod = openCourseTable.objects
    ulist = umod.filter(teacher_id=request.session['teacheruser']['username'])
    mywhere = []

    # 搜索
    kw = request.GET.get("keyword", None)
    if kw:
        ulist = ulist.filter(name__contains=kw)
        mywhere.append('keyword=' + kw)

    # 搜索
    cid = request.GET.get("teacher_id", None)
    if cid:
        ulist = ulist.filter(teacher_id=cid)
        mywhere.append('teacher_id=' + cid)
    # 状态
    # status = request.GET.get('status','')
    # if status != '':
    #     ulist = ulist.filter(status=status)
    #     mywhere.append("status="+status)

    ulist = ulist.order_by("open_id")  # 对id排序
    # 执行分页处理
    pIndex = int(pIndex)
    page = Paginator(ulist, 10)  # 以每页10条数据分页
    maxpages = page.num_pages  # 获取最大页数
    # 判断当前页是否越界
    if pIndex > maxpages:
        pIndex = maxpages
    if pIndex < 1:
        pIndex = 1
    list2 = page.page(pIndex)  # 获取当前页数据
    plist = page.page_range  # 获取页码列表信息

    # 遍历当前教师信息并封装对应的店铺和菜品类别信息
    for vo in list2:
        user = User.objects.get(username=vo.teacher_id)
        vo.teachername = user.nickname
        user = User.objects.get(username=vo.teacher_id)
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

    context = {"courselist": list2, 'plist': plist, 'pIndex': pIndex, 'maxpages': maxpages, 'mywhere': mywhere}
    return render(request, "teacher/teachcourse.html", context)

def coursedel(request,pid=0):
    '''开课删除'''
    try:
        openCourseTable.objects.get(open_id=pid).delete()
        context = {'info':"删除成功！"}
    except Exception as err:
        print(err)
        context = {'info':"删除失败！"}
    return render(request,"teacher/info.html",context)

def courseadd(request,pid=0):
    '''开课添加'''
    slist = Couresetable.objects.values("course_id", "course_name", "credit")
    context = {"courselist":slist}
    return render(request,"teacher/addcourse.html",context)

def courseinsert(request,pid=0):
    '''开课添加'''
    '''执行信息添加'''
    try:
        ob = openCourseTable()
        ob.course_id = int(request.POST['course'].split("--")[0])
        time = request.POST['time']
        ob2 = openCourseTable.objects.filter(teacher_id=request.session['teacheruser']['username'])
        thisdict = {
            "周一上午": 1,
            "周一下午": 2,
            "周二上午": 3,
            "周二下午": 4,
            "周三上午": 5,
            "周三下午": 6,
            "周四上午": 7,
            "周四下午": 8,
            "周五上午": 9,
            "周五下午": 10
        }
        for i in ob2:
            if i.time == thisdict[request.POST['time']]:
                raise ValueError("1")
            if i.course_id == ob.course_id:
                raise ValueError("2")
        if time == "周一上午":
            ob.time = 1
        elif time == "周一下午":
            ob.time = 2
        elif time == "周二上午":
            ob.time = 3
        elif time == "周二下午":
            ob.time = 4
        elif time == "周三上午":
            ob.time = 5
        elif time == "周三下午":
            ob.time = 6
        elif time == "周四上午":
            ob.time = 7
        elif time == "周四下午":
            ob.time = 8
        elif time == "周五上午":
            ob.time = 9
        elif time == "周五下午":
            ob.time = 10

        ob.teacher_id = request.session['teacheruser']['username']
        ob.save()
        context = {'info': "添加成功！"}

    except Exception as err:
        print(err)
        context = {'info': "添加失败，授课时间冲突，或重复选课！"}
    return render(request, "teacher/info.html", context)