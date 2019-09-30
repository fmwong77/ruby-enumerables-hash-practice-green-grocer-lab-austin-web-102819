def consolidate_cart(cart)
 organized_cart = {}
  count = 0
  cart.each do |element|
    element.each do |fruit, hash|
      organized_cart[fruit] ||= hash
      organized_cart[fruit][:count] ||= 0
      organized_cart[fruit][:count] += 1
    end
  end
  organized_cart
end

def apply_coupons(cart, coupons)
  item = ""
  discounted_cart = cart
  new_coupon_hash = {:price => 0, :clearance => true, :count => 0}
  coupons.each do |coupon|  
    if cart.key?(coupon[:item])    
      item = "#{coupon[:item]} W/COUPON" 
      if cart[coupon[:item]][:count] >= coupon[:num]
        new_coupon_hash[:price] = '%.2f' % (coupon[:cost] / coupon[:num])      
        new_coupon_hash[:count] = coupon[:num]
        cart[coupon[:item]][:count] -= coupon[:num]
        cart[item] = new_coupon_hash
      end
      
      #puts element[:item]  
    end    
  end  
  cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
