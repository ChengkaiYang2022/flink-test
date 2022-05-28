package com.yck;

import org.apache.flink.calcite.shaded.com.google.common.io.Resources;

import java.io.IOException;
import java.net.URL;
import java.nio.charset.Charset;

public class FlinkTableTools {
    public static String getTableDDL(String path){
        String strings = "";
        URL url = Resources.getResource(path);
        try {
            strings = Resources.toString(url, Charset.forName("UTF-8"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return strings;
    }
}
