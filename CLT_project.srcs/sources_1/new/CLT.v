`timescale 10ps / 1fs
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2019 09:46:56 AM
// Design Name: 
// Module Name: CLT
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module CLT(Yin, clk, out, i);
 
  input [31:0]  Yin;
  input clk;
  input [10:0]i;
  output reg [31:0] out;
  reg [31:0] mem [31:0];
  integer c=2;
  integer w=30;
  integer outx;
  integer x1=0, x2=0, x3=0, x4=0;
  integer ns=0;
  integer ps=0;
  integer stored_val =0;
  integer alpha1, alpha2, alpha3, alpha4;
  integer stored_2 =0;
  integer peak_clt_val;
  integer clt_peak_index =0;
  integer flag=0;
  integer max_qrs =0, threshold =0, curr_index=0, curr_val=0;
  integer curr_index_store=0, s_peak_index =0 ,s_peak_val=0, q_peak_val=0, q_peak_index=0;
 
 always @(posedge clk)
 begin
  mem[i%32]=Yin;
  //$display("%9b %9b %32b", i, i%32, mem[i%32]);
  alpha1 = mem[i%32];                //converting reg values to integers to easily use them in if else statements 
  alpha2 = mem[(i-1)%32];
  alpha3 = mem[(i-w)%32];
  alpha4 = mem[(i-w-1)%32];
  if(i>0 && i<=31) begin
    x1 = alpha1 > alpha2? alpha1 - alpha2 :alpha2 - alpha1;
    x2 = c + x1 + x1 + x1 + x1;
    ns = ps + x2;
  end
  else if(i>31) begin
    x1 = alpha1 > alpha2? alpha1 - alpha2 :alpha2 - alpha1;
    x2 = c + x1 + x1 + x1 + x1;
    x3 =  alpha3>alpha4 ? alpha3 - alpha4 : alpha4 - alpha3;
    x4 = c + x3 + x3 + x3 + x3;
    ns = ps + x2 - x4;
  end
  outx = ns;
  //$display( " %d %d %d %d %d %d",x1, x2, x3, x4,ps,ns);
  //$display( " %d ", outx);
  out = outx;
  //$display( " %32b ", out);
  ps = ns;
  if (i <200)
  begin
    if (outx >stored_val)
    stored_val = outx;
  end
  if (i>200)
  begin
    if (stored_val%2==0) 
        threshold = stored_val;
    else
        threshold = (stored_val-1);
  end
  if (i>200)
  begin
    if (outx>threshold)
    begin
        if(outx> stored_2)
            stored_2 = outx;
        else begin
            peak_clt_val = stored_2;
            
            curr_index = i;
            curr_val = mem[curr_index%32];
            if (curr_val>max_qrs)
            begin
            clt_peak_index = curr_index;
            max_qrs = curr_val;
            end
            
            curr_index = curr_index-1;
            curr_val = mem[curr_index%32];
            if (curr_val>max_qrs)
            begin
            clt_peak_index = curr_index;
            max_qrs = curr_val;
            end
            
            curr_index = curr_index-1;
            curr_val = mem[curr_index%32];
            if (curr_val>max_qrs)
            begin
            clt_peak_index = curr_index;
            max_qrs = curr_val;
            end
                        
            curr_index = curr_index-1;
            curr_val = mem[curr_index%32];
            if (curr_val>max_qrs)
            begin
            clt_peak_index = curr_index;
            max_qrs = curr_val;
            end
                                    
            curr_index = curr_index-1;
            curr_val = mem[curr_index%32];
            if (curr_val>max_qrs)
            begin
            clt_peak_index = curr_index;
            max_qrs = curr_val;
            end
                                                
            curr_index = curr_index-1;
            curr_val = mem[curr_index%32];
            if (curr_val>max_qrs)
            begin
            clt_peak_index = curr_index;
            max_qrs = curr_val;
            end
                                                            
            curr_index = curr_index-1;
            curr_val = mem[curr_index%32];
            if (curr_val>max_qrs)
            begin
            clt_peak_index = curr_index;
            max_qrs = curr_val;
            end
                                                                        
            curr_index = curr_index-1;
            curr_val = mem[curr_index%32];
            if (curr_val>max_qrs)
            begin
            clt_peak_index = curr_index;
            max_qrs = curr_val;
            end
                                                                                    
            curr_index = curr_index-1;
            curr_val = mem[curr_index%32];
            if (curr_val>max_qrs)
            begin
            clt_peak_index = curr_index;
            max_qrs = curr_val;
            end
                        
            curr_index = curr_index-1;
            curr_val = mem[curr_index%32];
            if (curr_val>max_qrs)
            begin
            clt_peak_index = curr_index;
            max_qrs = curr_val;
            end
                                    
            curr_index = curr_index-1;
            curr_val = mem[curr_index%32];
            if (curr_val>max_qrs)
            begin
            clt_peak_index = curr_index;
            max_qrs = curr_val;
            end
                                                                                                                        
            curr_index = curr_index-1;
            curr_val = mem[curr_index%32];
            if (curr_val>max_qrs)
            begin
            clt_peak_index = curr_index;
            max_qrs = curr_val;
            end
                                                                        
            curr_index = curr_index-1;
            curr_val = mem[curr_index%32];
            if (curr_val>max_qrs)
            begin
            clt_peak_index = curr_index;
            max_qrs = curr_val;
            end
                                                                                    
            curr_index = curr_index-1;
            curr_val = mem[curr_index%32];
            if (curr_val>max_qrs)
            begin
            clt_peak_index = curr_index;
            max_qrs = curr_val;
            end
                        
            curr_index = curr_index-1;
            curr_val = mem[curr_index%32];
            if (curr_val>max_qrs)
            begin
            clt_peak_index = curr_index;
            max_qrs = curr_val;
            end
                                    
            curr_index = curr_index-1;
            curr_val = mem[curr_index%32];
            if (curr_val>max_qrs)
            begin
            clt_peak_index = curr_index;
            max_qrs = curr_val;
            end  
            $display(" R peak value is %d ", max_qrs, " and sample number is %d ", clt_peak_index);                                                                                                          
                
                
            // r peak is detected .. now we shall detect q and s peaks
             
             curr_index_store = clt_peak_index;
             curr_index = curr_index_store;
             
             q_peak_val = max_qrs;
             
             curr_index = curr_index-1;
             curr_val = mem[curr_index%32];
             if (curr_val<q_peak_val)
             begin
             q_peak_index = curr_index;
             q_peak_val = curr_val;
             end
             
            curr_index = curr_index-1;
            curr_val = mem[curr_index%32];
            if (curr_val<q_peak_val)
            begin
            q_peak_index = curr_index;
            q_peak_val = curr_val;
            end
            
            
            curr_index = curr_index-1;
            curr_val = mem[curr_index%32];
            if (curr_val<q_peak_val)
            begin
            q_peak_index = curr_index;
            q_peak_val = curr_val;
            end
                       
                       
            curr_index = curr_index-1;
            curr_val = mem[curr_index%32];
            if (curr_val<q_peak_val)
            begin
            q_peak_index = curr_index;
            q_peak_val = curr_val;
            end
                                    
            curr_index = curr_index-1;
             curr_val = mem[curr_index%32];
             if (curr_val<q_peak_val)
             begin
             q_peak_index = curr_index;
             q_peak_val = curr_val;
             end
                                                 
             curr_index = curr_index-1;
          curr_val = mem[curr_index%32];
          if (curr_val<q_peak_val)
          begin
          q_peak_index = curr_index;
          q_peak_val = curr_val;
          end
                                                              
          curr_index = curr_index-1;
           curr_val = mem[curr_index%32];
           if (curr_val<q_peak_val)
           begin
           q_peak_index = curr_index;
           q_peak_val = curr_val;
           end
                                                                                           
           curr_index = curr_index-1;
            curr_val = mem[curr_index%32];
            if (curr_val<q_peak_val)
            begin
            q_peak_index = curr_index;
            q_peak_val = curr_val;
            end
                                                                                                        
            curr_index = curr_index-1;
             curr_val = mem[curr_index%32];
             if (curr_val<q_peak_val)
             begin
             q_peak_index = curr_index;
             q_peak_val = curr_val;
             end
             
            curr_index = curr_index-1;
            curr_val = mem[curr_index%32];
            if (curr_val<q_peak_val)
            begin
            q_peak_index = curr_index;
            q_peak_val = curr_val;
            end
            
            
            curr_index = curr_index-1;
            curr_val = mem[curr_index%32];
            if (curr_val<q_peak_val)
            begin
            q_peak_index = curr_index;
            q_peak_val = curr_val;
            end
                       
                       
            curr_index = curr_index-1;
            curr_val = mem[curr_index%32];
            if (curr_val<q_peak_val)
            begin
            q_peak_index = curr_index;
            q_peak_val = curr_val;
            end
                                    
            curr_index = curr_index-1;
             curr_val = mem[curr_index%32];
             if (curr_val<q_peak_val)
             begin
             q_peak_index = curr_index;
             q_peak_val = curr_val;
             end
                                                 
             curr_index = curr_index-1;
          curr_val = mem[curr_index%32];
          if (curr_val<q_peak_val)
          begin
          q_peak_index = curr_index;
          q_peak_val = curr_val;
          end
                                                              
          curr_index = curr_index-1;
           curr_val = mem[curr_index%32];
           if (curr_val<q_peak_val)
           begin
           q_peak_index = curr_index;
           q_peak_val = curr_val;
           end
                                                                                           
           curr_index = curr_index-1;
            curr_val = mem[curr_index%32];
            if (curr_val<q_peak_val)
            begin
            q_peak_index = curr_index;
            q_peak_val = curr_val;
            end                                                                                            
          
          $display(" Q peak value is %d ", q_peak_val, " and sample number is %d ", q_peak_index);    
         // now we need to detect the s peak
          
          s_peak_index = 0;
          s_peak_val = max_qrs;
          curr_index = curr_index_store;
              
          curr_index = curr_index+1;
          curr_val = mem[curr_index%32];
          if (curr_val<s_peak_val)
          begin
          s_peak_index = curr_index;
          s_peak_val = curr_val;
          end     
            
            curr_index = curr_index+1;
            curr_val = mem[curr_index%32];
            if (curr_val<s_peak_val)
            begin
            s_peak_index = curr_index;
            s_peak_val = curr_val;
            end 
            
            curr_index = curr_index+1;
            curr_val = mem[curr_index%32];
            if (curr_val<s_peak_val)
            begin
            s_peak_index = curr_index;
            s_peak_val = curr_val;
            end 
            
            curr_index = curr_index+1;
            curr_val = mem[curr_index%32];
            if (curr_val<s_peak_val)
            begin
            s_peak_index = curr_index;
            s_peak_val = curr_val;
            end 
            
            curr_index = curr_index+1;
              curr_val = mem[curr_index%32];
              if (curr_val<s_peak_val)
              begin
              s_peak_index = curr_index;
              s_peak_val = curr_val;
              end 
              
              curr_index = curr_index+1;
            curr_val = mem[curr_index%32];
            if (curr_val<s_peak_val)
            begin
            s_peak_index = curr_index;
            s_peak_val = curr_val;
            end 
            
            curr_index = curr_index+1;
              curr_val = mem[curr_index%32];
              if (curr_val<s_peak_val)
              begin
              s_peak_index = curr_index;
              s_peak_val = curr_val;
              end 
            
            curr_index = curr_index+1;
            curr_val = mem[curr_index%32];
            if (curr_val<s_peak_val)
            begin
            s_peak_index = curr_index;
            s_peak_val = curr_val;
            end 
            
            curr_index = curr_index+1;
              curr_val = mem[curr_index%32];
              if (curr_val<s_peak_val)
              begin
              s_peak_index = curr_index;
              s_peak_val = curr_val;
              end 
              
              curr_index = curr_index+1;
            curr_val = mem[curr_index%32];
            if (curr_val<s_peak_val)
            begin
            s_peak_index = curr_index;
            s_peak_val = curr_val;
            end 
            
            curr_index = curr_index+1;
              curr_val = mem[curr_index%32];
              if (curr_val<s_peak_val)
              begin
              s_peak_index = curr_index;
              s_peak_val = curr_val;
              end 
              
              curr_index = curr_index+1;
                curr_val = mem[curr_index%32];
                if (curr_val<s_peak_val)
                begin
                s_peak_index = curr_index;
                s_peak_val = curr_val;
                end 
                
                curr_index = curr_index+1;
              curr_val = mem[curr_index%32];
              if (curr_val<s_peak_val)
              begin
              s_peak_index = curr_index;
              s_peak_val = curr_val;
              end 
              
              curr_index = curr_index+1;
                curr_val = mem[curr_index%32];
                if (curr_val<s_peak_val)
                begin
                s_peak_index = curr_index;
                s_peak_val = curr_val;
                end 
                
                curr_index = curr_index+1;
              curr_val = mem[curr_index%32];
              if (curr_val<s_peak_val)
              begin
              s_peak_index = curr_index;
              s_peak_val = curr_val;
              end 
                                                                                                                                                          
          
        $display(" S peak value is %d ", s_peak_val, " and sample number is %d ", s_peak_index);                                                                        
                                                                                           
        end
    end
      
  end
  
  
  end
endmodule
