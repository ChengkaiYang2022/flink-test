package com.github.yck.connector.util;

import java.io.IOException;

import static org.junit.Assert.*;

public class FlinkHttpServiceTest {

    @org.junit.Test
    public void run() {
        System.out.println("s");
        FlinkHttpService ht = new FlinkHttpService("/flink/table1", 8080);
        try {
            ht.run();
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("s");

    }
}