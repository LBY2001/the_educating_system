from django.shortcuts import  render
from django.http import  HttpResponse
from django.shortcuts import redirect
from django.urls import  reverse
from django.core.paginator import Paginator
from django.db.models import Q

from myadmin.models import opentable,Teachertable,Couresetable,User,Collegetable,openCourseTable,Judge

def index(request,pIndex=1):
    olist=openCourseTable.objects.all()
    mywhere = []
    # 获取并判断搜索条件
    kw = request.GET.get("keyword", None)
    if kw:
        ulist = olist.filter(semester__contains=kw)
        mywhere.append('keyword=' + kw)
    sed = request.GET.get("id", None)
    if sed:
        olist = olist.filter(id=sed)
        mywhere.append('id=' + sed)
        # 获取、判断并封装状态status搜索条件
    status = request.GET.get('status', '')
    if status != '':
        ulist = olist.filter(status=status)
        mywhere.append("status=" + status)
    olist = olist.order_by('id')
    pIndex = int(pIndex)
    page = Paginator(olist, 8)  # 以每页5条数据分页
    maxpages = page.num_pages  # 获取最大页数
    # 判断当前页是否越界
    if pIndex > maxpages:
        pIndex = maxpages
    if pIndex < 1:
        pIndex = 1
    list2 = page.page(pIndex)  # 获取当前页数据
    plist = page.page_range  # 获取页

    for vo in list2:
        tod=Couresetable.objects.get(course_id=vo.course_id)
        vo.tname=tod.course_name
        vo.xuefen=tod.credit

        uod=User.objects.get(username=vo.teacher_id)
        vo.teaname=uod.nickname
        cold=Collegetable.objects.get(college_id=vo.college_id)
        vo.collegename=cold.college_name

    context = {"openlist": list2, 'plist': plist, 'pIndex': pIndex, 'maxpages': maxpages,'mywhere':mywhere}
    return render(request, "web/showcourse/index.html", context)

