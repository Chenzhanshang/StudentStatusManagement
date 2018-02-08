package com.example.stumanage.common;


import com.example.stumanage.common.exception.RestResultEnum;

/**
 * 标准返回体 Created by zhangzenke on 2016/11/16.
 */
public class ResponseResult<T> {

	private static final int SUCCESS_CODE = 200;

	private int code;
	private String message;
	private T data;

	public ResponseResult() {
		this.code = SUCCESS_CODE;
	}

	public ResponseResult(int code, String message) {
		this.code = code;
		this.message = message;
	}

	public ResponseResult(RestResultEnum restResultInfoEnum) {
		this.code = restResultInfoEnum.getKey();
		this.message = restResultInfoEnum.getMessage();
	}


	public ResponseResult(RestResultEnum restResultInfoEnum, T data) {
		this.code = restResultInfoEnum.getKey();
		this.message = restResultInfoEnum.getMessage();
		this.data = data;
	}


	public ResponseResult(T data) {
		this.code = SUCCESS_CODE;
		this.data = data;
	}

	public ResponseResult(int code, String message, T data) {
		this.code = code;
		this.message = message;
		this.data = data;
	}

	public static int getSuccessCode() {
		return SUCCESS_CODE;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
}
