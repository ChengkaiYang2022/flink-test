package com.github.yck.connector.httprestful;

import org.apache.flink.api.common.serialization.DeserializationSchema;
import org.apache.flink.table.data.RowData;
import org.apache.flink.types.RowKind;
import org.apache.flink.util.Collector;

import java.io.IOException;
import java.util.List;

public interface DeserializationRestfulSchema extends DeserializationSchema<RowData> {
    RowData deserializeSingleJsonStringWithRowKind(byte[] message,RowKind rowKind) throws IOException;
    List<RowData> deserializeJsonListWithRowKind(byte[] message, RowKind rowKind);
}
