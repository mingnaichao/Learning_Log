from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from .forms import *
from django.http import HttpResponseRedirect, HttpResponse, Http404
from django.urls import reverse
from urllib import request, parse
import re
from selenium import webdriver
import pygal
from pygal.style import LightColorizedStyle as LCS, LightenStyle as LS


# Create your views here.
def index_views(request):
    '''主页'''
    return render(request, 'learning_logs/index.html', {})


# 加装饰器，在运行topics_views之前先运行login_required()中的代码
# login_required()中检查用户是否已登录，只有用户登录时，Django才运行topics_views(),如果未登录，重定向到登录页面
# @login_required(login_url='/users/login/')
@login_required
def home_views(request):
    '''home页'''
    return render(request, 'learning_logs/home.html', {})


@login_required
def topics_views(request):
    '''显示所有标题'''
    # 限制用户只能访问自己的主题，按照创建时间排序
    topics = Topic.objects.filter(owner=request.user).order_by('date_added')
    return render(request, 'learning_logs/topics.html', locals())


@login_required
def topic_views(request, topic_id):
    '''显示单个标题及其所有笔记'''
    # 根据topic_id获取topic
    topic = Topic.objects.get(id=topic_id)
    # 确认请求的主题属于当前用户
    if topic.owner != request.user:
        raise Http404  # 响应404，服务器没有请求的资源
    entries = topic.entry_set.all().order_by('-date_added')  # 反向查询（在笔记中添加的外键）
    return render(request, 'learning_logs/topic.html', locals())


@login_required
def new_topic_views(request):
    '''添加新标题'''
    if request.method == 'GET':
        # 定义一个TopicForm类的对象form（表单控件）
        form = TopicForm()
    else:
        # 将request.POST中的数据保存给TopicFrom
        form = TopicForm(request.POST)
        # 验证数据是否通过验证
        if form.is_valid():
            # 获取请求提交的数据，保存到数据库
            cd = form.cleaned_data
            cd['owner'] = request.user  # 将新主题的owner属性设置为当前用户
            Topic(**cd).save()
            # 重定向页面
            return HttpResponseRedirect(reverse('learning_logs:topics'))
    return render(request, 'learning_logs/new_topic.html', locals())


@login_required
def edit_topic_views(request, topic_id):
    '''编辑标题'''
    # 根据topic_id找到topic
    topic = Topic.objects.get(id=topic_id)
    if topic.owner != request.user:
        raise Http404  # 响应404，服务器没有请求的资源
    if request.method == 'GET':
        # 用户初次请求，使用当前内容填充表单
        form = TopicForm(instance=topic)
    else:
        # POST提交数据时，对数据进行处理
        form = TopicForm(instance=topic, data=request.POST)
        # 验证数据是否通过验证
        if form.is_valid():
            # 将修改后的数据保存到数据库
            form.save()
            return HttpResponseRedirect(reverse('learning_logs:topics'))
    return render(request, 'learning_logs/edit_topic.html', locals())


@login_required
def delete_topic_views(request, topic_id):
    '''删除已有标题'''
    # 根据topic_id删除标题
    Topic.objects.get(id=topic_id).delete()
    return render(request, 'learning_logs/delete_topic.html', locals())


@login_required
def new_entry_views(request, topic_id):
    '''在特定的标题中添加新笔记'''
    topic = Topic.objects.get(id=topic_id)
    if request.method == 'GET':
        # 为提交数据，创建一个新表单
        form = EntryForm()
    else:
        # POST提交的数据，对数据进行处理
        # 将request.POST中的数据保存到EntryForm
        form = EntryForm(request.POST)
        # 验证数据是否通过验证
        if form.is_valid():
            # 获取请求提交的数据
            new_entry = form.cleaned_data
            # 给笔记绑定主题（topic_id）
            new_entry['topic'] = topic
            # 给笔记绑定创建用户（owner_id）
            new_entry['owner'] = request.user
            # 将数据保存到数据库
            Entry(**new_entry).save()
            # 添加完条目后重定向到当前标题页面
            return HttpResponseRedirect(reverse('learning_logs:topic', args=[topic_id]))
    return render(request, 'learning_logs/new_entry.html', locals())


@login_required
def edit_entry_views(request, entry_id):
    '''编辑既有笔记'''
    # 根据entry_id找到对应的entry
    entry = Entry.objects.get(id=entry_id)
    # 找到entry关联的topic
    topic = entry.topic

    # 禁止登录的其他用户通过手动输入url访问此界面
    if topic.owner != request.user:
        raise Http404  # 响应404，服务器没有请求的资源

    if request.method == 'GET':
        # 用户初次请求，使用当前条目填充表单
        # 使用instance=entry实参创建一个EntryForm实例，entry实参让Django创建一个表单，并使用既有条目填充它
        form = EntryForm(instance=entry)
    else:
        # POST提交数据时，对数据进行处理
        form = EntryForm(instance=entry, data=request.POST)
        # 验证数据是否通过验证
        if form.is_valid():
            # 将修改后的数据保存到数据库
            form.save()
            # 重定向到原标题页面
            return HttpResponseRedirect(reverse('learning_logs:topic', args=[topic.id]))
    return render(request, 'learning_logs/edit_entry.html', locals())


@login_required
def delete_entry_views(request, entry_id):
    '''删除既有笔记'''
    # 根据entry_id找到要删除的entry
    entry = Entry.objects.get(id=entry_id)
    # 找到要删除笔记的标题，删除完后用来返回标题页面
    topic = entry.topic
    # 删除笔记
    entry.delete()
    return render(request, 'learning_logs/delete_entry.html', locals())


@login_required
def query_entry_views(request):
    '''查询笔记'''
    if request.method == 'GET':
        # 定义一个QueryForm类的对象form(表单控件)
        form = QueryForm()
    else:
        # 将request.POST中的数据保存到QueryForm中
        form = QueryForm(request.POST)
        # 验证数据是否通过验证
        if form.is_valid():
            # 获取数据
            text = form.cleaned_data
            # 根据内容和用户id查找数据库，筛选符合条件的记录
            entries = Entry.objects.filter(text__contains=text['text'], owner_id=request.user.id)
            return render(request, 'learning_logs/query_entry_result.html', locals())
    return render(request, 'learning_logs/query_entry.html', locals())


@login_required
def query_book_views(request):
    '''搜索图书'''
    if request.method == 'GET':
        # 定义一个TopicForm类的对象form（表单控件）
        form = TopicForm()
    else:
        # 将request.POST中的数据保存给TopicFrom
        form = TopicForm(request.POST)
        # 验证数据是否通过验证
        if form.is_valid():
            # 获取请求提交的数据，保存到数据库
            text = form.cleaned_data  # {'text': 'haha'}
            # 根据用户id和用户输入的图书名搜索数据库
            content = History.objects.all().values('id', 'num').filter(text=text['text'], owner_id=request.user.id)
            if content:  # 该图书已有记录
                num = content[0]['num']
                num += 1
                n = History.objects.get(id=content[0]['id'])
                n.num = num
                n.save()
            else:  # 该图书没有记录
                search_content = {
                    'text': text['text'],
                    'owner_id': request.user.id,
                }
                History(**search_content).save()
            s_book = text['text']
            book = parse.quote(s_book)  # 转换为浏览器能识别的格式
            url = 'https://book.douban.com/subject_search?search_text=' + book + '&cat=1001'

            driver = webdriver.Chrome()
            driver.get(url)
            # 找到元素，输入信息，点击搜索按钮
            elements = driver.find_elements_by_class_name('title-text')
            elements[1].click()

            # 图书信息、作者信息
            pattern1 = re.compile('<div class="intro">([\s\S]*?)</div>')
            data1 = re.findall(pattern1, driver.page_source)

            # 点击更多短评
            driver.find_element_by_xpath('//*[@id="content"]/div/div[1]/div[3]/p/a').click()
            # 图书评论20条
            pattern2 = re.compile('<p class="comment-content">([\s\S]*?)</p>')
            data2 = re.findall(pattern2, driver.page_source)
            # 评论点赞数
            pattern3 = re.compile('<span id="c-([\s\S]*?)" class="vote-count">([\s\S]*?)</span>')
            data3 = re.findall(pattern3, driver.page_source)

            driver.close()
            id = []
            zan = []
            num = 0
            for i in data3:
                if num == 20:
                    break
                id.append(i[0])
                zan.append(i[1])
                num += 1

            # 数据可视化
            my_style = LS('#333366', base_style=LCS)

            my_config = pygal.Config()
            my_config.x_label_rotation = 45
            my_config.show_legend = False
            my_config.title_font_size = 24
            my_config.label_font_size = 14
            my_config.major_label_font_size = 18
            my_config.truncate_label = 15
            # my_config.show_y_guides = False
            my_config.width = 1000

            chart = pygal.Bar(my_config, style=my_style)
            chart.title = '热门短评点赞数'
            chart.x_labels = id

            def fun(x, y):
                '''处理函数'''
                dict = {'value': int(x), 'label': '点赞 of ' + y}
                return dict

            # 使用高阶函数进行数据组合处理
            plot_dicts = [m for m in map(fun, zan, id)]

            chart.add('', plot_dicts)
            chart.render_to_file(
                '/Users/mingnaichao/Desktop/小项目/读书笔记/learning_log/learning_logs/templates/learning_logs/bookZan.svg')
            # 图书信息和作者信息
            dict1 = {
                'info': data1[0],
                'author': data1[-1],
            }
            # 20条评论
            dict2 = []
            for comment in data2:
                dict2.append(comment)

            # 重定向页面
            return render(request, 'learning_logs/query_book_result.html', locals())
    return render(request, 'learning_logs/query_book.html', locals())


@login_required
def query_book_svg(request):
    '''图书评论赞可视化文件'''
    return render(request, 'learning_logs/bookZan.svg', {})


@login_required
def behavior_analysis_views(request):
    '''用户行为分析'''
    analysis = History.objects.filter(owner=request.user).order_by('-num')
    text = []  # 图书名字
    num = []  # 搜索数量
    for i in analysis:
        text.append(i.text)
        num.append(i.num)

    length = len(text)

    # 只取前十个
    if len(text) > 10:
        text = text[:10]
        num = num[:10]

    # 数据可视化
    my_style = LS('#333366', base_style=LCS)

    my_config = pygal.Config()
    my_config.x_label_rotation = 45
    my_config.show_legend = False
    my_config.title_font_size = 24
    my_config.label_font_size = 14
    my_config.major_label_font_size = 18
    my_config.truncate_label = 15  # 将较长的名字缩短为15个字符
    # my_config.show_y_guides = False #隐藏水平线
    my_config.width = 1000

    chart = pygal.Bar(my_config, style=my_style)
    chart.title = '您的历史搜索'

    chart.x_labels = text

    chart.add('', num)
    chart.render_to_file(
        '/Users/mingnaichao/Desktop/小项目/读书笔记/learning_log/learning_logs/templates/learning_logs/analysis.svg')

    s_book = text[0]  # 该用户搜索次数最多的书籍
    book = parse.quote(s_book)  # 转换为浏览器能识别的格式
    dict = {
        'book_num': length,
        'hot_book': text[0],
        'search_num': num[0],
        'jd_buy': 'https://search.jd.com/Search?keyword=' + book + '&enc=utf-8&wq=' + book
    }

    url = 'https://book.douban.com/subject_search?search_text=' + book + '&cat=1001'

    driver = webdriver.Chrome()
    driver.get(url)
    # 找到元素，输入信息，点击搜索按钮
    elements = driver.find_elements_by_class_name('title-text')
    elements[1].click()

    # 喜欢读xx的人也喜欢
    pattern = re.compile(
        '<img class="m_sub_img"[\s\S]*?class="">([\s\S]*?)</a>')
    data = re.findall(pattern, driver.page_source)
    driver.close()
    books = []
    # 此循环用来整理数据，将书名两边的空白字符去掉
    for book in data:
        books.append(book.strip())
    books_dict = {
        'book1': books[0],
        'book2': books[1],
        'book3': books[2],
        'book4': books[3],
        'book5': books[4],
        'book6': books[5],
        'book7': books[6],
        'book8': books[7],
        'book9': books[8],
        'book10': books[9],
    }
    return render(request, 'learning_logs/behavior_analysis.html', locals())


@login_required
def behavior_analysis_svg(request):
    return render(request, 'learning_logs/analysis.svg', {})
