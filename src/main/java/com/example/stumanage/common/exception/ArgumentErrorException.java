package com.example.stumanage.common.exception;

/**
 * 参数错误异常
 */
public class ArgumentErrorException extends CustomException {
	public ArgumentErrorException() {

	}

	public ArgumentErrorException(String desc) {
		super(RestResultEnum.ARGUMENT_ERROR.getKey(), desc, new IllegalArgumentException(desc));
	}
}
