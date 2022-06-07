package com.github.yck.connector.util;

import org.junit.Test;

import java.net.HttpURLConnection;

import static org.junit.Assert.*;

public class ResultGeneratorTest {
    @Test
    public void test(){
        Result s = ResultGenerator.getCodeAndResult(HttpURLConnection.HTTP_BAD_METHOD,"For");
        System.err.println(s.toString());
        Result s1 = ResultGenerator.getCodeAndResult(HttpURLConnection.HTTP_ACCEPTED,"success");
        System.err.println(s1.toString());
    }

}