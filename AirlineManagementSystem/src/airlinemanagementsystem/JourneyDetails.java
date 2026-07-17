package airlinemanagementsystem;

import javax.swing.*;
import java.awt.*;
import java.sql.*;
import java.awt.event.*;
import net.proteanit.sql.DbUtils;

public class JourneyDetails extends JFrame implements ActionListener {
    JTable table;
    JTextField pnr;
    JButton show;
    
    public JourneyDetails() {
        // Apply System Look and Feel
        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        setTitle("Journey History Details");
        getContentPane().setBackground(new Color(245, 247, 250));
        setLayout(null);
        
        Font labelFont = new Font("Segoe UI", Font.PLAIN, 14);
        Color labelColor = new Color(51, 51, 51);
        
        // Search Input Label
        JLabel lblpnr = new JLabel("Search Booking");
        lblpnr.setFont(labelFont);
        lblpnr.setForeground(labelColor);
        lblpnr.setBounds(50, 30, 120, 25);
        add(lblpnr);
        
        pnr = new JTextField();
        pnr.setBounds(180, 30, 150, 25);
        pnr.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        add(pnr);
        
        // Search Button
        show = new JButton("Search");
        show.setBackground(new Color(28, 54, 115));
        show.setForeground(Color.WHITE);
        show.setFont(new Font("Segoe UI", Font.BOLD, 12));
        show.setBounds(350, 30, 120, 25);
        show.setOpaque(true);
        show.setContentAreaFilled(true);
        show.setBorderPainted(false);
        show.setFocusPainted(false);
        show.addActionListener(this);
        add(show);
        
        // Table
        table = new JTable();
        table.setRowHeight(25);
        table.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        table.setGridColor(new Color(224, 224, 224));
        table.getTableHeader().setFont(new Font("Segoe UI", Font.BOLD, 13));
        table.getTableHeader().setBackground(new Color(28, 54, 115));
        table.getTableHeader().setForeground(Color.WHITE);
        
        JScrollPane jsp = new JScrollPane(table);
        jsp.setBounds(20, 90, 745, 300);
        jsp.getViewport().setBackground(Color.WHITE);
        add(jsp);
        
        setSize(800, 460);
        setLocationRelativeTo(null); // Center on screen
        setVisible(true);
    }
    
    public void actionPerformed(ActionEvent ae) {
        String searchText = pnr.getText().trim();
        if (searchText.isEmpty()) {
            JOptionPane.showMessageDialog(null, "Please enter a PNR, Aadhar Number, or Name", "Validation Error", JOptionPane.ERROR_MESSAGE);
            return;
        }
        
        try {
            Conn conn = new Conn();
            // Allows searching by PNR, Aadhar Number, or Passenger Name (partial matching support)
            String query = "select * from reservation where PNR = '"+searchText+"' or aadhar = '"+searchText+"' or name like '%"+searchText+"%'";
            ResultSet rs = conn.s.executeQuery(query);
            
            if (!rs.isBeforeFirst()) {
                JOptionPane.showMessageDialog(null, "No Booking Information Found", "Not Found", JOptionPane.WARNING_MESSAGE);
                return;
            }
            table.setModel(DbUtils.resultSetToTableModel(rs));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        new JourneyDetails();
    }
}
