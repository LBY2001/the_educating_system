from django.db import models
from datetime import datetime

# Create your models here.
#账号信息模型
class User(models.Model):
    username = models.CharField(max_length=50)    #员工账号
    nickname = models.CharField(max_length=50)    #昵称
    password_hash = models.CharField(max_length=100)#密码
    password_salt = models.CharField(max_length=50)    #密码干扰值
    status = models.IntegerField(default=1)    #状态:1正常/2禁用/6管理员/9删除
    create_at = models.DateTimeField(default=datetime.now)    #创建时间
    update_at = models.DateTimeField(default=datetime.now)    #修改时间
    #college_id = models.CharField(max_length=255)  # 密码
    def toDict(self):
        return {'id':self.id,'username':self.username,'nickname':self.nickname,'password_hash':self.password_hash,'password_salt':self.password_salt,'status':self.status,'create_at':self.create_at.strftime('%Y-%m-%d %H:%M:%S'),'update_at':self.update_at.strftime('%Y-%m-%d %H:%M:%S')} # 'college_id':self.college_id

    class Meta:
        db_table = "user"  # 更改表名

class Selectcourse(models.Model):
    select_id = models.IntegerField(primary_key=True)
    student_id = models.CharField(max_length=255, blank=True)
    open_id = models.CharField(max_length=255, blank=True)
    main = models.CharField(max_length=255, blank=True)

    def toDict(self):
        return {'select_id':self.select_id,'student_id':self.student_id,'open_id':self.open_id,'main':self.main}

    class Meta:
        db_table = 'selectcourse'


class Collegetable(models.Model):
        college_id = models.CharField(primary_key=True, max_length=255)
        college_name = models.CharField(max_length=255, blank=True, null=True)

        def toDict(self):
            return {'college_id':self.college_id,'college_name':self.college_name}

        class Meta:
            db_table = 'collegetable'

class Couresetable(models.Model):
        course_id = models.IntegerField(primary_key=True, max_length=255)
        course_name = models.CharField(max_length=255, blank=True, null=True)
        credit = models.IntegerField(max_length=255, blank=True, null=True)

        def toDict(self):
            return {'id':self.course_id,'course_name':self.course_name,'credit':self.credit}
        class Meta:
            db_table = 'couresetable'

class Scoretable(models.Model):
    id = models.IntegerField(primary_key=True)
    score = models.CharField(max_length=255, blank=True, null=True)
    open_id = models.CharField(max_length=255, blank=True, null=True)
    student_id = models.CharField(max_length=255, blank=True, null=True)
    teacher_id=models.CharField(max_length=255,blank=True,null=True)
    course_id=models.CharField(max_length=255,blank=True,null=True)

    def toDict(self):
        return {'id':self.id,'score':self.score,'open_id':self.open_id,'student_id':self.student_id,'teacher_id':self.teacher_id,'course_id':self.course_id}

    class Meta:
        db_table = 'scoretable'

class Classtable(models.Model):
    class_id = models.IntegerField(primary_key=True)
    open_id = models.IntegerField(blank=True, null=True)
    student_id = models.IntegerField(blank=True, null=True)
    score = models.CharField(max_length=1, blank=True, null=True)

    class Meta:
        db_table = 'class'

class Studenttable(models.Model):
    user_id = models.IntegerField(primary_key=True)
    date_of_graduation = models.IntegerField(blank=True, null=True)
    status = models.CharField(max_length=255, blank=True, null=True)
    date_of_birth = models.DateField(blank=True, null=True)
    social_number = models.IntegerField(blank=True, null=True)

    class Meta:
        db_table = 'studenttable'


class Teachertable(models.Model):
    user_id = models.CharField(primary_key=True ,max_length=255, blank=True)
    position = models.CharField(max_length=255, blank=True, null=True)
    # college_id = models.CharField(max_length=255, blank=True, null=True)
    social_security_number = models.IntegerField(blank=True, null=True)
    date_of_birth = models.DateField(blank=True, null=True)
    college_id = models.CharField(max_length=255)

    class Meta:
        db_table = 'teachertable'

class openCourseTable(models.Model):
    open_id = models.IntegerField(primary_key=True ,max_length=255, blank=True)
    course_id = models.IntegerField(max_length=255, blank=True)
    teacher_id = models.IntegerField(max_length=255, blank=True)
    time = models.IntegerField(max_length=255, blank=True)
    number = models.IntegerField(max_length=255, blank=True, default=0)
    class Meta:
        db_table = 'openCourseTable'

class opentable(models.Model):
    id=models.AutoField(primary_key=True)
    semester=models.CharField(max_length=255)
    course_time=models.CharField(max_length=255)
    course_id=models.CharField(max_length=255)
    teacher_id=models.CharField(max_length=255)
    college_id=models.CharField(max_length=255)

    def toDict(self):
        return{'id':self.id,'semester':self.semester,'course_time':self.course_time,'course_id':self.course_id,'teacher_id':self.teacher_id,'college_id':self.college_id}

    class Meta:
        db_table="opentable"

#店铺信息模型
class Shop(models.Model):
    name = models.CharField(max_length=255)        #店铺名称
    cover_pic = models.CharField(max_length=255)#封面图片
    banner_pic = models.CharField(max_length=255)#图标Logo
    address = models.CharField(max_length=255)    #店铺地址
    phone = models.CharField(max_length=255)    #联系电话
    status = models.IntegerField(default=1)        #状态:1正常/2暂停/9删除
    create_at = models.DateTimeField(default=datetime.now)    #创建时间
    update_at = models.DateTimeField(default=datetime.now)    #修改时间

    def toDict(self):
        shopname = self.name.split("-")
        return {'id':self.id,'name':shopname[0],'shop':shopname[1],'cover_pic':self.cover_pic,'banner_pic':self.banner_pic,'address':self.address,'phone':self.phone,'status':self.status,'create_at':self.create_at.strftime('%Y-%m-%d %H:%M:%S'),'update_at':self.update_at.strftime('%Y-%m-%d %H:%M:%S')}

    class Meta:
        db_table = "shop"  # 更改表名

#菜品分类信息模型
class Category(models.Model):
    shop_id = models.IntegerField()        #店铺id
    name = models.CharField(max_length=50)#分类名称
    status = models.IntegerField(default=1)        #状态:1正常/9删除
    create_at = models.DateTimeField(default=datetime.now)    #创建时间
    update_at = models.DateTimeField(default=datetime.now)    #修改时间

    class Meta:
        db_table = "category"  # 更改表名

#菜品信息模型
class Product(models.Model):
    shop_id = models.IntegerField()        #店铺id
    category_id = models.IntegerField()    #菜品分类id
    cover_pic = models.CharField(max_length=50)    #菜品图片
    name = models.CharField(max_length=50)#菜品名称
    price = models.FloatField()    #菜品单价
    status = models.IntegerField(default=1)        #状态:1正常/2停售/9删除
    create_at = models.DateTimeField(default=datetime.now)    #创建时间
    update_at = models.DateTimeField(default=datetime.now)    #修改时间

    def toDict(self):
        return {'id':self.id,'shop_id':self.shop_id,'category_id':self.category_id,'cover_pic':self.cover_pic,'name':self.name,'price':self.price,'status':self.status,'create_at':self.create_at.strftime('%Y-%m-%d %H:%M:%S'),'update_at':self.update_at.strftime('%Y-%m-%d %H:%M:%S')}

    class Meta:
        db_table = "product"  # 更改表名

#会员信息模型
class Member(models.Model):
    nickname = models.CharField(max_length=50)    #昵称
    avatar = models.CharField(max_length=255)    #头像
    mobile = models.CharField(max_length=50)    #电话
    status = models.IntegerField(default=1)        #状态:1正常/2禁用/9删除
    create_at = models.DateTimeField(default=datetime.now)    #创建时间
    update_at = models.DateTimeField(default=datetime.now)    #修改时间

    def toDict(self):
        return {'id':self.id,'nickname':self.nickname,'avatar':self.avatar,'mobile':self.mobile,'status':self.status}

    class Meta:
        db_table = "member"  # 更改表名

# 订单模型
class Orders(models.Model):
    shop_id = models.IntegerField()   #店铺id号
    member_id = models.IntegerField() #会员id
    user_id = models.IntegerField()   #操作员id
    money = models.FloatField()     #金额
    status = models.IntegerField(default=1)   #订单状态:1过行中/2无效/3已完成
    payment_status = models.IntegerField(default=1)   #支付状态:1未支付/2已支付/3已退款
    create_at = models.DateTimeField(default=datetime.now)  #创建时间
    update_at = models.DateTimeField(default=datetime.now)  #修改时间

    class Meta:
        db_table = "orders"  # 更改表名


#订单详情模型
class OrderDetail(models.Model):
    order_id = models.IntegerField()  #订单id
    #product_id = models.IntegerField()  #菜品id
    product = models.ForeignKey('Product',on_delete=models.CASCADE) # 多对一
    product_name = models.CharField(max_length=50) #菜品名称
    price = models.FloatField()     #单价
    quantity = models.IntegerField()  #数量
    status = models.IntegerField(default=1) #状态:1正常/9删除

    class Meta:
        db_table = "order_detail"  # 更改表名


# 支付信息模型
class Payment(models.Model):
    order_id = models.IntegerField()  #订单id号
    member_id = models.IntegerField() #会员id
    money = models.FloatField()     #支付金额
    type = models.IntegerField()      #付款方式：1会员付款/2收银收款
    bank = models.IntegerField(default=1) #收款银行渠道:1微信/2余额/3现金/4支付宝
    status = models.IntegerField(default=1) #支付状态:1未支付/2已支付/3已退款
    create_at = models.DateTimeField(default=datetime.now)  #创建时间
    update_at = models.DateTimeField(default=datetime.now)  #修改时间

    class Meta:
        db_table = "payment"  # 更改表名

# 判断是否开始选课
class Judge(models.Model):
    judge_id = models.IntegerField(primary_key=True)
    judge = models.IntegerField()

    class Meta:
        db_table = "judge"  # 更改表名

# 通知
class Notice(models.Model):
    notice_id = models.IntegerField(primary_key=True)  #订单id号
    student_id = models.IntegerField() #会员id
    notice = models.CharField(max_length=255)
    time = models.DateTimeField()  #修改时间

    class Meta:
        db_table = "notice"  # 更改表名

class openHistory(models.Model):
    open_id = models.IntegerField(primary_key=True ,max_length=255, blank=True)
    course_id = models.IntegerField(max_length=255, blank=True)
    teacher_id = models.IntegerField(max_length=255, blank=True)
    time = models.IntegerField(max_length=255, blank=True)

    class Meta:
        db_table = 'openhistory'
