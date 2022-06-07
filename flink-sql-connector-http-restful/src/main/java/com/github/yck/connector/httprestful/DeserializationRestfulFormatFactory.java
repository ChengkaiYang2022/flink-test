package com.github.yck.connector.httprestful;

import org.apache.flink.annotation.PublicEvolving;
import org.apache.flink.api.common.serialization.DeserializationSchema;
import org.apache.flink.table.data.RowData;
import org.apache.flink.table.factories.DecodingFormatFactory;
@PublicEvolving
public interface DeserializationRestfulFormatFactory extends DecodingFormatFactory<DeserializationRestfulSchema> {
}
