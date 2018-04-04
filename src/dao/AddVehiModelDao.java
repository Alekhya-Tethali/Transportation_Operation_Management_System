package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import bean.AddVehiModelbean;
import database.ConnectionFactory;

public class AddVehiModelDao {
	public static boolean insertModel(AddVehiModelbean avmb) {
		boolean avmstatus = false;
		int avmi = 0;
		String vehi_brand_selected;
		String vehi_model, vehi_model_active;
		vehi_brand_selected = avmb.getVehi_brand_selected();
		vehi_model = avmb.getVehi_model();
		vehi_model_active = avmb.getVehi_model_active();
		try {
			Class.forName("org.postgresql.Driver").newInstance();
			Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/TOMS_DB", "postgres",
					"admin");

			System.out.println("Connection Established");
			try {
				PreparedStatement pst = conn
						.prepareStatement("insert into models_mst( brand, model, active) values(?,?,?) ");
				System.out.println("Insertion Statement Executed..");
				pst.setString(1, vehi_brand_selected);
				pst.setString(2, vehi_model);
				pst.setString(3, vehi_model_active);
				System.out.println("pst stmts over");
				avmi = pst.executeUpdate();
				System.out.println("pst executeUpdate over");
			} catch (Exception e) {
				System.out.println("Error in Running insertion Query" + e.getMessage());
			}
			if (avmi > 0) {
				avmstatus = true;
			} else {
				avmstatus = false;
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return avmstatus;
	}
}
