package com.vanphongpham.service.admin;

import java.sql.SQLException;
import java.util.List;

import com.vanphongpham.model.Bill;
import com.vanphongpham.repository.admin.BillRepository;

public class BillService {
	private BillRepository billRepository;
	private ProductService productService;
	
	public BillService() {
        this.billRepository = new BillRepository();
        this.productService = new ProductService();
    }

    public void addToBill(Bill bill) throws SQLException {
        // Add item to the bill repository
        billRepository.addToBill(bill);
    }
    
    public boolean removeFromBill(int billId) {
    	boolean billDeleted = false;
    	try {
    		billDeleted = billRepository.removeFromBill(billId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return billDeleted;
    }
    
    public List<String> getProductNamesFromIds(String productIdsStr){
    	if(productIdsStr == null) {
    		return null;
    	} 

    	return productService.getProductNamesFromIds(productIdsStr);
    }
     public List<Bill> getAllBills(){
    	 List<Bill> listBills = null;
    	 try {
    		 listBills = billRepository.getAllBills();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return listBills;
     }
    
}
