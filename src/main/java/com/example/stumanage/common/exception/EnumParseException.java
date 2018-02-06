package com.example.stumanage.common.exception;

/**
 * @author
 * @date 2018/2/13
 */
public class EnumParseException extends CustomException {
	public EnumParseException() {

	}

	public EnumParseException(Class<? extends Enum> enumType,
							  String constantName) {
		super(RestResultEnum.ARGUMENT_ERROR.getKey(), "", new EnumConstantNotPresentException(enumType, constantName));
	}
}
