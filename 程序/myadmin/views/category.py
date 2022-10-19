# 学生
from django.shortcuts import render
from django.http import HttpResponse
from django.http import JsonResponse
from django.core.paginator import Paginator
from datetime import datetime
# Create your views here.
from myadmin.models import Category, Shop, User, Studenttable, Collegetable

def index(request,pIndex=1):
    '''浏览信息'''
    umod = User.objects
    ulist = umod.filter(status=1)
    mywhere=[]
    #获取并判断搜索条件
    """
    kw = request.GET.get("keyword",None)
    if kw:
        ulist = ulist.filter(name__contains=kw)
        mywhere.append('keyword='+kw)
     # 获取、判断并封装状态status搜索条件
    status = request.GET.get('status','')
    if status != '':
        ulist = ulist.filter(status=status)
        mywhere.append("status="+status)
    """
    ulist = ulist.order_by("id")#对id排序
    umod2 = Studenttable.objects.all()
    umod3 = Collegetable.objects.all()

    for vo in ulist:
        student = Studenttable.objects.get(user_id=vo.username)
        vo.birth = student.date_of_birth
        vo.place = "学生"
        vo.grade = student.date_of_graduation
        vo.social = student.social_number



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

    context = {"categorylist":list2,'plist':plist,'pIndex':pIndex,'maxpages':maxpages,'mywhere':mywhere}
    return render(request,"myadmin/category/index.html",context)

def loadCategory(request,sid):
    clist = Category.objects.filter(status__lt=9,shop_id=sid).values("id","name")
    #返回QuerySet对象，使用list强转成对应的菜品分类列表信息
    return JsonResponse({'data':list(clist)})

def add(request):
    '''加载信息添加表单'''
    #获取当前所有店铺
    slist = Shop.objects.values("id",'name')
    context = {"shoplist":slist}
    return render(request,"myadmin/category/add.html",context)

def insert(request):
    '''执行信息添加'''
    try:
        if request.POST['password'] != request.POST['repassword']:
            raise Exception("密码不一致")
        if int(request.POST['grade']) < 1990 or int(request.POST['grade']) > 2040:
            raise Exception("毕业年份有误")
        # ob = Category()
        # ob.shop_id = request.POST['shop_id']
        # ob.name = request.POST['name']
        # ob.status = 1
        # ob.create_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        # ob.update_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        ob = Studenttable()
        ob2 = User()

        obtest = Studenttable.objects.filter(status="学生").last()
        ob.user_id = obtest.user_id + 1
        ob.date_of_graduation = request.POST['grade']
        ob.date_of_birth = request.POST['date_of_birth']
        ob.social_number = request.POST['social']
        ob2.nickname = request.POST['nickname']
        ob.status = "学生"

        # 密码
        import hashlib,random
        md5 = hashlib.md5()
        n = random.randint(100000, 999999)
        s = request.POST['password']+str(n) #从表单中获取密码并添加干扰值
        md5.update(s.encode('utf-8')) #将要产生md5的子串放进去
        ob2.password_hash = md5.hexdigest() #获取md5值
        ob2.password_salt = n
        ob2.status = 1
        ob2.username = ob.user_id

        ob.save()
        ob2.save()

        ob.save()
        context = {'info':"添加成功！"}
    except Exception as err:
        print(err)
        context = {'info':err}
    return render(request,"myadmin/info.html",context)

def delete(request,cid=0):
    '''执行信息删除'''
    try:
        Studenttable.objects.get(user_id=cid).delete()
        User.objects.get(username=cid).delete()
        context = {'info':"删除成功！"}
    except Exception as err:
        print(err)
        context = {'info':"删除失败！"}
    return render(request,"myadmin/info.html",context)

def edit(request,cid=0):
    '''加载信息编辑表单'''
    try:
        ob = Studenttable.objects.get(user_id=cid)
        ob2 = User.objects.get(username=cid)
        ob.nickname = ob2.nickname
        context = {'user':ob}
        return render(request,"myadmin/category/edit.html",context)
    except Exception as err:
        print(err)
        context = {'info':"没有找到要修改的信息！"}
        return render(request,"myadmin/info.html",context)

def update(request,cid):
    '''执行信息编辑'''
    try:
        # ob = Category.objects.get(id=cid)
        # ob.shop_id = request.POST['shop_id']
        # ob.name = request.POST['name']
        # ob.status = request.POST['status']
        # ob.update_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        if int(request.POST['grade']) < 1990 or int(request.POST['grade']) > 2040:
            raise Exception("毕业年份有误")
        ob = Studenttable.objects.get(user_id=cid)
        ob2 = User.objects.get(username=cid)
        ob.date_of_graduation = request.POST['grade']
        temp = ob.date_of_birth
        ob.date_of_birth = request.POST['date_of_birth']
        if ob.date_of_birth == "":
            ob.date_of_birth = temp
        ob.social_number = request.POST['social']
        ob2.nickname = request.POST['nickname']
        ob.save()
        ob2.save()
        context = {'info':"修改成功！"}
    except Exception as err:
        print(err)
        context = {'info':"修改失败！"}
    return render(request,"myadmin/info.html",context)