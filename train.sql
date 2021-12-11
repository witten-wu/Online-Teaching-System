/*
Navicat MySQL Data Transfer

Source Server         : wyd
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : train

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-06-09 14:21:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `cId` int(20) NOT NULL AUTO_INCREMENT,
  `cName` varchar(20) NOT NULL,
  `cDescription` varchar(300) DEFAULT NULL,
  `cTeacher` varchar(20) NOT NULL,
  `cPath` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '算法导论', '本课程全面地介绍了计算机算法，涵盖的内容有：算法在计算中的作用，概率分析和随机算法的介绍。专门讨论了线性规划，介绍了动态规划的两个应用，随机化和线性规划技术的近似算法等，还有有关递归求解、快速排序中用到的划分方法与期望线性时间顺序统计算法，以及对贪心算法元素的讨论。', 'WYD', '/upload/image/64691526782505344.jpg');
INSERT INTO `course` VALUES ('2', '计算机网络', '计算机网络，是指将地理位置不同的具有独立功能的多台计算机及其外部设备，通过通信线路连接起来，在网络操作系统，网络管理软件及网络通信协议的管理和协调下，实现资源共享和 [1]  信息传递的计算机系统。', 'WYD', '/upload/image/86971526617207684.jpg');
INSERT INTO `course` VALUES ('3', 'JavaWeb', 'JavaWeb，是用Java技术来解决相关web互联网领域的技术总和。web包括：web服务器和web客户端两部分。Java在客户端的应用有java applet，不过使用得很少，Java在服务器端的应用非常的丰富，比如Servlet，JSP和第三方框架等等。Java技术对Web领域的发展注入了强大的动力。', 'YGC', '/upload/image/40701526544024169.jpg');
INSERT INTO `course` VALUES ('4', 'Python', 'Python具有丰富和强大的库。它常被昵称为胶水语言，能够把用其他语言制作的各种模块（尤其是C/C++）很轻松地联结在一起。常见的一种应用情形是，使用Python快速生成程序的原型（有时甚至是程序的最终界面），然后对其中有特别要求的部分，用更合适的语言改写，比如3D游戏中的图形渲染模块，性能要求特别高，就可以用C/C++重写，而后封装为Python可以调用的扩展类库。', 'LY', '/upload/image/12871526544030024.jpg');
INSERT INTO `course` VALUES ('5', 'AI', '人工智能是计算机科学的一个分支，它企图了解智能的实质，并生产出一种新的能以人类智能相似的方式做出反应的智能机器，该领域的研究包括机器人、语言识别、图像识别、自然语言处理和专家系统等。人工智能从诞生以来，理论和技术日益成熟，应用领域也不断扩大，可以设想，未来人工智能带来的科技产品，将会是人类智慧的“容器”。人工智能可以对人的意识、思维的信息过程的模拟。人工智能不是人的智能，但能像人那样思考、也可能超过人的智能。', 'YGC', '/upload/image/59921526544036091.jpg');
INSERT INTO `course` VALUES ('6', 'Database', '数据库(Database)是按照数据结构来组织、存储和管理数据的仓库，它产生于距今六十多年前，随着信息技术和市场的发展，特别是二十世纪九十年代以后，数据管理不再仅仅是存储和管理数据，而转变成用户所需要的各种数据管理的方式。数据库有很多种类型，从最简单的存储有各种数据的表格到能够进行海量数据存储的大型数据库系统都在各个方面得到了广泛的应用。', 'WYD', '/upload/image/30251526544047546.jpg');
INSERT INTO `course` VALUES ('7', '计算机组成原理', '主要介绍了计算机的各子系统（包括运算器、存储器、控制器、外部设备和输入输出子系统等）的基本组成原理、设计方法、相互关系以及各子系统互相连接构成整机系统的技术。', 'WYD', '/upload/image/1051526782253705.jpg');
INSERT INTO `course` VALUES ('8', 'C', 'C语言是一门通用计算机编程语言，应用广泛。C语言的设计目标是提供一种能以简易的方式编译、处理低级存储器、产生少量的机器码以及不需要任何运行环境支持便能运行的编程语言。', 'XZ', '/upload/image/12871526544056803.jpg');
INSERT INTO `course` VALUES ('9', 'Linux', 'Linux是一套免费使用和自由传播的类Unix操作系统，是一个基于POSIX和UNIX的多用户、多任务、支持多线程和多CPU的操作系统。它能运行主要的UNIX工具软件、应用程序和网络协议。它支持32位和64位硬件。Linux继承了Unix以网络为核心的设计思想，是一个性能稳定的多用户网络操作系统。', 'CCG', '/upload/image/87241526544061917.jpg');
INSERT INTO `course` VALUES ('14', 'Computer Science', '计算机科学与技术包括计算机硬件、软件与应用的基本理论、基本知识和基本技能与方法', 'WYD', '/upload/image/30291526544067142.jpg');
INSERT INTO `course` VALUES ('15', 'JAVA', 'Java是一门面向对象编程语言，不仅吸收了C++语言的各种优点，还摒弃了C++里难以理解的多继承、指针等概念，因此Java语言具有功能强大和简单易用两个特征。Java语言作为静态面向对象编程语言的代表，极好地实现了面向对象理论，允许程序员以优雅的思维方式进行复杂的编程。', 'YGC', '/upload/image/8101526544017878.jpg');
INSERT INTO `course` VALUES ('23', 'OS', '操作系统是用户和计算机的接口，同时也是计算机硬件和其他软件的接口。操作系统的功能包括管理计算机系统的硬件、软件及数据资源，控制程序运行，改善人机界面，为其它应用软件提供支持，让计算机系统所有资源最大限度地发挥作用，提供各种形式的用户界面，使用户有一个好的工作环境，为其它软件的开发提供必要的服务和相应的接口等。', 'DJP', '/upload/image/45491526544052126.jpg');
INSERT INTO `course` VALUES ('24', 'C++', 'C++是C语言的继承，它既可以进行C语言的过程化程序设计，又可以进行以抽象数据类型为特点的基于对象的程序设计，还可以进行以继承和多态为特点的面向对象的程序设计。', 'ZLQ', '/upload/image/77841526544011016.jpg');
INSERT INTO `course` VALUES ('26', '数据结构', '数据结构是计算机存储、组织数据的方式。数据结构是指相互之间存在一种或多种特定关系的数据元素的集合。通常情况下，精心选择的数据结构可以带来更高的运行或者存储效率。数据结构往往同高效的检索算法和索引技术有关。', 'YGC', '/upload/image/29921526782965094.jpg');

-- ----------------------------
-- Table structure for `fileupdate`
-- ----------------------------
DROP TABLE IF EXISTS `fileupdate`;
CREATE TABLE `fileupdate` (
  `fileId` int(20) NOT NULL AUTO_INCREMENT,
  `titleOrig` varchar(100) DEFAULT NULL,
  `titleAlter` varchar(50) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `path` varchar(200) DEFAULT NULL,
  `uploadTime` timestamp(6) NULL DEFAULT NULL,
  `cid` int(20) DEFAULT NULL,
  `cname` varchar(100) DEFAULT NULL,
  `cdescription` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fileupdate
-- ----------------------------
INSERT INTO `fileupdate` VALUES ('91', '04连接查询(内连接)', '68691526805384369', '37.12MB', '.wmv', '/upload/68691526805384369.flv', '2018-05-20 16:36:56.290000', '6', '连接查询', '连接查询是关系数据库中最主要的查询，主要包括内连接、外连接和交叉连接等。通过连接运算符可以实现多个表查询。连接是关系数据库模型的主要特点，也是它区别于其它类型数据库管理系统的一个标志。 在关系数据库管理系统中，表建立时各数据之间的关系不必确定，常把一个实体的所有信息存放在一个表中。当检索数据时，通过连接操作查询出存放在多个表中的不同实体的信息。连接操作给用户带来很大的灵活性，他们可以在任何时候增加新的数据类型。为不同实体创建新的表，然后通过连接进行查询。');
INSERT INTO `fileupdate` VALUES ('94', '09联合查询(orderby)', '15241526815486412', '13.21MB', '.wmv', '/upload/15241526815486412.flv', '2018-05-20 19:24:57.549000', '6', '联合查询', '联合查询是可合并多个相似的选择查询的结果集。等同于将一个表追加到另一个表，从而实现将两个表的查询组合到一起，使用谓词为UNION或UNION ALL。');
INSERT INTO `fileupdate` VALUES ('95', '18.递归算法与递归算法应用', '18471526815964551', '157.47MB', '.mp4', '/upload/18471526815964551.flv', '2018-05-20 19:34:52.449000', '1', '递归算法与应用', '递归算法（英语：recursion algorithm）在计算机科学中是指一种通过重复将问题分解为同类的子问题而解决问题的方法。递归式方法可以被用于解决很多的计算机科学问题，因此它是计算机科学中十分重要的一个概念。绝大多数编程语言支持函数的自调用，在这些语言中函数可以通过调用自身来进行递归。计算理论可以证明递归的作用可以完全取代循环，因此在很多函数编程语言（如Scheme）中习惯用递归来实现循环。');
INSERT INTO `fileupdate` VALUES ('99', '12触发器(使用)', '55821526819958810', '17.43MB', '.wmv', '/upload/55821526819958810.flv', '2018-05-20 20:39:33.946000', '6', '触发器', '触发器（trigger）是SQL server 提供给程序员和数据分析员来保证数据完整性的一种方法，它是与表事件相关的特殊的存储过程，它的执行不是由程序调用，也不是手工启动，而是由事件来触发，比如当对一个表进行操作（ insert，delete， update）时就会激活它执行。触发器经常用于加强数据的完整性约束和业务规则等。 触发器可以从 DBA_TRIGGERS ，USER_TRIGGERS 数据字典中查到。SQL3的触发器是一个能由系统自动执行对数据库修改的语句。');
INSERT INTO `fileupdate` VALUES ('100', '14子查询(表子查询)', '80881526820013245', '26.56MB', '.wmv', '/upload/80881526820013245.flv', '2018-05-20 20:40:40.902000', '6', '子查询', '在SQL语言中，一个SELECT-FROM-WHERE语句称为一个查询块。当获得一个查询的答案需要多个步骤的操作，首先必须创建一个查询来确定用户不知道但包含在数据库中的值，将一个查询块嵌套在另一个查询块的WHERE字句或HAVING短语的条件中查询块称为子查询或内层查询。上层的查询块曾为父查询或外层查询。子查询的结果作为输入传递回“父查询”或“外部查询”。父查询将这个值结合到计算中，以便确定最后的输出。');
INSERT INTO `fileupdate` VALUES ('101', '20范式(3NF)', '83071526820130638', '32.77MB', '.wmv', '/upload/83071526820130638.flv', '2018-05-20 20:42:46.665000', '6', '范式（3NF）', '范式是符合某一种级别的关系模式的集合。构造数据库必须遵循一定的规则。在关系数据库中，这种规则就是范式。关系数据库中的关系必须满足一定的要求，即满足不同的范式');
INSERT INTO `fileupdate` VALUES ('102', '22函数(作用域)', '17771526820335510', '24.18MB', '.wmv', '/upload/17771526820335510.flv', '2018-05-20 20:46:04.651000', '6', '函数（作用域）', '例如求和，取最大值这些函数');
INSERT INTO `fileupdate` VALUES ('103', '26高级数据查询(select选项)', '92291526820453378', '17.03MB', '.wmv', '/upload/92291526820453378.flv', '2018-05-20 20:47:49.320000', '6', '高级数据查询（select选项）', '复杂的条件或多表联合查询');
INSERT INTO `fileupdate` VALUES ('104', '27数据备份与还原(单表数据备份)', '11671526820523934', '57.26MB', '.wmv', '/upload/11671526820523934.flv', '2018-05-20 20:49:34.290000', '6', '数据备份与还原（单表数据备份）', '数据备份属于数据容灾保护中的内容，所有的数据备份系统设计都基于这五个元素，备份源、备份目标、传输网络、备份引擎和备份策略。用户按照需要制定备份策略，使用定时任务执行备份脚本，使用备份引擎将需要备份的的数据从备份源通过传输网络传送到备份目标。');
INSERT INTO `fileupdate` VALUES ('105', '02springmvc架构-mvc设计模式在bs系统下的应用', '9021526820781495', '18.69MB', '.avi', '/upload/9021526820781495.flv', '2018-05-20 20:53:19.549000', '3', '02springmvc架构-mvc设计模式在bs系统下的应用', 'MVC全名是Model View Controller，是模型(model)－视图(view)－控制器(controller)的缩写，一种软件设计典范，用一种业务逻辑、数据、界面显示分离的方法组织代码，将业务逻辑聚集到一个部件里面，在改进和个性化定制界面及用户交互的同时，不需要重新编写业务逻辑。MVC被独特的发展起来用于映射传统的输入、处理和输出功能在一个逻辑的图形化用户界面的结构中。');
INSERT INTO `fileupdate` VALUES ('106', '08springmvc入门程序-注解映射器和适配器配置', '62281526820821892', '19.67MB', '.avi', '/upload/62281526820821892.flv', '2018-05-20 20:53:56.449000', '3', '08springmvc入门程序-注解映射器和适配器配置', '在springmvc中除了核心控制器DispatcherServlet这个核心组件之外，还有在springmvc中的处理器映射器和适配器，这两个组件在springmvc整个的运行流程之中扮演一个很重要的角色，至于映射器和适配器这两个组件他们的功能，我们可以这样理解，映射器主要是跟我我们在浏览器上输入的url来映射对应的Handle,具体的映射规则需要根据使用哪一个映射器来决定，而适配器主要是决定调用哪个Handler来实现具体的业务逻辑');
INSERT INTO `fileupdate` VALUES ('107', '10springmvc入门程序-前端控制器源代码分析', '20921526820917423', '21.10MB', '.avi', '/upload/20921526820917423.flv', '2018-05-20 20:55:30.050000', '3', '10springmvc入门程序-前端控制器源代码分析', 'SpringMVC是一个基于DispatcherServlet的MVC框架，每个请求最先访问的是DispatcherServlet，DispatcherServlet负责将每一个Request转发到相应的Handler，Handler处理后再返回相应的模型（Model）和视图（View）。在使用注解的Spring MVC中，处理器Handler是基于@Controller和@RequestMapping两个注解的，这两个注解可以提供非常灵活的匹配和处理方式。');
INSERT INTO `fileupdate` VALUES ('108', '12springmvc和mybaits整合-整合思路', '79761526820987076', '15.29MB', '.avi', '/upload/79761526820987076.flv', '2018-05-20 20:56:45.878000', '3', '12springmvc和mybaits整合-整合思路', 'MyBatis-Spring 会帮助你将 MyBatis 代码无缝地整合到 Spring 中。 使用这个类库中的类, Spring 将会加载必要的 MyBatis 工厂类和 session 类。 这个类库也提供一个简单的方式来注入 MyBatis 数据映射器和 SqlSession 到业务层的 bean 中。 而且它也会处理事务, 翻译 MyBatis 的异常到 Spring 的 DataAccessException 异常(数据访问异常,译者注)中。最终,它并 不会依赖于 MyBatis,Spring 或 MyBatis-Spring 来构建应用程序代码。');
INSERT INTO `fileupdate` VALUES ('109', '16mybatis开发dao方法-原始dao开发方法', '42851526821154848', '19.82MB', '.avi', '/upload/42851526821154848.flv', '2018-05-20 20:59:35.503000', '3', '16mybatis开发dao方法-原始dao开发方法', 'MyBatis是对JDBC的封装,使开发人员只需关注SQL本身,而不需花费过多的精力去处理如注册驱动、设置参数、创建Connection/Statement、解析结果集等JDBC过程性代码.MyBatis基于XML/注解的方式配置Statement,执行SQL,并将执行结果映射成Java对象, 大大降低了数据库开发的难度.');
INSERT INTO `fileupdate` VALUES ('110', '18mybatis开发dao方法-mapper代理开发方法-开发规范', '4331526821197477', '18.79MB', '.avi', '/upload/4331526821197477.flv', '2018-05-20 21:00:15.071000', '3', '18mybatis开发dao方法-mapper代理开发方法-开发规范', 'Mapper 接口方法名和 UserMapper.xml 中定义的每个 sql 的 id 同名。\r\nMapper 接口方法的输入参数类型和 UserMapper.xml 中定义的 sql 的parameterType 类型相同。\r\nMapper 接口的返回类型和 UserMapper.xml 中定义的 sql 的 resultType 类型相同');
INSERT INTO `fileupdate` VALUES ('111', '24SqlMapConfig-mapper加载', '60731526821253858', '14.70MB', '.avi', '/upload/60731526821253858.flv', '2018-05-20 21:01:06.241000', '3', '24SqlMapConfig-mapper加载', 'MyBatis 的核心配置文件SqlMapConfig.xml');
INSERT INTO `fileupdate` VALUES ('112', '6-顺序统计和中值', '5771526822861147', '146.20MB', '.mp4', '/upload/5771526822861147.mp4', '2018-05-20 21:27:41.148000', '1', '顺序统计和中值', '本章所讨论的问题是在一个由n个不同数值构成的集合中选择第i个顺序统计量问题。主要讲的内容是如何在线性时间内O(n)时间内在集合S中选择第i小的元素，最基本的是选择集合的最大值和最小值。一般情况下选择的元素是随机的，最大值和最小值是特殊情况，书中重点介绍了如何采用分治算法来实现选择第i小的元素，并借助中位数进行优化处理，保证最坏保证运行时间是线性的O(n)。');
INSERT INTO `fileupdate` VALUES ('113', '8-全域HASH', '96911526827214508', '169.25MB', '.mp4', '/upload/96911526827214508.mp4', '2018-05-20 22:40:14.509000', '1', '全域HASH', '设U为键的全域，H是哈希的有限集，H里面的每个哈希函数h将集合U映射到哈希表的m个位置上，如果哈希表满足：对于U里面的两个值x,y x≠y {h∈H：h（x）=h（y）}=|H|/m，那么H就是全域的。\r\n|H|的意思是指全域哈希函数的个数，那么从里面任意取一个函数h，这个函数把x和y哈希到同一个位置的概率就是1/m，也就是说，这些函数都是均匀函数。');
INSERT INTO `fileupdate` VALUES ('114', '9-二叉树', '86831526827288642', '165.16MB', '.mp4', '/upload/86831526827288642.mp4', '2018-05-20 22:41:28.642000', '1', '二叉树', '二叉树在图论中是这样定义的：二叉树是一个连通的无环图，并且每一个顶点的度不大于3。有根二叉树还要满足根结点的度不大于2。有了根结点之后，每个顶点定义了唯一的父结点，和最多2个子结点。然而，没有足够的信息来区分左结点和右结点。如果不考虑连通性，允许图中有多个连通分量，这样的结构叫做森林。');
INSERT INTO `fileupdate` VALUES ('116', '22函数(作用域)', '62871527748187538', '24.18MB', '.wmv', '/upload/62871527748187538.flv', '2018-05-31 14:30:13.838000', '27', 'hjhgja', 'asdfasfs');

-- ----------------------------
-- Table structure for `question`
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `questionid` int(10) NOT NULL AUTO_INCREMENT,
  `question` varchar(500) DEFAULT NULL,
  `answer` varchar(500) DEFAULT NULL,
  `stuid` int(10) DEFAULT NULL,
  `tecid` int(10) DEFAULT NULL,
  PRIMARY KEY (`questionid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('18', '请问SESSION的工作原理是什么？', 'session启动的时候被分配到一个专有的session id .服务器为其分配一块内存 .浏览器将其写入Cookie.\n服务器中的一进程会监视该session id，当它超时或者关闭时候释放内存.当浏览器连入服务器时，\n会在Cookie中寻找该session id.并判断该id是否有效.有效就去读取其中的值.无效重新建立一个session id', '20144482', '666');
INSERT INTO `question` VALUES ('20', '同步和异步的区别？', '同步是阻塞模式，异步是非阻塞模式。\n同步就是指一个进程在执行某个请求的时候，若该请求需要一段时间才能返回信息，那么这个进程将会一直等待下去，直到收到返回信息才继续执行下去；\n异步是指进程不需要一直等下去，而是继续执行下面的操作，不管其他进程的状态。当有消息返回时系统会通知进程进行处理，这样可以提高执行的效率。', '20144482', '666');
INSERT INTO `question` VALUES ('22', 'Java 中 sleep 方法和 wait 方法的区别？', null, '20144482', '777');
INSERT INTO `question` VALUES ('23', '我们能创建一个包含可变对象的不可变对象吗？', null, '20144482', '777');

-- ----------------------------
-- Table structure for `title`
-- ----------------------------
DROP TABLE IF EXISTS `title`;
CREATE TABLE `title` (
  `titleid` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `option_a` varchar(50) NOT NULL,
  `option_b` varchar(50) NOT NULL,
  `option_c` varchar(50) NOT NULL,
  `option_d` varchar(50) NOT NULL,
  `option_r` varchar(50) NOT NULL,
  `cid` int(20) NOT NULL,
  `ccid` int(20) NOT NULL,
  PRIMARY KEY (`titleid`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of title
-- ----------------------------
INSERT INTO `title` VALUES ('28', '表单中的数据要提交到到哪里处理由表单的（）属性指定', 'method', 'name', 'action', '以上都不对', 'C', '3', '105');
INSERT INTO `title` VALUES ('29', '当发布Web应用程序时，通常把Web应用程序的目录及文件放到Tomcat的（）目录下', 'work', 'temp', 'webapps', 'conf', 'C', '3', '105');
INSERT INTO `title` VALUES ('30', '下面不属于JSP指令的是：（）', 'include', 'import', 'page', 'taglib', 'B', '3', '105');
INSERT INTO `title` VALUES ('31', '使用response对象进行重定向时，使用的方法是（）', 'getAttribute', 'setContentType', 'setAttribute', 'sendRedirect', 'D', '3', '105');
INSERT INTO `title` VALUES ('32', 'session对象中用于设定指定名字的属性值，并且把它存储在session对象中的方法是（）', 'setAttribute', 'getAttributeNames', 'getValue', 'getAttribute', 'A', '3', '105');
INSERT INTO `title` VALUES ('33', '一般来讲下列语言属于人工智能语言的是（）', 'VJ', 'C#', 'Foxpro', 'LISP', 'D', '5', '95');
INSERT INTO `title` VALUES ('34', '专家系统是一个复杂的智能软件，它处理的对象是用符号表现的知识，处理的过程是（）的过程', '思考', '回溯', '推理', '递归', 'C', '5', '95');
INSERT INTO `title` VALUES ('35', '我国学者吴文俊院士在人工智能的（）领域做出了卓越贡献', '机器证明', '模式识别', '人工神经网络', '智能代理', 'A', '5', '95');
INSERT INTO `title` VALUES ('36', 'Prolog语言的三种基本语句是（）', '顺序；循环；分支', '陈述；询问；感叹', '事实；规则；询问', '肯定；疑问；感叹', 'C', '5', '95');
INSERT INTO `title` VALUES ('37', '下述（）不是人工智能中常用的知识格式化表示方法', '框架表示法', '产生式表示法', '语义网络表示法', '形象描写表示法', 'D', '5', '95');
INSERT INTO `title` VALUES ('38', '下列不属于触发器的特点是（）', '与表相关联', '自动激活触发器', '不能直接调用和作为事务的一部分', '确保数据安全性', 'C', '6', '94');
INSERT INTO `title` VALUES ('39', '关系模型中的关系模式至少是（）', '1NF', '2NF', '3NF', 'BCNF', 'A', '6', '94');
INSERT INTO `title` VALUES ('40', '在数据模型的三要素中，数据的约束条件规定数据及其联系的（）', '动态特性', '制约和依存规则', '静态特性', '数据结构', 'B', '6', '94');
INSERT INTO `title` VALUES ('41', '事务日志的用途是（）', '事务处理', '数据恢复', '完整性约束', '安全性控制', 'B', '6', '94');
INSERT INTO `title` VALUES ('42', '多值依赖的毛病在于（）', '插入异常', '删除异常', '数据冗余太大', '插入异常,删除异常,数据冗余太大', 'C', '6', '94');
INSERT INTO `title` VALUES ('68', '要保证数据库的数据独立性，需要修改的是', '模式与外模式', '模式与内模式', '三级模式之间的两层映射', '三层模式', 'C', '6', '91');
INSERT INTO `title` VALUES ('69', '概念模型是现实世界的第一层抽象，这一类模型中最著名的模型是', '层次模型', '关系模型', '网状模型', '以上都有', 'D', '6', '91');
INSERT INTO `title` VALUES ('70', '（）的存取路径对用户透明，从而具有更高的数据独立性、更好的安全保密性，也简化了程序员的工作和数据库开发建立的工作', '网状模型', '关系模型', '层次模型', '以上都有', 'B', '6', '91');
INSERT INTO `title` VALUES ('71', '关系数据模型是目前最重要的一种数据模型，它的三个要素分别是', '实体完整性、参照完整性、用户自定义完整性', '数据结构、关系操作、完整性约束', '数据增加、数据修改、数据查询', '外模式、模式、内模式', 'B', '6', '91');
INSERT INTO `title` VALUES ('72', '要保证数据库的逻辑数据独立性，需要修改的是', '模式与外模式之间的映射', '模式与内模式之间的映射', '模式', '三级模式', 'A', '6', '91');
INSERT INTO `title` VALUES ('73', '下面列出的数据库管理的三个阶段中，没有专门的软件对数据进行管理的是: I．人工管理阶段 II．文件系统阶段 III．数据库阶段', 'I 和 II', '只有 II', 'II 和 III', '只有 I', 'D', '6', '99');
INSERT INTO `title` VALUES ('74', '数据库（DB）、数据库系统（DBS）和数据库管理系统（DBMS）三者之间的关系是（）', 'DBS包括DB和DBMS', 'DBMS包括DB和DBS', 'DB包括DBS和DBMS', 'DBS包括DB，也就是DBMS', 'A', '6', '99');
INSERT INTO `title` VALUES ('75', '下述（）不是DBA数据库管理员的职责', '完整性约束说明', '定义数据库模式', '数据库安全', '数据库管理系统设计', 'D', '6', '99');
INSERT INTO `title` VALUES ('76', '数据库的概念模型独立于（）', '具体的机器和DBMS', 'E-R图', '信息世界', '现实世界', 'A', '6', '99');
INSERT INTO `title` VALUES ('77', '数据管理技术的发展过程中，经历了人工管理阶段、文件系统阶段和数据库系统阶段。在这几个阶段中，数据独立的最高的是（）阶段', '数据库系统', '文件系统', '人工管理', '数据项管理', 'A', '6', '99');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL COMMENT '用户id',
  `password` varchar(20) NOT NULL COMMENT '用户登录密码',
  `uname` varchar(20) DEFAULT NULL,
  `grade` int(11) NOT NULL DEFAULT '0' COMMENT '用户权限（管理员为1，游客为0，干事为2，会员为3，部长为4，副部长为5，社长为6）',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('110', '110', null, '0');
INSERT INTO `user` VALUES ('333', '333', 'XZ', '1');
INSERT INTO `user` VALUES ('444', '444', 'CCG', '1');
INSERT INTO `user` VALUES ('555', '555', 'DJP', '1');
INSERT INTO `user` VALUES ('666', '666', 'YGC', '1');
INSERT INTO `user` VALUES ('777', '777', 'WYD', '1');
INSERT INTO `user` VALUES ('888', '888', 'LY', '1');
INSERT INTO `user` VALUES ('999', '999', 'ZLQ', '1');
INSERT INTO `user` VALUES ('3349', '3349', null, '2');
INSERT INTO `user` VALUES ('20144482', '025458', null, '0');
INSERT INTO `user` VALUES ('20144496', '060011', null, '0');
INSERT INTO `user` VALUES ('20144508', '184414', null, '0');
INSERT INTO `user` VALUES ('20144768', '950830', null, '0');

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `uid` int(11) NOT NULL COMMENT '用户id',
  `username` varchar(15) DEFAULT '未知' COMMENT '用户名',
  `gender` varchar(2) DEFAULT '未知' COMMENT '用户性别',
  `academy` varchar(10) DEFAULT '未知' COMMENT '所属学院',
  `headImgUrl` varchar(50) DEFAULT '0' COMMENT '头像',
  `phonenumber` varchar(20) DEFAULT '未知' COMMENT '用户电话',
  `email` varchar(30) DEFAULT '未知' COMMENT '用户邮箱',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('20144482', '吴一都', '男', 'CS', '0', '15025355327', 'm18852592121@163.com');
INSERT INTO `userinfo` VALUES ('20144496', '朱绍铨', '男', 'CS', '0', '13333333333', '未知');
INSERT INTO `userinfo` VALUES ('20144508', '丁玉杨', '男', '计算机学院', '0', '18102384502', '未知');
INSERT INTO `userinfo` VALUES ('20144768', '刘怡', '女', '计算机学院', '0', '15213144942', '15213144942@163.com');

-- ----------------------------
-- Table structure for `user_course`
-- ----------------------------
DROP TABLE IF EXISTS `user_course`;
CREATE TABLE `user_course` (
  `ucid` int(20) NOT NULL AUTO_INCREMENT,
  `uid` int(20) NOT NULL,
  `cid` int(20) NOT NULL,
  `score` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ucid`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_course
-- ----------------------------
INSERT INTO `user_course` VALUES ('30', '20144768', '5', '80');
INSERT INTO `user_course` VALUES ('31', '20144768', '6', '60');
INSERT INTO `user_course` VALUES ('34', '20144496', '5', '40');
INSERT INTO `user_course` VALUES ('36', '20144496', '6', '40');
INSERT INTO `user_course` VALUES ('37', '20144508', '6', '40');
INSERT INTO `user_course` VALUES ('38', '20144508', '3', '90');
INSERT INTO `user_course` VALUES ('48', '20144482', '3', '60');
INSERT INTO `user_course` VALUES ('67', '20144482', '1', null);
INSERT INTO `user_course` VALUES ('73', '20144482', '5', '80');
INSERT INTO `user_course` VALUES ('77', '20144482', '6', '60');
