package com.shoppingcart.doa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shoppingcart.model.Order;
import com.shoppingcart.model.Product;

public class OrderDoa {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet res;

	public OrderDoa(Connection con) {
		this.con = con;
	}

	public boolean insertOrder(Order oModel) {
		boolean result = false;

		try {
			query = "INSERT INTO orders(p_id, u_id, o_quantity, o_date) VALUES(?,?,?,?)";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, oModel.getId());
			pst.setInt(2, oModel.getUid());
			pst.setInt(3, oModel.getQuantity());
			pst.setString(4, oModel.getDate());
			pst.executeUpdate();
			result = true;

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

		return result;
	}

	public List<Order> userOrder(int id) {
		List<Order> list = new ArrayList<>();

		try {
			query = "SELECT * FROM orders WHERE u_id = ? ORDER BY orders.o_id DESC";

			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			res = pst.executeQuery();

			while (res.next()) {
				Order order = new Order();
				ProductDoa pDoa = new ProductDoa(this.con);
				int pId = res.getInt("p_id");

				Product product = pDoa.getSingleProduct(pId);
				order.setOrderId(res.getInt("o_id"));
				order.setId(pId);
				order.setName(product.getName());
				order.setCategory(product.getCategory());
				order.setPrice(product.getPrice());
				order.setQuantity(res.getInt("o_quantity"));
				order.setDate(res.getString("o_date"));
				list.add(order);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public void cancelOrder(int id) {
		try {
			query = "DELETE FROM orders WHERE o_id = ?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			pst.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
