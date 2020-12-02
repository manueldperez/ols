package edu.sdsu.mdperez.dao;
/*package database;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class AddUser {

    public static void createUser() {

        String sql =
                "INSERT INTO users (" +
                "first_name, " +
                "last_name, " +
                "top_notch_member_num, " +
                "library_member_num, " +
                "email, " +
                "overdue_fines, " +
                "materials_overdue_id, " +
                "materials_prev_checked_out_id, " +
                "materials_returned_id) " +
                "VALUES (" +
                "('test'), " +
                "('test'), " +
                "('1'), " +
                "('1'), " +
                "('test@test.com'), " +
                "('0'), " +
                "('1'), " +
                "('2'), " +
                "('3')" +
                ")";

        try (Connection conn = DBConnection.getConnection()) {

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.execute(sql);
            //Statement stmt = conn.createStatement();

            //stmt.executeUpdate("INSERT INTO users (first_name) VALUES (users ('test'))");

        } catch (Exception e) {
            System.err.println(e);
        }

    }

    /*
    INSERT INTO users (
	first_name,
    last_name,
    top_notch_member_num,
    library_member_num,
    email,
    overdue_fines,
    materials_overdue_id,
    materials_prev_checked_out_id,
    materials_returned_id)

VALUES
	(users
    ('Manuel'),
    ('Perez'),
    ('1'),
    ('1'),
    ('mdperez@sdsu.edu'),
    ('0'),
    ('1'),
    ('2'),
    ('3')
    )
     */

//}
