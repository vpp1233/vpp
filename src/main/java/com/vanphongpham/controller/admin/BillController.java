package com.vanphongpham.controller.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vanphongpham.model.Bill;
import com.vanphongpham.service.admin.BillService;
import com.vanphongpham.service.admin.ProductService;

@WebServlet("/admin/bill")
public class BillController extends HttpServlet{
	private static final long serialVersionUID = -5682945778159712588L;
	private BillService billService;
	private ProductService productService;
	
	public void init() {
		billService = new BillService();
		productService = new ProductService();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "delete":
                	deleteBill(request, response);
                    break;
                case "list":
                	listBill(request, response);
                    break;
                default:
                    listBill(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listBill(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        List<Bill> listBill = billService.getAllBills();
        for (Bill bill : listBill) {
        	String productIds = bill.getProductIds();
        	List<String> productNames = null;
            productNames = productService.getProductNamesFromIds(productIds);
            bill.setProductName(productNames);
		}
        request.setAttribute("listBill", listBill);
        request.getRequestDispatcher("/views/admin/bill/list.jsp").forward(request, response);
    }

    private void deleteBill(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int billId = Integer.parseInt(request.getParameter("billId"));
        billService.removeFromBill(billId);
        response.sendRedirect("bill?action=list");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        doGet(request, response);
    }
}
