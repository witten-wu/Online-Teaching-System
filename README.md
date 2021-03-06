# Online-Teaching-System
### Java Web Project

### Environment
Operate System：Windows7

DataBase：MySQL

web服务器/应用服务器：Tomcat

IDE：Eclipse

### Methodology
#### 2.1.SSM框架简介

##### 2.1.1.	Spring
Spring[1]是一个容器框架，主要做的就是粘合模块组件达到统一管理的目的，它最核心的部分就是控制反转和面向切面。Spring装配Bean并通过在配置文件中设置特定参数从而调用构造方法实例化Java对象，省去了主动new对象这一过程，这就体现了控制反转。面向切面这种编程思想是将行为封装到可重用的模块中，这样编写的代码是松耦合的，代码之间的依赖性降低，这就给程序维护减轻了压力。

##### 2.1.2.	SpringMVC
SpringMVC[2][3]框架是Spring的一部分，Spring作为父容器而SpringMVC是子容器，SpringMVC处于Spring框架的web模块，很好的遵循了MVC模式[4][5]，分离出Controller、Model、View三部分，通过DispatcherServlet这个核心Servlet拦截用户请求，然后转到Controller，通过注入服务实现层和Model层（同时会关联Mapper层）拿到实例化好的Controller方法，再去调用相对应的方法操作数据，返回到View层的JSP[6]里。

##### 2.1.3.	MyBatis
我们可以使用原生的JDBC接口对数据库进行操作，但这样做的缺点在于将SQL语句的编码嵌入在Java[7]代码中，造成了难以维护以及可读性差的弊端，同时频繁进行链接、释放数据库的操作也在一定程度上影响了性能。MyBatis很好的解决了这些问题，由于它封装了JDBC，使用时就无需再进行参数设置、驱动注册、连接配置等繁琐的过程而只需对SQL语句进行编写。它以注解的形式将Statement配置好，通过SQL和Java实体类映射，执行SQL之后将结果映射为Java对象返回。正是这种映射的机制和接口绑定的模式，使得MyBatis简单、高效。

##### 2.1.4.	框架整合运行原理
SSM项目启动时进入web.xml，web.xml依次执行监听器，过滤器，过滤器，接着启动Spring的核心控制器DispatcherServlet，DispatcherServlet拦截请求并匹配到相应的Controller进行处理。运行流程如图所示。

①	JSP通过Ajax异步请求方式提出url请求，传递参数，tomcat进行拦截并提供给DispatcherServlet；

②	DispatcherServlet根据Spring.xml中的配置将请求匹配到控制层处理；

③	为了实例化Controller从而注入ServiceImp，自动装配实现了Service接口，这样通过Service接口注入ServiceImp；

④	在实例化ServiceImp的时候，又需要注入Dao，配置文件ApplicationContext.xml将Dao接口和Mapper.xml联系起来；

⑤	拿到了实例化之后的Controller之后就可以调用对于的方法操作数据了，最后将数据以JSON对象的形式返回到JSP，JSP再解析JSON数据拿到真实数据进行显示。

<img width="471" alt="image" src="https://user-images.githubusercontent.com/38986230/171400215-71249fa5-3fc4-4aa7-ae17-71e14a8c200d.png">


#### 2.2.	JSP
JSP顾名思义就是Java服务器页面，它是一种动态地Web页面技术[8]，它具体是由html[9][10]代码和java代码组成，其中html负责构建页面的静态部分，而java代码很显然是为了处理业务逻辑也就是页面的动态部分。通过JSP标签的形式就可以在JSP文件中嵌入java代码。JSP本质上和Servlet一样，它们都是运行在服务器这一端的，JSP调用遵循Servlet的处理方式，所以我们访问JSP其实就是在访问被服务器翻译过的Servlet。虽然这样会导致第一次访问速度较慢，但之后的访问JSP引擎如果发现JSP没有变化就不会重新加载，而是直接执行，这就大大提升了效率。同时，JSP标签封装了许多功能，可以访问JavaBeans、连接Database，还可以在不同页面间共享参数和传递控制信息。

#### 2.3.	AJAX
AJAX可以异步请求数据，在不重新加载页面的情况下对局部内容进行更新，所以它是为构建动态网页而准备的。它是一种异步的传输模式，何为异步？就是在用户发送请求的同时，可以进行其他的操作而页面不会因为请求数据还未返回而卡死。Ajax的核心对象是XMLHttpRequest（XHR）。XHR提供了发送请求和解析响应这两者的接口，并以异步的方式从服务器获取新的数据。总的来说，JS可以通过调用AJAX这种异步通信传输组件来获取格式化之后的数据并解析以达到局部更新Web内容的效果。

#### 2.4.	Tomcat
Tomcat[11]简单来说就是一个能直接提供Web服务的JSP引擎，它是轻量级的、开源的应用服务器，底层其实就是Socket程序。Servlet用于处理用户从客户端发来的请求，而Tomcat作为JSP和Servlet运行的容器，它的基本作用如图2.2所示。为什么我们要用Tomcat？很显然，作为一个网络服务器，Tomcat的作用就是提供网络服务，我们在Web开发过程中所设计的页面，只有部署到类似于Tomcat这样的服务器上才能支持远程访问，被用户所看到和操作。


#### 2.5.	MySQL
MySQL[12]的突出之处在于它体积小、速度快，并且支持多线程、多用户。它是一种开源式的关系型DMS，开源带来的高效、安全与免费使得它深受IT开发者和中小型企业的喜爱，同时MySQL区别于其他数据库的地方就是它支持插件式的存储引擎。它的工作模式是基于Client/Sever的，即客户/服务端的体系结构，服务端即mysqlld，它运行在MySQL服务器上，监听并处理客户端发送的请求，然后去访问数据库并返回信息。由于是关系型的数据管理系统，MySQL的数据是以数据表的形式存储展现的，若干的表单组成一个Database[13]，这就具有很强的可操作性和管理性。本次在进行数据库设计的时候还使用了与MySQL相配套的可视化应用工具Navicat,极大地简化了数据表的设计过程。

### DataBase Design
ER模型如下：

<img width="460" alt="image" src="https://user-images.githubusercontent.com/38986230/171399576-33d85a45-565b-4afb-b1ec-b1b2ad29a8cf.png">

### Structure Design
本系统采用SSM框架搭建，遵循MVC的开发模式。程序结构目录包含Controller、Service、ServiceImp 、Model、Dao、Mapper，除以以外还包含两个包分别为filter过滤器包和util工具包，View层体现在JSP页面，以下将详细介绍各层作用。

①	Controller控制器层负责业务逻辑的控制处理，它负责处理View层的请求然后调用Service层的接口来控制业务逻辑，将JSP页面的URL请求映射到不同的处理函数，同时获取JSP页面传来的参数，并将参数传给相对应的服务层函数。控制器的使用需要在spring配置文件中进行配置。

②	Service层负责具体的业务实现接口，控制器会调用Service层的接口，具体的内容在ServiceImp中进行定义，而ServiceImp的业务实现，实则还要调用Dao层的接口，这样才能实现整个业务处理过程，并返回结果给Controller层。

③	ServiceImp层主要对Service层的接口进行定义，同时要调用Dao层的接口进行具体的业务处理，从而返回结果。

④	Dao层具体来说就是数据的持久化层，这里是负责与数据库打交道的，一切的数据处理都被封装在Dao层，Dao层会将Mapper.XML文件中对数据库进行具体操作的SQL语句映射成Dao层中的接口，这样通过Dao层来操作数据库。

⑤	Model层将数据库中的表映射成每个实体类，并对实体类中的属性以及操作属性的方法进行定义和实现，有了Model层我们就可以将数据通过Model层中的对象进行临时存储，这样就可以把数据传到Dao层，方便Dao层进行数据的持久化。

⑥	Mapper层是存放XML文件的地方，每个人XML文件中写的就是对数据库进行具体操作的SQL语句，通过对Spring配置文件进行配置，就可以通过Mapper中的XML文件实现对数据库的访问

⑦	View层负责显示JSP页面，由控制层进行控制，耦合度较高，所以可以将二者结合在一起进行开发。

⑧	在SSM项目启动的过程中，会装配过滤器（filter层），只要在web.xml中配置好拦截的请求，过滤器都会对用户的请求做出过滤，限制了用户非正常或违规的请求，而只执行正常操作下的请求。过滤器将用户请求进行拦截处理，它本身并不是Servlet，它只能修改请求或者响应而不能产生一个请求或者响应

⑨	uitl包里面是其他工具类，包括视频文件上传、视频文件转码、发送邮件、返回数据格式处理等工具。方便项目调用uitl包里的工具完成相关功能的实现。


### Technical note
#### tomcat
Tomcat 是Web应用服务器,是一个Servlet/JSP容器. Tomcat 作为Servlet容器,负责处理客户请求,把请求传送给Servlet,并将Servlet的响应传送回给客户
平时开发完JavaWeb应用后，一般都会将JavaWeb应用打包成一个war包，然后将这个war包放到Tomcat服务器的webapps目录下，当Tomcat服务器启动时，就会自动将webapps目录下的war包解压。

#### servlet
编写Servlet通常继承HttpServlet，HttpServlet指能够处理HTTP请求的servlet，然后覆写doGet或doPost方法
针对客户端的多次Servlet请求，通常情况下，服务器只会创建一个Servlet实例对象，也就是说Servlet实例对象一旦创建，它就会驻留在内存中，为后续的其它请求服务，直至web容器退出，servlet实例对象才会销毁。在Servlet的整个生命周期内，Servlet的init方法只被调用一次。而对一个Servlet的每次访问请求都导致Servlet引擎调用一次servlet的service方法。对于每次访问请求，Servlet引擎都会创建一个新的HttpServletRequest请求对象和一个新的HttpServletResponse响应对象，然后将这两个对象作为参数传递给它调用的Servlet的service()方法，service方法再根据请求方式分别调用doXXX方法。

servlet线程安全问题：多个客户端访问同一资源时怎么解决？（见五）
在web.xml中配置servlet
通过ServletConfig获取Servlet的初始化参数
多个Servlet通过ServletContext对象实现数据共享
用servletContext实现请求转发
利用ServletContext对象读取资源文件（也可用类装载器读取资源文件，通过类装载器读取资源文件的注意事项:不适合装载大文件，否则会导致jvm内存溢出）
对于不经常变化的数据，在servlet中可以为其设置合理的缓存时间值，以避免浏览器频繁向服务器发送请求，提升服务器的性能

#### HttpServletResponse
在服务器端，数据是以哪个码表输出的，那么就要控制客户端浏览器以相应的码表打开，比如：outputStream.write("中国".getBytes("UTF-8"));使用OutputStream流向客户端浏览器输出中文，以UTF-8的编码进行输出，此时就要控制客户端浏览器以UTF-8的编码打开，否则显示的时候就会出现中文乱码，那么在服务器端如何控制客户端浏览器以以UTF-8的编码显示数据呢？可以通过设置响应头控制浏览器的行为，例如：response.setHeader("content-type", "text/html;charset=UTF-8");通过设置响应头控制浏览器以UTF-8的编码显示数据。
在开发过程中，如果希望服务器输出什么浏览器就能看到什么，那么在服务器端都要以字符串的形式进行输出。
文件下载（见七）
在JavaWeb开发中，只要是写URL地址，那么建议最好以"/"开头，也就是使用绝对路径的方式，那么这个"/"到底代表什么呢？可以用如下的方式来记忆"/"：如果"/"是给服务器用的，则代表当前的web工程，如果"/"是给浏览器用的，则代表webapps目录

#### 生成验证码（见九）

#### HttpServletRequest
getParameter方法和getParameterValues方法接收表单参数
以POST方式提交表单中文参数的乱码问题：之所以会产生乱码，就是因为服务器和客户端沟通的编码不一致造成的，因此解决的办法是：在客户端和服务器之间设置一个统一的编码，之后就按照此编码进行数据的传输和接收。request.setCharacterEncoding("UTF-8");设置服务器以UTF-8的编码接收数据后，此时就不会产生中文乱码问题了
以GET方式提交表单中文参数的乱码问题：对于以get方式传输的中文数据，通过request.setCharacterEncoding("UTF-8");这种方式是解决不了中文乱码问题。解决办法：在接收到数据后，先获取request对象以ISO8859-1字符编码接收到的原始数据的字节数组，然后通过字节数组以指定的编码构建字符串（见十）
以超链接形式传递中文参数的乱码问题：点击超链接，数据是以get的方式传输到服务器的，所以接收中文数据时也会产生中文乱码问题，而解决中文乱码问题的方式与上述的以get方式提交表单中文数据乱码处理问题的方式一致
Request对象实现请求转发：请求转发：指一个web资源收到客户端请求后，通知服务器去调用另外一个web资源进行处理
请求重定向和请求转发的区别：一个web资源收到客户端请求后，通知服务器去调用另外一个web资源进行处理，称之为请求转发/307；一个web资源收到客户端请求后，通知浏览器去访问另外一个web资源进行处理，称之为请求重定向/302

#### JSP
当访问一个jsp页面时，其实也是在访问一个Servlet，服务器在执行jsp的时候，首先把jsp翻译成一个Servlet，所以我们访问jsp时，其实不是在访问jsp，而是在访问jsp翻译过后的那个Servlet
不管是JSP还是Servlet，虽然都可以用于开发动态web资源。但由于这2门技术各自的特点，在长期的软件实践中，人们逐渐把servlet作为web应用中的控制器组件来使用，而把JSP技术作为数据显示模板来使用。其原因为，程序的数据通常要美化后再输出：让jsp既用java代码产生动态数据，又做美化会导致页面难以维护。让servlet既产生数据，又在里面嵌套html代码美化数据，同样也会导致程序可读性差，难以维护。因此最好的办法就是根据这两门技术的特点，让它们各自负责各的，servlet只负责响应请求产生数据，并把数据通过转发技术带给jsp，数据的显示jsp来做。
每个JSP 页面在第一次被访问时，WEB容器都会把请求交给JSP引擎（即一个Java程序）去处理。JSP引擎先将JSP翻译成一个_jspServlet(实质上也是一个servlet) ，然后按照servlet的调用方式进行调用。由于JSP第一次访问时会翻译成servlet，所以第一次访问通常会比较慢，但第二次访问，JSP引擎如果发现JSP没有变化，就不再翻译，而是直接调用，所以程序的执行效率不会受到影响。
九个内置对象:
page对象表示当前一个JSP页面，可以理解为一个对象本身，即：把一个JSP当作一个对象来看待
out对象用于向客户端发送文本数据。out对象是通过调用pageContext对象的getOut方法返回的，其作用和用法与ServletResponse.getWriter方法返回的PrintWriter对象非常相似。
pageContext对象是JSP技术中最重要的一个对象，它代表JSP页面的运行环境，这个对象不仅封装了对其它8大隐式对象的引用，它自身还是一个域对象(容器)，可以用来保存数据。并且，这个对象还封装了web开发中经常涉及到的一些常用操作，例如引入和跳转其它资源、检索其它域对象中的属性等。当要查找某个属性时，findAttribute方法按照查找顺序"page→request→session→application"在这四个对象中去查找，只要找到了就返回属性值，如果四个对象都没有找到要查找的属性，则返回一个null。
pageContext从字面上的定义，可以发现，是表示一个页面(page)的上下文(Context)，可以表示一个页面中的所有内容。从操作流程图来看，在第一个页面设置的属性经过服务器端跳转到第二个页面以后，在第二个页面是无法取得在第一个页面中设置的属性的，使用了服务器端跳转，但是发现内容并不能取得，证明page范围的属性只能在本页中取得，跳转到其他页面之中不能取得。如果现在希望跳转到其他页面之中，依然可以取得，则可以扩大属性范围，使用request属性范围即可。但是如果，此时使用了超链接的方式传递的话，则属性是无法向下继续传递的。如果还想进一步扩大属性范围，则可以使用session范围属性,session设置的属性不管如何跳转，都可以取得的。当然，session只针对一个用户.这说明了即使是采用客户端跳转，在别的页面依然可以取得第一个页面中设置的session属性。但是，如果，此时新开了一个浏览器，则sessionScopeDemo03.jsp肯定无法取得sessionScopeDemo01.jsp中设置的session对象的属性，因为session只是保留了一个人的信息。如果一个属性想让所有的用户都可以访问，则可以使用最后一种属性范围：application范围。
jsp四种属性范围的使用场合
　　1、request：如果客户向服务器发请求，产生的数据，用户看完就没用了，像这样的数据就存在request域,像新闻数据，属于用户看完就没用的。
　　2、session：如果客户向服务器发请求，产生的数据，用户用完了等一会儿还有用，像这样的数据就存在session域中，像购物数据，用户需要看到自己购物信息，并且等一会儿，还要用这个购物数据结帐。
　　3、application(servletContext)：如果客户向服务器发请求，产生的数据，用户用完了，还要给其它用户用，像这样的数据就存在application(servletContext)域中，像聊天数据。
<jsp:include>标签是动态引入， <jsp:include>标签涉及到的2个JSP页面会被翻译成2个servlet，这2个servlet的内容在执行时进行合并。 而include指令是静态引入，涉及到的2个JSP页面会被翻译成一个servlet，其内容是在源文件级别进行合并。
<jsp:forward>标签用于把请求转发给另外一个资源。
<jsp:param>标签的name属性用于指定参数名，value属性用于指定参数值。在<jsp:include>和<jsp:forward>标签中可以使用多个<jsp:param>标签来传递多个参数。

#### JavaBean
<jsp:useBean>标签：用于在JSP页面中查找或实例化一个JavaBean组件。
<jsp:setProperty>标签：用于在JSP页面中设置一个JavaBean组件的属性。
<jsp:getProperty>标签：用于在JSP页面中获取一个JavaBean组件的属性。

AJAX 是一种与服务器交换数据的技术，可以在不重新载入整个页面的情况下更新网页的一部分。
