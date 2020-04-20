package com.niit.rtt.epowerbilling.rest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.niit.rtt.epowerbilling.exception.*;
import com.niit.rtt.epowerbilling.model.Address;
import com.niit.rtt.epowerbilling.model.User;
import com.niit.rtt.epowerbilling.model.UserDetails;
import com.niit.rtt.epowerbilling.repository.LoginUserRepository;

@RestController  
@CrossOrigin(origins="http://localhost:4200")  
@RequestMapping(value="/api") 
public class PowerRestController {
	@Autowired
    private LoginUserRepository urepo;
	
	 @GetMapping("/user")  
	    public List<User> getAllUser() {  
	         return (List<User>)urepo.findAll(); 
	    }  
	 
	 /** 
	  * ResponseEntity represents an HTTP response, including headers, body, and status.
	  */
	 @GetMapping("/user/{id}")
		public ResponseEntity<User> getProductById(@PathVariable(value = "id") Integer uId)
				throws ResourceNotFound {
			User user = urepo.findById(uId)
					.orElseThrow(() -> new ResourceNotFound("Product not found for this id :: " + uId));
			return ResponseEntity.ok().body(user);
		}
	 
	 @PostMapping("/user")  
	    public User saveProduct(@Valid @RequestBody UserDetails userdetails) {  
		 //user.setAddress(address);
		  User user= convertUserToSave(userdetails);
		// System.out.println(a);
		 return urepo.save(user) ;
	       	          
	    }  
	 public User convertUserToSave(UserDetails userdetails)
	 {
		 User u=new User();
		 Address a=new Address();
		 u.setFirstName(userdetails.getFirstName());
		 u.setLastName(userdetails.getLastName());
		 u.setGender(userdetails.getGender());
		 u.setMobNumber(userdetails.getMobNumber());
		 u.setEmail(userdetails.getEmail());
		 u.setPassword(userdetails.getPassword());
		 u.setAadhaar(userdetails.getAadhaar());
		 
		 a.setAddressLine1(userdetails.getAddressLine1());
		 a.setAddressLine2(userdetails.getAddressLine2());
		 a.setCity(userdetails.getCity());
		 a.setCountry(userdetails.getCountry());
		 a.setState(userdetails.getState());
		 a.setPincode(userdetails.getPincode());
		 
		 u.setAddress(a);
		 a.setUser(u);
		 return u;
	 }
	 
	 @DeleteMapping("/user/{id}")
	    public Map<String, Boolean> deleteProduct(@PathVariable(value = "id") Integer uId) 
	    		throws ResourceNotFound{
		 User user = urepo.findById(uId)
					.orElseThrow(() -> new ResourceNotFound("Product not found for this id :: " + uId));
	        urepo.delete(user);
	        
	        Map<String, Boolean> response = new HashMap<>();
			response.put("deleted", Boolean.TRUE);
			return response;
	 }
	 
	 @PutMapping("/user/{id}")
	    public ResponseEntity<User> updateProduct(@PathVariable(value = "id") Integer uId,
				@Valid @RequestBody User u) throws ResourceNotFound {
	     
		 User user = urepo.findById(uId)
					.orElseThrow(() -> new ResourceNotFound("Product not found for this id :: " + uId));
		 
		    user.setFirstName(u.getFirstName());
		    user.setLastName(u.getLastName());
		    user.setuId(u.getuId());
		    user.setPassword(u.getPassword());
		    user.setGender(u.getGender());
		    user.setMobNumber(u.getMobNumber());
		    user.setAadhaar(u.getAadhaar());
		    user.setEmail(u.getEmail());
		    user.setAddress(u.getAddress());
		    //user.setConn(u.getConn());
		    //user.setBrand(p.getBrand());
		    //product.setMadein(p.getMadein());
		    //product.setName(p.getName());
		    //product.setPrice(p.getPrice());
		    
		    final User updatedUser = urepo.save(user);
			return ResponseEntity.ok(updatedUser);
	    }
}
