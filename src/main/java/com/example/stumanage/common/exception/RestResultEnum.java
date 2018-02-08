package com.example.stumanage.common.exception;

/**
 * 自定义异常枚举类
 */
public enum RestResultEnum {

	SUCCESS(200, "操作成功"),
	UNKNOWN_ERROR(-1, "未知异常错误"),
	NOT_FOUND_ERROR(-2, "请求地址不存在"),
	FORBIDDEN_ERROR(-3, "没有相关操作权限"),
	ARGUMENT_ERROR(-4, "请求参数错误"),
    NOT_FOUND_TASK_ERROR(-6,"没有找到说操作的任务,请刷新重试"),
	FILE_EXPORT_ERROR(-8, "导出文件错误"),
	FILE_DELETED_ERROR(-9, "删除文件错误"),
	FILE_DOWNLOAD_ERROR(-11, "文件下载错误"),
	AUTH_ERROR(-12,"没有登陆，没有身份信息");

	private int key;
	private String message;

	RestResultEnum(int key, String message) {
		this.key = key;
		this.message = message;
	}

	public int getKey() {
		return key;
	}

	public void setKey(int key) {
		this.key = key;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
