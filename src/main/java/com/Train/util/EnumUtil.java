package com.Train.util;
/**
 * 
 * @ClassName: EnumUtil 
 * @Description: 主要定义一些常用的常量 
 */
public class EnumUtil {
	
	
	
	
	
	/**
	 * 分页查询 每页条数
	 */
	public static final int PAGE_SIZE = 10;
	
	/**
	 * 系统错误
	 */
   public static final int SYSTEM_ERROR = -5;
   /**
    * 未知错误
    */
   public static final int UNKOWN_ERROR = -4;
   
   /**
    * 正确
    */
   public static final int OK = 1;
   /**
    * 未登录
    */
   public static final int NOT_LOGIN = -1;
    
   /**
    * 不能为空
    */
   public static final int CAN_NOT_NULL = 100001;
   
   /**
    * 	请求错误，非法请求
    */
   public static final int ERROR = 0;
   
   /**
    * 	校验送检单人登录
    */
   public static final int ADMIN_LOGIN = 101;
   
   /**
    * 	普通人员登录
    */
   public static final int USER_LOGIN = 102;
   /**
    * 设备负责人登录
    */
   public static final int EQUIPMENT_LOGIN = 103;
   /**
    * 用户密码错误
    */
   public static final int PASSWORD_ERROR = 100018;
   
   
}
