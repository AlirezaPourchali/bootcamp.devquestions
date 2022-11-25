# bootcamp.devquestions
just saving the effort



<!DOCTYPE html>
<html>

  <head>
    <title>آزمون ورودی بوت‌کمپ بی‌نهایت (DevOps)</title>
    <meta content="text/html" charset="UTF-8">
    <meta name="fontiran.com:license" content="56AXFY">
    <link rel="shortcut icon" type="image/png" href="/static/images/logo/favicon/favicon-16x16.2-4bcbe4f363d7.png" />
    <meta name="theme-color" content="#09c">
    


  <script>
    /* beautify ignore:start */
    (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);})(window,document,'script','dataLayer','GTM-TDRQP6V');
    /* beautify ignore:end */
  </script>
  
  
  


    <script type="text/javascript" src="/static/vendor_common/common.min.2-ff5d1031dabd.js"></script>
    <link rel="stylesheet" type="text/css" href="/static/vendor/semantic/semantic.rtl.min.2-87f68286e0ba.css" />
    <link rel="stylesheet" type="text/css" href="/static/css/style.2-b80b5257106c.css" />
    <link rel="stylesheet" type="text/css" href="/static/semanticui/style.2-b3ef4156e542.css" />
    <script type="text/javascript" src="/static/js/main.2-d263ad2294d7.js"></script>
    <script src="/static/vendor/prism/prism.min.2-d002bc8c9f64.js" data-manual></script>
    <script type="text/javascript" src="/static/js/notebook.2-0c223d43deb5.js"></script>
    <script type="text/javascript" src="/static/js/markdown-moratab.2-a790c07cd582.js"></script>
    <link rel="stylesheet" type="text/css" href="/static/vendor/prism/prism.2-9a94a084a411.css">
    <link rel="stylesheet" href="/static/vendor/katex/katex.min.2-852d91d247c4.css" />
    <style>
      @page {
        margin: 25mm 20mm;
      }

      @media print {

        pre,
        code {
          white-space: pre-wrap;
          /* Since CSS 2.1 */
          white-space: -moz-pre-wrap;
          /* Mozilla, since 1999 */
          white-space: -o-pre-wrap;
          /* Opera 7 */
          word-wrap: break-word;
          /* Internet Explorer 5.5+ */
        }
      }

      pre {
        background-color: #dce8ec !important
      }
    </style>
  </head>

  <body dir="rtl">
    
  <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-TDRQP6V" height="0" width="0"
    style="display:none;visibility:hidden"></iframe></noscript>


    
      <div class="qu-problem-segment" style="page-break-after: always">
        

<div style="display: none;" id="description_md-148105">*سلیب* که از طراحی سوالات ورودی و خروجی کوئرا خسته شده بود، تصمیم گرفت تا با پیاده‌سازی اسکریپتی این فرآیند طاقت‌فرسا را برای خود سهل کند! ابتدا با ساختار فایل داوری ورودی خروجی آشنا شویم، ساختار فایلی که برای کوئرا مورد پذیرش است، به فرم زیر است:

```
.
├── in
│   ├── input1.txt
│   ├── input2.txt
│   └── &lt;mark class=&quot;red&quot; title=&quot;به تعداد تست کیس‌ها&quot;&gt;...&lt;/mark&gt;
└── out
    ├── output1.txt
    ├── output2.txt
    └── &lt;mark class=&quot;red&quot; title=&quot;به تعداد تست کیس‌ها&quot;&gt;...&lt;/mark&gt;
```

کوئرا برای هر ورودی مثل *i*، محتویات فایل `in/input{i}.txt` را به کد ارسالی کاربر می‌دهد و خروجی را با محتویات فایل `out/output{i}.txt` مقایسه می‌کند و در صورت برابر بودن، نمره را به پاسخ ارسالی کاربر می‌دهد. 

تا پیش‌از این *سلیب* به طور کاملا دستی محتوای تمامی `output{i}.txt` ها را پر می‌کرد، حال از شما می‌خواهد تا اسکریپتی بنویسید که این کار را برای او انجام دهد. او می‌خواهد تا اسکریپت شما با دریافت تعداد ورودی، ورودی‌ها را از فایل مربوطه بخواند و به عنوان ورودی (*stdin*) به برنامه `main.py` دهد و خروجی برنامه را در فایل خروجی مربوط به تست کیس بنویسد. برای درک بهتر مثالی را پیش می‌بریم.

## مثال

برای مثالی با `3` تست کیس، اسکریپت `generator.sh` شما ابتدا در ساختار زیر قرار دارد:

```
├── generator.sh
├── in
│   ├── input1.txt
│   ├── input2.txt
│   └── input3.txt
└── main.py
```
*سلیب* می‌خواهد که وقتی اسکریپت شما را مانند زیر اجرا کند:

```Terminal bash terminal
./generator.sh &lt;mark class=&quot;red&quot; title=&quot;تعداد تست‌کیس‌های موجود&quot;&gt;3&lt;/mark&gt;
```
* خروجی مربوط به ورودی `in/input1.txt` درون فایل `out/output1.txt` ذخیره شود.
* خروجی مربوط به ورودی `in/input2.txt` درون فایل `out/output2.txt` ذخیره شود.
* خروجی مربوط به ورودی `in/input3.txt` درون فایل `out/output3.txt` ذخیره شود.

و در نهایت به ساختار زیر برسیم:

```
.
├── generator.sh
├── in
│   ├── input1.txt
│   ├── input2.txt
│   └── input3.txt
├── main.py
└── out
    ├── output1.txt
    ├── output2.txt
    └── output3.txt
```
## پروژه اولیه

برای دریافت پروژه اولیه  [این لینک](/contest/assignments/44197/download_problem_initial_project/148105/)  را دانلود کنید. درون لینک ساختار فایلی زیر را مشاهده می‌کنید:

```
Test-Generator
├── generator.sh
├── in
│   ├── input1.txt
│   ├── input2.txt
│   └── input3.txt
└── main.py
```

راه‌حل خود را درون فایل `generator.sh` پیاده‌سازی کنید.

## توجه کنید
+ فایل `main.py` صرفا برای تست روی سیستم شخصی‌تان در اختیار شما قرار گرفته و `main.py` روی سیستم داوری خروجی‌های متفاوتی تولید می‌کند.
+ برای اجرای فایل `main.py` باید از دستور زیر استفاده کنید:
```Terminal bash terminal
python3 main.py
```
بنابراین طبق دستور بالا باید نسخه ۳ پایتون را در سیستم شخصی‌تان نصب داشته باشید.
+ در هر تست در سیستم داوری، تعدادی تست‌کیس در دایرکتوری `in/` قرار دارند و تضمین می‌شود که هیچ تست‌کیسی خالی نمی‌باشد.
+ دسترسی اجرا به فایل ارسالی شما به طور خودکار در سیستم داوری داده می‌شود.

## نحوه ارسال

برای ارسال جواب، دستورات خواسته شده را در فایلی با نام `generator.sh` بنویسید و سپس آن را انتخاب و ارسال کنید.</div>
<div>
    <div class="ui center aligned fluid container">
        <h1>تست جنریتور</h1>
    </div>
    <br/>
    <div class="description-html" id="description_html-148105"></div>
</div>

<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
        render_problem_text('description_md-148105', 'description_html-148105');
    });
</script>
      </div>
    
      <div class="qu-problem-segment" style="page-break-after: always">
        

<div style="display: none;" id="description_md-148102">*سلیب* که به تازگی شرکت خود را تاسیس کرده اکنون با چالش جدیدی مواجه شده، مدیریت کارمندان! در حال حاضر او نیاز دارد تا بتواند هرگاه که اراده کرد به هر کارمند خود به عنوان تشویق پاداش بدهد یا اطلاعات تمامی کارمندان ساکن شهر خاصی را ببیند.

*سلیب* اطلاعات تمامی کارمندان خود را در یک فایل با نام `employee.csv` ذخیره کرده که محتوای آن به فرمت زیر است:

```csv employee.csv csv
&lt;mark class=&quot;red&quot; title=&quot;ستون اول: آیدی کارمند&quot;&gt;10012&lt;/mark&gt;,&lt;mark class=&quot;red&quot; title=&quot;ستون دوم: شهر کارمند&quot;&gt;Tehran&lt;/mark&gt;,&lt;mark class=&quot;red&quot; title=&quot;ستون سوم: نام کارمند&quot;&gt;Seyed Ali Babaei&lt;/mark&gt;,&lt;mark class=&quot;red&quot; title=&quot;ستون چهارم شماره کارمند&quot;&gt;09121212121&lt;/mark&gt;,&lt;mark class=&quot;red&quot; title=&quot;ستون پنجم: حقوق کارمند&quot;&gt;4000&lt;/mark&gt;,&lt;mark class=&quot;red&quot; title=&quot;ستون ششم: آدرس کارمند&quot;&gt;Narmak-Kooche-Aval&lt;/mark&gt;
20221,Tehran,Mostafa Karimi,09131313131,3900,Kerman-Kooche-Aval
40521,Semnan,Amin Anvari,09123456789,3800,Piroozi-Kooche-Aval
12140,ALborz,Nima Heydari Nasab,09383838383,4100,Fardis-Kooche-Aval
```

در ستون اول آیدی کارمند، در ستون دوم شهر کارمند، در ستون سوم نام کارمند، در ستون چهارم شماره تلفن کارمند، در ستون پنجم حقوق کارمند و در ستون ششم آدرس کارمند مشاهده می‌شود.

او که چیزی از ترمینال لینوکس و اسکریپت‌نویسی نمی‌داند از شما کمک خواسته تا برای او دو کار زیر را انجام دهید:

+ دستوری با نام `bonus` تعریف کنید تا با دریافت آیدی کارمند، به میزان ۵ درصد حقوق او به او پاداش دهد. یعنی با اجرای دستور زیر:

```Terminal bash terminal
./manager.sh bonus &lt;mark class=&quot;red&quot; title=&quot;آیدی کارمند&quot;&gt;40521&lt;/mark&gt;
```
خروجی زیر مشاهده شود:
```Terminal bash terminal
Amin Anvari will get &lt;mark class=&quot;red&quot; title=&quot;۵ درصد حقوق&quot;&gt;$190&lt;/mark&gt; bonus
```


+ دستوری با نام `city` تعریف کنید تا با دریافت شهر مورد نظر *سلیب*، نام و شماره تلفن تمام کارمندان ساکن آن شهر او را خروجی بدهد. یعنی با اجرای دستور زیر:

```Terminal bash terminal
./manager.sh city &lt;mark class=&quot;red&quot; title=&quot;شهر کارمند&quot;&gt;ALborz&lt;/mark&gt;
```
خروجی زیر مشاهده شود:
```Terminal bash terminal
Customer Name: Nima Heydari Nasab
Mobile No: 09383838383
```
+ در صورتی که پارامتر اول ورودی هیچ‌کدام از دو حالت بالا نبود، اسکریپت باید عبارت `command not found` را چاپ کند.

## مثال

برای مثال اگر اسکریپت شما را مانند زیر اجرا کنیم:

```Terminal bash terminal
./manager.sh bonus 10012
```

باید خروجی زیر را دهد:

```Terminal bash terminal
Seyed Ali Babaei will get $200 bonus
```
یا اگر اسکریپت شما را مانند زیر اجرا کنیم:

```Terminal bash terminal
./manager.sh city Tehran
```

باید خروجی زیر را دهد:

```Terminal bash terminal
Customer Name: Seyed Ali Babaei
Mobile No: 09121212121
Customer Name: Mostafa Karimi
Mobile No: 09131313131
```

## پروژه اولیه

برای دریافت پروژه اولیه  [این لینک](/contest/assignments/44197/download_problem_initial_project/148102/)  را دانلود کنید. درون لینک ساختار فایلی زیر را مشاهده می‌کنید:

```
Employee-Management
├── employee.csv
└── manager.sh
```

راه‌حل خود را درون فایل `manager.sh` پیاده‌سازی کنید.
 

## توجه کنید

+ به تمامی فاصله‌های خالی بین حروف خروجی دقت کنید.
+ اطلاعات مورد نیاز شما در سیستم داوری درون فایل `employee.csv` در کنار اسکریپت شما قرار دارد.
+ دسترسی اجرا به فایل ارسالی شما به طور خودکار در سیستم داوری داده می‌شود.
+ تضمین می‌شود ۵ درصد حقوق کارمندان همواره عددی صحیح است.

## نحوه ارسال

برای ارسال جواب دستورات خواسته شده را درون فایلی با نام `manager.sh` وارد کنید و آن را انتخاب و سپس ارسال کنید.</div>
<div>
    <div class="ui center aligned fluid container">
        <h1>مدیریت کارمندان</h1>
    </div>
    <br/>
    <div class="description-html" id="description_html-148102"></div>
</div>

<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
        render_problem_text('description_md-148102', 'description_html-148102');
    });
</script>
      </div>
    
      <div class="qu-problem-segment" style="page-break-after: always">
        

<div style="display: none;" id="description_md-148100">*سلیب* که به تازگی با داکر آشنا شده قصد دارد تا یک `docker-compose` ابتدایی را طراحی کند. در ادامه به بیان جزئیات کانتینر مورد نظر او می‌پردازیم، به *سلیب* کمک کنید محدویت‌های زیر را در منابع یک *container* داکر *Redis* اضافه کند:

* او می‌خواهد تا *Redis* روی پورت `6379` اجرا شده باشد.
* هرگاه به هردلیلی سرویس *Redis* از کار افتاد، بلافاصله مجددا اجرا شود.
* دارای *Memory Limit*‌ای برابر با `30M` باشد.
* دارای *Memory Reservation*‌ای برابر با `30M` باشد.

برای دانلود پروژه‌ی اولیه روی  [این لینک](/contest/assignments/44197/download_problem_initial_project/148100/)  کلیک کنید.

## نکات تکمیلی

۱. شما اجازه‌ی *build* کردن یک *Image* جدید **نخواهید داشت** و باید از *Imageهای* استاندارد استفاده کنید. به‌طور خاص، برای *Redis* می‌توانید از *Image* با آدرس زیر استفاده کنید:

```
registry.gitlab.com/qio/standard/redis:latest
```
۲. نام *container* باید `redis` باشد.

۳. سیستم داوری کوئرا به‌صورت خودکار فایل `docker-compose.yml` را با کامند زیر اجرا می‌کند. **شما نیازی به کد یا اسکریپتی برای اجرای این کار ندارید.**

```
docker-compose up --no-build -d
```

۴. **توجه داشته باشید** که ورژن `docker-compose.yml` باید `2` باشد.

## نحوه ارسال پاسخ
شما تنها مجاز به ارسال فایل `docker-compose.yml` هستید.

``` yaml docker-compose.yml
version: &quot;2&quot;

# Do not forget that the only available 
# redis image is accessible with the following url:
#  registry.gitlab.com/qio/standard/redis:latest

```</div>
<div>
    <div class="ui center aligned fluid container">
        <h1>ردیس لیمیتر</h1>
    </div>
    <br/>
    <div class="description-html" id="description_html-148100"></div>
</div>

<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
        render_problem_text('description_md-148100', 'description_html-148100');
    });
</script>
      </div>
    
      <div class="qu-problem-segment" style="page-break-after: always">
        

<div style="display: none;" id="description_md-148104">در تیم زیرساخت دیجی‌کال‍ا، میکروسرویس‌های مختلفی در حال پدید آمدن هستند. برخی از این میکروسرویس‌ها قرار است تنها برای کاربران برخی از کشورها در دسترس باشند. سالار که وظیفه‌ی مدیریت درخواست‌های ورودی از کشورهای مختلف را برعهده دارد، لیستی از بازه‌های آی‌پی‌های کشورهای مدنظرش جمع‌آوری کرده است. او اکنون از شما می‌خواهد اسکریپتی برای او بنویسید که با استفاده از آن بتوان درخواست‌های ورودی از کشورهای مختلف را مسدود یا آزاد کرد.

# جزئیات پروژه

پروژه‌ی اولیه را از  [این لینک](/contest/assignments/44197/download_problem_initial_project/148104/)  دانلود کنید.

ساختار فایل‌های پروژه به‌صورت زیر است:

```
country-manager
├── ip_lists
│   ├── AG.txt
│   ├── CC.txt
│   └── IR.txt
└── country_manager.sh
```
اسکریپت `country_manager.sh` را مطابق توضیحات زیر پیاده‌سازی کنید:

+ نحوه‌ی اجرای اسکریپت به‌صورت `./country_manager.sh command ip_list_filepath` است. مثال:
```terminal bash terminal
./country_manager.sh block ./ip_lists/CC.txt
```
+ اگر تعداد آرگومان‌های ورودی اسکریپت کمتر از ۲ تا (یکی برای `command` و یکی برای `ip_list_filepath`) بود، اسکریپت باید عبارت `not enough arguments` را چاپ کند و متوقف شود.
+ اگر مقدار `command` برابر با `block` یا `unblock` نبود، اسکریپت باید عبارت `invalid command` را چاپ کند و متوقف شود.
+ اگر فایلی که مسیر آن به‌عنوان آرگومان دوم وارد می‌شود وجود نداشت، اسکریپت باید عبارت `ip list file not found` را چاپ کند و متوقف شود.
+ اگر مقدار `command` برابر با `block` باشد، اسکریپت باید لیست بازه‌های آی‌پی موجود در فایل را دریافت کند و درخواست‌های ورودی مربوط به این آی‌پی‌ها را به‌ازای همه‌ی پروتکل‌ها و پورت‌ها `DROP` کند. اگر *rule* مربوط به `ACCEPT` کردن این درخواست‌ها از قبل موجود بود، اسکریپت باید آن‌ها را حذف کند.
+ اگر مقدار `command` برابر با `unblock` باشد، اسکریپت باید لیست بازه‌های آی‌پی موجود در فایل را دریافت کند و درخواست‌های ورودی مربوط به این آی‌پی‌ها را به‌ازای همه‌ی پروتکل‌ها و پورت‌ها `ACCEPT` کند. اگر *rule* مربوط به `DROP` کردن این درخواست‌ها از قبل موجود بود، اسکریپت باید آن‌ها را حذف کند.

# نکات

+ عملیات مسدودسازی و آزادسازی درخواست‌ها باید با استفاده از `iptables` انجام شود.
+ داوری این سؤال کمی بیشتر از سایر سؤالات طول می‌کشد.
+ بازه‌های آی‌پی طبق نگارش *CIDR* هستند.
+ تضمین می‌شود که هیچ *rule* ای خارج از اسکریپت اضافه نمی‌شود.

# آن‌چه باید آپلود کنید

پس از پیاده‌سازی موارد خواسته‌شده، فایل `country_manager.sh` را آپلود کنید.</div>
<div>
    <div class="ui center aligned fluid container">
        <h1>کشورداری</h1>
    </div>
    <br/>
    <div class="description-html" id="description_html-148104"></div>
</div>

<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
        render_problem_text('description_md-148104', 'description_html-148104');
    });
</script>
      </div>
    
      <div class="qu-problem-segment" style="page-break-after: always">
        

<div style="display: none;" id="description_md-148103">روزی روزگاری، *محمد* از دست گیت‌لب به کفر آمد و تصمیم گرفت تا سرویسی برای شرکت در همین زمینه راه‌اندازی کند ولی به دلیل خستگی زیاد از شما خواسته تا به او در راستای این هدف کمک کنید.

در این تمرین، ما از شما می‌خواهیم یک سرویس `gitea` را تنظیم و راه‌اندازی کنید. برای دانلود پروژه‌ اولیه روی  [این لینک](/contest/assignments/44197/download_problem_initial_project/148103/)  کلیک کنید.

## جزئیات پروژه

* سرویس `gitea` شما باید روی پورت `3000` اجرا شده باشد.
* دیتای سرویس `gitea` نباید به هیچ عنوان از بین برود (یعنی اگر به هر دلیلی سرویس ها متوقف شدند، نباید **هیچ دیتایی** از دست رفته باشد.).
* اگر سیستم به هر دلیلی با مشکلی مواجه شد، باید سرویس `gitea` بلافاصله مجددا  اجرا شود. 
* پورت `ssh` سرویس برای *محمد* اهمیتی ندارد، برای اطمینان می‌توانید از پورت `222` استفاده کنید.
* باید *id* کاربر و *id* گروهی که به دستورات `gitea` دسترسی دارند برابر با `1000` باشد.
* نام کانتینری که سرویس `gitea` را اجرا می‌کند باید برابر با `gitea` باشد.

## نکات تکمیلی

۱. شما تمامی تغییرات خود را درون فایل `docker-compose.yml` اعمال کنید. شما تنها مجاز به ارسال این فایل خواهید بود و با دستور زیر فایل ارسالی شما درون سیستم داوری اجرا خواهد شد:

```
docker-compose up --no-build -d
```

پس از اجرای دستور بالا باید تمامی سرویس‌های مورد نظر شما تنظیم و راه‌اندازی و اماده تست کردن باشند.

۲. شما تنها مجاز به استفاده از ایمیج‌های موجود در [این لینک](https://gitlab.com/qio/standard/container_registry) هستید و می‌توانید هر تعداد سرویس که نیاز دارید تنظیم و راه‌اندازی کنید تا به خواسته مسئله برسید. توجه داشته باشید که **شما مجاز به استفاده از ایمیج‌های دیگر نیستید و فقط می‌تونید از مجموعه ایمیج‌های موجود در همین ایمیج‌رجیستری استفاده کنید.**	

۳. شما اجازه‌ی *build* کردن یک *Image* جدید **نخواهید داشت** و باید از *Imageهای* استاندارد کوئرا استفاده کنید. به‌طور خاص، برای *gitea* می‌توانید از *Image* با آدرس زیر استفاده کنید:

```
registry.gitlab.com/qio/standard/gitea:1.16.8
```
۴. در صورت نیاز به دیتابیس، از ایمیج‌های زیر نیز می‌توانید استفاده کنید:
```
registry.gitlab.com/qio/standard/mysql:8.0
registry.gitlab.com/qio/standard/postgres:14.1
registry.gitlab.com/qio/standard/postgres:14.1-alpine
```

### ارسال فایل‌های اضافی
توجه کنید که هر فایل و محتوای دیگری به جز `docker-compose.yml` که در فایل ارسالی شما قرار داشته باشد حذف خواهد شد.

در صورتی که نیاز دارید که فایلی علاوه‌بر `docker-compose.yml` به سیستم داوری کوئرا ارسال کرده و در راه‌حل خود از آن‌ها استفاده کنید، می‌توانید از پوشه‌ی `data` استفاده کنید. برای این کار کافیست که پوشه‌ای به نام `data` در کنار `docker-compose.yml` ایجاد کرده و برای سیستم داوری کوئرا ارسال نمایید.
```
services:
  sample_container:
    volumes:
      - ./data/extrafile:/extrafile
```

فراموش نکنید که در این حالت، فایل `extrafile` که *volume* شده است را درون پوشه‌ی `data` قرار داده و آن را برای سیستم داوری ارسال نمایید. برای مثال، پوشه‌ی ارسالی شما برای داوری کوئرا به شکل زیر می‌تواند باشد:

```
.
├── data
│   └── extrafile
└── docker-compose.yml
```
**توجه:** سیستم داوری کوئرا به‌صورت خودکار فایل `docker-compose.yml` را با کامند `up` اجرا می‌کند. شما نیازی به کد یا اسکریپتی برای اجرای این کار ندارید.

**توجه:** استفاده کردن از پوشه‌ی `data`، کاملاً به خواست شما بوده و ممکن است این سؤال بدون نیاز به استفاده از پوشه‌ی `data` حل شود.

## نحوه ارسال پاسخ
شما تنها مجاز به تغییر در فایل `docker-compose.yml` هستید و در صورت نیاز در کنار آن می‌توانید پوشه‌ای با نام `data` نیز قرار داده و ارسال نمایید. تمامی فایل‌ها یا پوشه‌های دیگر حذف خواهند شد!</div>
<div>
    <div class="ui center aligned fluid container">
        <h1>سرویس گیت</h1>
    </div>
    <br/>
    <div class="description-html" id="description_html-148103"></div>
</div>

<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
        render_problem_text('description_md-148103', 'description_html-148103');
    });
</script>
      </div>
    
      <div class="qu-problem-segment" style="page-break-after: always">
        

<div style="display: none;" id="description_md-148101">**این سؤال تنها با زبان‌های _PHP_ ، _Python_ ، _Go_ و _JS (Node.js)_ قابل حل است.**

---

دیجی‌کال‍ا قصد دارد برای بخش تحویل محصولات خود یک سامانه‌ی ساده‌ی ثبت پیشنهادات و انتقادات راه‌اندازی کند. از شما می‌خواهیم یک *API* برای این سامانه طراحی کنید.

# جزئیات پروژه

پروژه‌ی اولیه را از  [این لینک](/contest/assignments/44197/download_problem_initial_project/148101/)  دانلود کنید.

در این سؤال، یک *REST API* شامل *endpoint* های زیر باید پیاده‌سازی شود:

| آدرس                      |                   عنوان |
| :------------------------ | ----------------------: |
| `GET /`       |  بررسی *up* بودن سرویس |
| `POST /signup`      | ثبت‌نام |
| `POST /login`  | ورود به حساب کاربری |
| `POST /suggestions`       | درج پیشنهاد یا انتقاد |
| `GET /suggestions`      |  دریافت لیست پیشنهادات و انتقادات |

در این *API* هر کاربر باید یک توکن داشته باشد. این توکن برای هر کاربر ثابت است.

%align_right_start%

## *endpoint* های موردنیاز

%align_end%

**در همه‌ی _endpoint_ ها، پاسخ باید به‌صورت _JSON_ باشد.**

اطلاعات ورودی به‌صورت `application/x-www-form-urlencoded` به *endpoint* ها ارسال می‌شوند.

### بررسی *up* بودن سرویس

پاسخ این *endpoint* باید به‌صورت زیر باشد:

+ کد وضعیت: `200`
+ بدنه: `{&quot;ok&quot;:true}`

### ثبت‌نام

دو پارامتر `username` و `password` باید به این *endpoint* ارسال شوند. در صورتی که حداقل یکی از این پارامترها ارسال نشده باشد یا برابر با رشته‌ی خالی باشد، پاسخ باید به‌صورت زیر باشد:

+ کد وضعیت: `400`
+ بدنه: `{&quot;ok&quot;:false,&quot;error&quot;:&quot;no username or password provided&quot;}`

اگر کاربری با نام کاربری واردشده از قبل موجود باشد، پاسخ باید به‌صورت زیر باشد:

+ کد وضعیت: `400`
+ بدنه: `{&quot;ok&quot;:false,&quot;error&quot;:&quot;user already exists&quot;}`

در غیر این‌صورت، کاربر باید ساخته شود، یک توکن یکتا برایش تولید شود و پاسخ به‌صورت زیر باشد:

+ کد وضعیت: `201`
+ بدنه: `{&quot;ok&quot;:true,&quot;token&quot;:&quot;&lt;mark title=&quot;توکن کاربر&quot;&gt;USER_TOKEN&lt;/mark&gt;&quot;}`

### ورود به حساب کاربری

دو پارامتر `username` و `password` باید به این *endpoint* ارسال شوند. در صورتی که حداقل یکی از این پارامترها ارسال نشده باشد یا برابر با رشته‌ی خالی باشد، پاسخ باید به‌صورت زیر باشد:

+ کد وضعیت: `400`
+ بدنه: `{&quot;ok&quot;:false,&quot;error&quot;:&quot;no username or password provided&quot;}`

اگر نام کاربری یا رمز عبور نادرست باشد، پاسخ باید به‌صورت زیر باشد:

+ کد وضعیت: `400`
+ بدنه: `{&quot;ok&quot;:false,&quot;error&quot;:&quot;invalid username or password&quot;}`

در غیر این‌صورت، پاسخ باید به‌صورت زیر باشد:

+ کد وضعیت: `200`
+ بدنه: `{&quot;ok&quot;:true,&quot;token&quot;:&quot;&lt;mark title=&quot;توکن کاربر&quot;&gt;USER_TOKEN&lt;/mark&gt;&quot;}`

### درج پیشنهاد یا انتقاد

این *endpoint* نیازمند *authentication* است. در ریکوئست ارسالی مقدار هدر `Authorization` باید برابر با توکن کاربر باشد (**بدون `Bearer` یا موارد مشابه**).

پارامتر `text` (متن پیشنهاد یا انتقاد) باید به این *endpoint* ارسال شود. در صورتی که این پارامتر ارسال نشده باشد یا برابر با رشته‌ی خالی باشد، پاسخ باید به‌صورت زیر باشد:

+ کد وضعیت: `400`
+ بدنه: `{&quot;ok&quot;:false,&quot;error&quot;:&quot;no text provided&quot;}`

در غیر این‌صورت، پیشنهاد یا انتقاد باید ثبت شود و پاسخ به‌صورت زیر باشد:

+ کد وضعیت: `201`
+ بدنه: `{&quot;ok&quot;:true}`

### دریافت لیست پیشنهادات و انتقادات

این *endpoint* باید لیست پیشنهادات و انتقادات ثبت‌شده در سامانه را در قالب یک لیست برگرداند. این لیست شامل پیشنهادات و انتقادات ثبت‌شده توسط همه‌ی کاربران است.

+ کد وضعیت: `200`
+ مثالی از پاسخ:
```json
[
    {
        &quot;user&quot;: &quot;username1&quot;,
        &quot;text&quot;: &quot;sample suggestion 1&quot;
    },
    {
        &quot;user&quot;: &quot;username2&quot;,
        &quot;text&quot;: &quot;sample suggestion 2&quot;
    }
]
```

# نکات تکمیلی

&lt;details class=&quot;blue&quot;&gt;
&lt;summary&gt;
نصب نیازمندی‌ها و اجرا
&lt;/summary&gt;
برای حل این سؤال می‌توانید از هر زبان و هر تکنولوژی‌ای که می‌خواهید استفاده کنید. به‌صورتی که در یک پوشه به نام `api` کد برنامه را نوشته و در فایلی به نام `runner.sh` که توسط `sh` اجرا می‌شود، باید برنامه‌ی خود را اجرا کنید. توجه کنید که حتماً باید `Dockerfile` مربوط به پروژه‌ی خود را برای ما ارسال کنید.

در پروژه‌ی اولیه، ۴ داکرفایل برای `php`، `python`، `golang` و `node` قرار دادیم که می‌توانید از آن‌ها مستقیماً استفاده کنید. در صورتی که از یکی از این زبان‌ها برای حل سؤال استفاده می‌کنید، کافیست که `Dockerfile` مربوط به آن را در پوشه‌ی `api` کپی کنید و طبق توضیحات داده شده، سؤال را حل کنید. برای نصب نیازمندی‌های پایتون از `requirements.txt`، برای پی‌اچ‌پی از `composer.json`، برای گولنگ از `go.mod` و برای نودجی‌اس از `package.json` استفاده کنید.

در صورتی که زبان مورد استفاده‌ی شما، چیزی به جز این ۴ مورد است، باید خودتان داکرفایلی در پوشه‌ی `api`  به‌شکلی بنویسید که بتواند نیازمندی‌های پروژه‌ی شما را نصب کرده و برنامه‌ی شما را مانند داکرفایل‌های موجود اجرا کند.

&lt;/details&gt;

+ نیازی به *persistent* بودن داده‌ها نیست!
+ سیستم داوری `docker-compose.yml` زیر را خارج از فولدر `api` پاسخ شما قرار می‌دهد و با دستور `docker-compose up --build` آن را اجرا می‌کند.

```yaml docker-compose.yml
version: &quot;3&quot;

services:
  api:
    build: &quot;./api&quot;
    container_name: &quot;api&quot;
    ports:
      - &quot;80:80&quot;
```
+ شما مجاز به تغییر یا ارسال `docker-compose.yml` دلخواه نیستید.
+ سرویس شما باید روی پورت `80` آدرس `localhost` قابل دسترسی باشد.
+ توصیه می‌کنیم در `runner.sh` خود *API*تان را روی `0.0.0.0:80` اجرا کنید.

&lt;details class=&quot;green&quot;&gt;
&lt;summary&gt;
تغییر `Dockerfile`
&lt;/summary&gt;

امکان تغییر فایل `Dockerfile` وجود ندارد، اما در اسکریپت `runner.sh` می‌توانید هر دستوری را اجرا کنید.
&lt;/details&gt;

## نحوه ارسال پاسخ
شما می‌توانید تمامی محتوای موجود در پوشه‌ی `api` را تغییر دهید و هر فایلی که می‌خواهید اضافه یا کم کنید.
```text
api
├── &lt;mark class=&quot;purple&quot; title=&quot;نام این فایل اهمیتی ندارد&quot;&gt; api.py &lt;/mark&gt;  # or main.go somefile.js anyfile.php name.any ...
├── Dockerfile
├── requirements.txt  # or go.mod package.json composer.json
└── runner.sh
```


توجه کنید که نام فایل کد شما برای سیستم داوری اهمیتی ندارد و این خود شما هستید که در `runner.sh` از نام آن برای اجرای پروژه استفاده می‌کنید.

در نهایت این پوشه را _zip_ کرده و ارسال کنید. توجه کنید که پس از _extract_ کردن فایل _zip_ شما، باید پوشه‌ی `api` را ببینیم که درون آن `Dockerfile` وجود دارد.</div>
<div>
    <div class="ui center aligned fluid container">
        <h1>سامانه ثبت پیشنهادات و انتقادات</h1>
    </div>
    <br/>
    <div class="description-html" id="description_html-148101"></div>
</div>

<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
        render_problem_text('description_md-148101', 'description_html-148101');
    });
</script>
      </div>
    
    <script>
      document.addEventListener('DOMContentLoaded', function() {
        // open all <details> tags
        $('details').attr('open', '');
        // print!
        window.print();
      });
    </script>
  </body>
