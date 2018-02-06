package com.example.stumanage.common.exception;

import com.example.stumanage.common.RestResultEnum;

/**
 * 自定义异常封装类,用于转换异常 Created by fengqiang on 2016/11/16.
 */
public class CustomException extends RuntimeException {

	private int code;
	private String desc;

	public CustomException() {
	}

	public CustomException(int code, String desc, Throwable throwable) {
		super(throwable);
		this.code = code;
		this.desc = desc;
	}

	public CustomException(RestResultEnum customExceptionEnum, String desc, Throwable throwable) {
		super(throwable);
		this.code = customExceptionEnum.getKey();
		this.desc = desc;
	}

	public CustomException(RestResultEnum customExceptionEnum, Throwable throwable) {
		super(throwable);
		this.code = customExceptionEnum.getKey();
		this.desc = customExceptionEnum.getMessage();
	}


	public CustomException(RestResultEnum customExceptionEnum) {
		this.code = customExceptionEnum.getKey();
		this.desc = customExceptionEnum.getMessage();
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
}
