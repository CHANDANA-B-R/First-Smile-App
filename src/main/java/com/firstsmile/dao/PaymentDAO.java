package com.firstsmile.dao;

import java.util.List;

import com.firstsmile.dto.Payment;

public interface PaymentDAO {
   void addPayment(Payment payment);
   Payment getPaymentById(Integer payment_id);
   List<Payment> getAllPayments();
   void updatePayment(Payment payment);
   void deletePayment(Integer payment_id);
   
}
