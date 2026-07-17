package net.proteanit.sql;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.Vector;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;

/**
 * Custom implementation of net.proteanit.sql.DbUtils to avoid external broken/untrusted JAR dependency.
 */
public class DbUtils {
    
    /**
     * Converts a JDBC ResultSet into a TableModel suitable for JTable.
     *
     * @param rs The ResultSet to convert.
     * @return TableModel containing the metadata and data from the ResultSet.
     */
    public static TableModel resultSetToTableModel(ResultSet rs) {
        try {
            ResultSetMetaData metaData = rs.getMetaData();
            int numberOfColumns = metaData.getColumnCount();
            Vector<String> columnNames = new Vector<String>();

            // Get the column names from metaData
            for (int column = 1; column <= numberOfColumns; column++) {
                columnNames.add(metaData.getColumnLabel(column));
            }

            // Get all rows
            Vector<Vector<Object>> rows = new Vector<Vector<Object>>();
            while (rs.next()) {
                Vector<Object> newRow = new Vector<Object>();
                for (int columnIndex = 1; columnIndex <= numberOfColumns; columnIndex++) {
                    newRow.add(rs.getObject(columnIndex));
                }
                rows.add(newRow);
            }

            return new DefaultTableModel(rows, columnNames);
        } catch (Exception e) {
            e.printStackTrace();
            return new DefaultTableModel();
        }
    }
}
