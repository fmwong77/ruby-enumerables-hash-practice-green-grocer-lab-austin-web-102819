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
  
  coupons.each do |coupon_hash|
    fruit_name = coupon_hash[:item]
    new_coupon_hash = {
      :price => coupon_hash[:cost],
      :clearance => "true",
      :count => coupon_hash[:num]
    }
    
     if cart.key?(fruit_name)
      new_coupon_hash[:clearance] = cart[fruit_name][:clearance]
      if cart[fruit_name][:count]>= new_coupon_hash[:count]
        new_coupon_hash[:count] = (cart[fruit_name][:count]/new_coupon_hash[:count]).floor
        cart[fruit_name][:count] = (coupon_hash[:num])%(cart[fruit_name][:count])
      end
      item = fruit_name + " W/COUPON"
      cart[item] = new_coupon_hash 
    end
    end
  return cart
  
  
  =begin
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
  =end
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
