package com.example.stumanage.common.exception;

import com.example.stumanage.common.RestResultEnum;

/**
 * 参数错误异常
 *
 * @author Zi Lai Ye
 * @date 2016/12/2
 */
public class ArgumentErrorException extends CustomException {
	public ArgumentErrorException() {

	}

	public ArgumentErrorException(String desc) {
		super(RestResultEnum.ARGUMENT_ERROR.getKey(), desc, new IllegalArgumentException(desc));
	}
}
