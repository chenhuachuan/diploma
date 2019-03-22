package com.jz1501.chenhc.diploma.tfbook.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class TimeFormatUtil {

    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    public static String toFormatDate(Date objDate) {
        return sdf.format(objDate);
    }

    public static java.util.Date toUtilDate(String strDate) {

        java.util.Date utilDate = null;
        try {
            utilDate = sdf.parse(strDate);
        } catch (ParseException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

        return utilDate;
    }

    public static java.sql.Date toSqlDate(String strDate) {

        java.util.Date utilDate = null;
        try {
            utilDate = sdf.parse(strDate);
        } catch (ParseException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

        long time = utilDate.getTime();
        java.sql.Date sqlDate = new java.sql.Date(time);

        return sqlDate;

    }

    public static java.sql.Date toSqlDate(java.util.Date utilDate) {

        long time = utilDate.getTime();
        java.sql.Date sqlDate = new java.sql.Date(time);

        return sqlDate;

    }
}














