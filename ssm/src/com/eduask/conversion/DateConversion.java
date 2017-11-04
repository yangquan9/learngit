package com.eduask.conversion;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class DateConversion implements Converter<String,Date> {
	public Date convert(String arg0) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		try {
			return sdf.parse(arg0);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
