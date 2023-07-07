# Online-Teaching-System
### Java Web Project

### Environment
Operate System：Windows7

DataBase：MySQL

web服务器/应用服务器：Tomcat

IDE：Eclipse

### Object
本项目旨在将传统的线下培训搬到线上，依据当下比较流行的云课堂思维模式，设计一款在线培训的web系统。系统主要分为三种用户，分别为学员、教师和管理员，用例图如下

<img src="https://github.com/witten-wu/Online-Teaching-System/assets/38986230/a006caa5-82a1-403a-817b-8ea014338cc9"  width="300" height="200">

<img src="https://github.com/witten-wu/Online-Teaching-System/assets/38986230/70a533ac-455f-4f46-a9fc-b60e92234a51"  width="300" height="200">

<img src="https://github.com/witten-wu/Online-Teaching-System/assets/38986230/f6ef66ae-fb23-4e71-9370-d9657b7d1c77"  width="300" height="200">


### DataBase Design
#### ER模型如下：

<img src="https://github.com/witten-wu/Online-Teaching-System/assets/38986230/083d79e4-1271-4a0b-ae48-93618d551d53"  width="600" height="300">


#### 数据表设计: 参考本项目目录下sql脚本文件train.sql


### Methodology
本系统将Spring、SpringMVC、Mybatis三种框架进行整合为SSM框架：

#### SSM框架简介

##### Spring
Spring[1]是一个容器框架，主要做的就是粘合模块组件达到统一管理的目的，它最核心的部分就是控制反转和面向切面。Spring装配Bean并通过在配置文件中设置特定参数从而调用构造方法实例化Java对象，省去了主动new对象这一过程，这就体现了控制反转。面向切面这种编程思想是将行为封装到可重用的模块中，这样编写的代码是松耦合的，代码之间的依赖性降低，这就给程序维护减轻了压力。

##### SpringMVC
SpringMVC[2][3]框架是Spring的一部分，Spring作为父容器而SpringMVC是子容器，SpringMVC处于Spring框架的web模块，很好的遵循了MVC模式[4][5]，分离出Controller、Model、View三部分，通过DispatcherServlet这个核心Servlet拦截用户请求，然后转到Controller，通过注入服务实现层和Model层（同时会关联Mapper层）拿到实例化好的Controller方法，再去调用相对应的方法操作数据，返回到View层的JSP[6]里。

##### MyBatis
我们可以使用原生的JDBC接口对数据库进行操作，但这样做的缺点在于将SQL语句的编码嵌入在Java[7]代码中，造成了难以维护以及可读性差的弊端，同时频繁进行链接、释放数据库的操作也在一定程度上影响了性能。MyBatis很好的解决了这些问题，由于它封装了JDBC，使用时就无需再进行参数设置、驱动注册、连接配置等繁琐的过程而只需对SQL语句进行编写。它以注解的形式将Statement配置好，通过SQL和Java实体类映射，执行SQL之后将结果映射为Java对象返回。正是这种映射的机制和接口绑定的模式，使得MyBatis简单、高效。

#### Structure Design
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

### Webpage Preview

<img src="https://github.com/witten-wu/Online-Teaching-System/assets/38986230/bc6e5fd6-24b3-4a09-b497-fd0e913d36d0"  width="600" height="400">

<img src="https://github.com/witten-wu/Online-Teaching-System/assets/38986230/90b6e5d4-6514-485d-88db-fc91333fa0b4"  width="500" height="350">

<img src="https://github.com/witten-wu/Online-Teaching-System/assets/38986230/1ee11dfe-6992-447f-8dce-194a44848e49"  width="500" height="350">

<img src="https://github.com/witten-wu/Online-Teaching-System/assets/38986230/a34c0e6b-4408-4051-b5f7-98e84b63b0d4"  width="400" height="200">

<img src="https://github.com/witten-wu/Online-Teaching-System/assets/38986230/8f2fc75e-4031-45f8-b027-4479370da871"  width="400" height="200">

