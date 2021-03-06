package com.yj.yeogiya.common;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;



@ControllerAdvice
public class CommonExceptionAdvice {
	
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(value = HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException ex) {
		
		return "common/404";
	}
	
	@ExceptionHandler(NullPointerException.class)
    public String nullPointerHandle(Exception e) {
         return "common/404";
    }


}
