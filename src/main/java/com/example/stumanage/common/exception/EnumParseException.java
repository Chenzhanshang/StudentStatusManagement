package com.example.stumanage.common.exception;

import com.example.stumanage.common.RestResultEnum;

/**
 * @author Zi Lai Ye
 * @date 2016/12/3
 */
public class EnumParseException extends CustomException {
	public EnumParseException() {

	}

	public EnumParseException(Class<? extends Enum> enumType,
							  String constantName) {
		super(RestResultEnum.ARGUMENT_ERROR.getKey(), "", new EnumConstantNotPresentException(enumType, constantName));
	}
}
