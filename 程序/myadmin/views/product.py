# 左侧视图以及教师信息
from django.shortcuts import render
from django.http import HttpResponse
from django.core.paginator import Paginator
from datetime import datetime
import time,os
# Create your views here.
from myadmin.models import Product, Category, Shop, User, Teachertable, Collegetable, Collegetable,openCourseTable,Selectcourse

def index(request,pIndex=1):
    '''浏览信息'''
    umod = User.objects
    ulist = umod.filter(status=3)
    mywhere=[]

    #搜索
    kw = request.GET.get("keyword",None)
    if kw:
        ulist = ulist.filter(name__contains=kw)
        mywhere.append('keyword='+kw)

    #搜索
    cid = request.GET.get("username",None)
    if cid:
        ulist = ulist.filter(username=cid)
        mywhere.append('username='+cid)
    #状态
    # status = request.GET.get('status','')
    # if status != '':
    #     ulist = ulist.filter(status=status)
    #     mywhere.append("status="+status)

    ulist = ulist.order_by("username")#对id排序
    #执行分页处理
    pIndex = int(pIndex)
    page = Paginator(ulist,10) #以每页10条数据分页
    maxpages = page.num_pages #获取最大页数
    #判断当前页是否越界
    if pIndex > maxpages:
        pIndex = maxpages
    if pIndex < 1:
        pIndex = 1
    list2 = page.page(pIndex) #获取当前页数据
    plist = page.page_range #获取页码列表信息

    #遍历当前教师信息并封装对应的店铺和菜品类别信息
    for vo in list2:
        teacher = Teachertable.objects.get(user_id=vo.username)
        vo.status = teacher.position

        # temp = Collegetable.objects.get(college_id=teacher.college_id)
        # vo.department = temp.college_name

        vo.birth = teacher.date_of_birth
        vo.social = teacher.social_security_number
        vo.college_id = teacher.college_id

    context = {"productlist":list2,'plist':plist,'pIndex':pIndex,'maxpages':maxpages,'mywhere':mywhere}
    return render(request,"myadmin/product/index.html",context)

def add(request):
    '''加载信息添加表单'''
    #获取当前所有店铺
    slist = Shop.objects.values("id",'name')
    context = {"shoplist":slist}
    return render(request,"myadmin/product/add.html",context)

def insert(request):
    '''执行信息添加'''
    try:
        ob = Teachertable()
        ob2 = User()
        if request.POST['password'] != request.POST['repassword']:
            raise Exception("密码不一致")
        if request.POST['status'] != "教授" and request.POST['status'] != "副教授" and request.POST['status'] != "讲师":
            raise Exception("职称格式错误")
        if request.POST['college_id'] != "文学院" and request.POST['college_id'] != "计算机科学与技术学院" and request.POST['college_id'] != "材料学院":
            raise Exception("学院名称错误")
        obtest = Teachertable.objects.filter(position="教授").last()
        obtest2 = Teachertable.objects.filter(position="副教授").last()
        obtest3 = Teachertable.objects.filter(position="讲师").last()
        maxnum = max(obtest.user_id, max(obtest2.user_id, obtest3.user_id))
        ob.user_id = maxnum + 1
        ob.position = request.POST['status']
        ob.date_of_birth = request.POST['date_of_birth']
        ob.social_security_number = request.POST['social']
        ob2.nickname = request.POST['nickname']
        # 密码
        import hashlib, random
        md5 = hashlib.md5()
        n = random.randint(100000, 999999)
        s = request.POST['password'] + str(n)  # 从表单中获取密码并添加干扰值
        md5.update(s.encode('utf-8'))  # 将要产生md5的子串放进去
        ob2.password_hash = md5.hexdigest()  # 获取md5值
        ob2.password_salt = n
        ob2.status = 3
        ob2.username = ob.user_id
        ob.college_id = request.POST['college_id']
        ob.save()
        ob2.save()
        ob.save()
        context = {'info': "添加成功！"}

    except Exception as err:
        print(err)
        context = {'info': err}
    return render(request, "myadmin/info.html", context)

def delete(request,pid=0):
    '''执行信息删除'''
    try:
        Teachertable.objects.get(user_id=pid).delete()
        User.objects.get(username=pid).delete()

        ob1 = openCourseTable.objects.filter(teacher_id=pid)
        if len(ob1) != 0:
            for i in ob1:
                ob2 = Selectcourse.objects.filter(open_id=i.open_id)
                if len(ob2) != 0:
                    for j in ob2:
                        j.delete()
                i.delete()

        context = {'info':"删除成功！"}
    except Exception as err:
        print(err)
        context = {'info':"删除失败！"}
    return render(request,"myadmin/info.html",context)

def edit(request,pid=0):
    '''加载信息编辑表单'''
    try:
        ob = Teachertable.objects.get(user_id=pid)
        ob2 = User.objects.get(username=pid)
        ob.nickname = ob2.nickname
        context = {'user': ob}
        return render(request, "myadmin/product/edit.html", context)
    except Exception as err:
        print(err)
        context = {'info': "没有找到要修改的信息！"}
        return render(request, "myadmin/info.html", context)

def update(request,pid):
    '''执行信息编辑'''
    try:
        # ob = Category.objects.get(id=cid)
        # ob.shop_id = request.POST['shop_id']
        # ob.name = request.POST['name']
        # ob.status = request.POST['status']
        # ob.update_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        if request.POST['status'] != "教授" and request.POST['status'] != "副教授" and request.POST['status'] != "讲师":
            raise Exception("职称格式错误")
        if request.POST['college_id'] != "文学院" and request.POST['college_id'] != "计算机科学与技术学院" and request.POST['college_id'] != "材料学院":
            raise Exception("学院名称错误")
        ob = Teachertable.objects.get(user_id=pid)
        ob2 = User.objects.get(username=pid)
        temp = ob.date_of_birth
        ob.date_of_birth = request.POST['date_of_birth']
        if ob.date_of_birth == "":
            ob.date_of_birth = temp
        ob.social_security_number = request.POST['social']
        ob2.nickname = request.POST['nickname']
        ob.position = request.POST['status']
        ob.college_id = request.POST['college_id']
        ob.save()
        ob2.save()
        context = {'info': "修改成功！"}
    except Exception as err:
        print(err)
        context = {'info': err}
    return render(request, "myadmin/info.html", context)