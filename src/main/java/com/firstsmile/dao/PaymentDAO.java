package com.firstsmile.dao;

import java.util.ArrayList;
import java.util.List;

import com.firstsmile.dto.Payment;

public interface PaymentDAO {
   boolean addPayment(Payment payment);
   ArrayList<Payment> getPaymentById(Integer payment_id);
   ArrayList<Payment> getAllPayments();
   boolean updatePayment(Payment payment);
   boolean deletePayment(Integer payment_id);
   
}
