package airlinemanagementsystem;

import javax.swing.*;
import java.awt.*;
import java.sql.*;
import net.proteanit.sql.DbUtils;

public class FlightInfo extends JFrame {
    
    public FlightInfo() {
        // Apply System Look and Feel
        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        setTitle("Flight Information Schedules");
        getContentPane().setBackground(new Color(245, 247, 250));
        setLayout(new BorderLayout()); // Use BorderLayout for standard table wrapping
        
        JTable table = new JTable();
        table.setRowHeight(25);
        table.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        table.setGridColor(new Color(224, 224, 224));
        table.getTableHeader().setFont(new Font("Segoe UI", Font.BOLD, 13));
        table.getTableHeader().setBackground(new Color(28, 54, 115));
        table.getTableHeader().setForeground(Color.WHITE);
        
        try {
            Conn conn = new Conn();
            ResultSet rs = conn.s.executeQuery("select * from flight");
            table.setModel(DbUtils.resultSetToTableModel(rs));
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        JScrollPane jsp = new JScrollPane(table);
        add(jsp, BorderLayout.CENTER);
        
        setSize(800, 500);
        setLocationRelativeTo(null); // Center on screen
        setVisible(true);
    }
    
    public static void main(String[] args) {
        new FlightInfo();
    }
}
