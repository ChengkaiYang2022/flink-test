package com.github.yck.connector.util;

import java.io.IOException;

public class Test {
    public static void main(String[] args) {
        FlinkHttpService ht = new FlinkHttpService("/flink/table1", 8080);
        try {
            ht.run();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
