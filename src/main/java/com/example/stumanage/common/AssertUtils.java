package com.example.stumanage.common;


import com.example.stumanage.common.exception.ArgumentErrorException;

import com.example.stumanage.common.exception.RestResultEnum;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.util.Objects;

/**
 * @author
 */
public class AssertUtils {
	/**
	 * 断言字符串不为null且不为空,否则抛出业务异常
	 *
	 * @param text 字符串
	 */
	public static void hasText(String text) {
		hasText(text, RestResultEnum.ARGUMENT_ERROR.getMessage());
	}

	/**
	 * 断言字符串不为null且不为空,否则抛出业务异常
	 *
	 * @param text    字符串
	 * @param message 业务message信息
	 */
	public static void hasText(String text, String message) {
		if (StringUtils.isEmpty(text)) {
			throw new ArgumentErrorException(message);
		}
	}

	/**
	 * 断言不为null，否则抛出异常
	 *
	 * @param obj object
	 */
	public static void nonNull(Object obj) {
		nonNull(obj, RestResultEnum.ARGUMENT_ERROR.getMessage());
	}

	/**
	 * 断言不为null，否则抛出异常
	 *
	 * @param obj     object
	 * @param message 异常message
	 */
	public static void nonNull(Object obj, String message) {
		if (Objects.isNull(obj)) {
			throw new ArgumentErrorException(message);
		}
	}

	/**
	 *  必须为1
	 *  @param
	 * @param i
	 * @param message 异常message
	 */
	public static void nonTrue(Byte i, String message) {
		if (Objects.isNull(i)) {
			throw new ArgumentErrorException(message);
		}
		if (i!= 1){
			throw new ArgumentErrorException(message);
		}
	}

	/**
	 * 断言大于0
	 */
	public static void greaterThanZero(BigDecimal num) {
		greaterThanZero(num, RestResultEnum.ARGUMENT_ERROR.getMessage());
	}

	/**
	 * 断言大于0，否则抛出异常
	 */
	public static void greaterThanZero(BigDecimal num, String message) {
		nonNull(num, message);
		if (num.compareTo(BigDecimal.ZERO) <= 0) {
			throw new ArgumentErrorException(message);
		}
	}

	public static void greaterThanZero(Integer num) {
		greaterThanZero(num, RestResultEnum.ARGUMENT_ERROR.getMessage());
	}

	public static void greaterThanZero(Integer num, String message) {
		nonNull(num, message);
		if (num <= 0) {
			throw new ArgumentErrorException(message);
		}
	}

	public static void greaterThanZero(Long num) {
		greaterThanZero(num, RestResultEnum.ARGUMENT_ERROR.getMessage());
	}

	public static void greaterThanZero(Long num, String message) {
		nonNull(num, message);
		if (num <= 0) {
			throw new ArgumentErrorException(message);
		}
	}
}
