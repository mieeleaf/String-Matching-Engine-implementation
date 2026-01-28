`timescale 1ns/10ps
module SME(clk,reset,chardata,isstring,ispattern,valid,match,match_index);
input clk;
input reset;
input [7:0] chardata;
input isstring;
input ispattern;
output match;
reg match;
output reg[4:0] match_index;
output valid;
reg valid;
reg[4:0] match_index_ns;
reg match_ns;
reg star;
reg [4:0]star_index; 
reg [7:0] str_mem[31:0];
reg [32:-1]compare;
wire[32:-1]compare_shift;
reg [32:-1]yn_match;
reg [4:0] str_index;
reg [4:0] star_match_index;
reg [3:0] count_pat;
wire[32:-1]yn_match_and;
reg cap;
reg star_h;
reg [4:0]string_length;
reg money;

always@(*)
begin
if((|yn_match_and))
begin
match_ns=1;
if (yn_match_and[-1] == 1) match_index_ns =5'b00000;
else if (yn_match_and[0] == 1) match_index_ns =(cap)?5'b00001:5'b00000;
else if (yn_match_and[1] == 1) match_index_ns =(cap)?5'b00010:5'b00001;
else if (yn_match_and[2] == 1) match_index_ns =(cap)?5'b00011:5'b00010;
else if (yn_match_and[3] == 1) match_index_ns =(cap)?5'b00100:5'b00011;
else if (yn_match_and[4] == 1) match_index_ns =(cap)?5'b00101:5'b00100;
else if (yn_match_and[5] == 1) match_index_ns =(cap)?5'b00110:5'b00101;
else if (yn_match_and[6] == 1) match_index_ns =(cap)?5'b00111:5'b00110;
else if (yn_match_and[7] == 1) match_index_ns =(cap)?5'b01000:5'b00111;
else if (yn_match_and[8] == 1) match_index_ns =(cap)?5'b01001:5'b01000;
else if (yn_match_and[9] == 1) match_index_ns =(cap)?5'b01010:5'b01001;
else if (yn_match_and[10] == 1) match_index_ns =(cap)?5'b01011:5'b01010;
else if (yn_match_and[11] == 1) match_index_ns =(cap)?5'b01100:5'b01011;
else if (yn_match_and[12] == 1) match_index_ns =(cap)?5'b01101:5'b01100;
else if (yn_match_and[13] == 1) match_index_ns =(cap)?5'b01110:5'b01101;
else if (yn_match_and[14] == 1) match_index_ns =(cap)?5'b01111:5'b01110;
else if (yn_match_and[15] == 1) match_index_ns =(cap)?5'b10000:5'b01111;
else if (yn_match_and[16] == 1) match_index_ns =(cap)?5'b10001:5'b10000;
else if (yn_match_and[17] == 1) match_index_ns =(cap)?5'b10010:5'b10001;
else if (yn_match_and[18] == 1) match_index_ns =(cap)?5'b10011:5'b10010;
else if (yn_match_and[19] == 1) match_index_ns =(cap)?5'b10100:5'b10011;
else if (yn_match_and[20] == 1) match_index_ns =(cap)?5'b10101:5'b10100;
else if (yn_match_and[21] == 1) match_index_ns =(cap)?5'b10110:5'b10101;
else if (yn_match_and[22] == 1) match_index_ns =(cap)?5'b10111:5'b10110;
else if (yn_match_and[23] == 1) match_index_ns =(cap)?5'b11000:5'b10111;
else if (yn_match_and[24] == 1) match_index_ns =(cap)?5'b11001:5'b11000;
else if (yn_match_and[25] == 1) match_index_ns =(cap)?5'b11010:5'b11001;
else if (yn_match_and[26] == 1) match_index_ns =(cap)?5'b11011:5'b11010;
else if (yn_match_and[27] == 1) match_index_ns =(cap)?5'b11100:5'b11011;
else if (yn_match_and[28] == 1) match_index_ns =(cap)?5'b11101:5'b11100;
else if (yn_match_and[29] == 1) match_index_ns =(cap)?5'b11110:5'b11101;
else if (yn_match_and[30] == 1) match_index_ns =(cap)?5'b11111:5'b11110;
else if (yn_match_and[31] == 1) match_index_ns =5'b11111;
else match_index_ns = 5'b00000;
end
else
begin
match_ns=0;
match_index_ns=0;
end
end

always@(negedge clk or posedge reset)
begin
if(reset)
begin
match_index<=0;
end
else
begin
if(star)
match_index<=star_match_index;
else if(star_h)
match_index<=0;
else
match_index<=match_index_ns;
end
end

always@(negedge clk or posedge reset) //match
begin
if(reset)
begin
match<=0;
end
else if(match_index_ns>string_length)
begin
match<=0;
end
else if(((match_index_ns+(count_pat-1))>string_length)&&(count_pat!=0)&&money)
begin
match<=match_ns;
end
else if(((match_index_ns+(count_pat-1))>string_length)&&(count_pat!=0)&&(yn_match_and[-1]==1))
begin
match<=match_ns;
end
else if(((match_index_ns+(count_pat-1))>string_length)&&(count_pat!=0))
begin
match<=0;
end
else
match<=match_ns;
end


always@(negedge clk or posedge reset)
begin
if(reset)
begin
cap<=0;
end
else
begin
if((ispattern==0)||(star))
cap<=0;
else if(chardata==8'h5e)
cap<=1;
end
end

always@(negedge clk or posedge reset)
begin
if(reset)
begin
money<=0;
end
else
begin
if(ispattern==0)
money<=0;
else if(chardata==8'h24)
money<=1;
end
end

always@(negedge clk or posedge reset)
begin
if(reset)
begin
star_h<=0;
end
else
begin
if(ispattern==0)
star_h<=0;
else if((count_pat==0)&&(chardata==8'h2a))
star_h<=1;
end
end


always@(negedge clk or posedge reset)
begin
if(reset)
begin
star<=0;
star_index<=0;
star_match_index<=0;
end
else
begin
if(!ispattern)
begin
star<=0;
star_index<=0;
star_match_index<=0;
end
else if((chardata==8'h2a)&&(|yn_match_and))
begin
star<=1;
star_index<=(cap)?(match_index_ns-1+count_pat):(match_index_ns+count_pat);
star_match_index<=match_index_ns;
end
end
end


always@(negedge clk or posedge reset)  //compare 
  if(reset)
    compare<=34'd0;
  else if(ispattern)
    begin
	compare[-1]<=(chardata==8'h5e||chardata==8'h24||chardata==8'h2a)?1:0;
	compare[0]<=((str_mem[0]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[0]==8'h20))&&(star_index<=0))?1:0;
    compare[1]<=((str_mem[1]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[1]==8'h20))&&(star_index<=1))?1:0;
    compare[2]<=((str_mem[2]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[2]==8'h20))&&(star_index<=2))?1:0;
	compare[3]<=((str_mem[3]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[3]==8'h20))&&(star_index<=3))?1:0;
	compare[4]<=((str_mem[4]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[4]==8'h20))&&(star_index<=4))?1:0;
	compare[5]<=((str_mem[5]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[5]==8'h20))&&(star_index<=5))?1:0;
	compare[6]<=((str_mem[6]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[6]==8'h20))&&(star_index<=6))?1:0;
	compare[7]<=((str_mem[7]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[7]==8'h20))&&(star_index<=7))?1:0;
	compare[8]<=((str_mem[8]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[8]==8'h20))&&(star_index<=8))?1:0;
	compare[9]<=((str_mem[9]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[9]==8'h20))&&(star_index<=9))?1:0;
	compare[10]<=((str_mem[10]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[10]==8'h20))&&(star_index<=10))?1:0;
    compare[11]<=((str_mem[11]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[11]==8'h20))&&(star_index<=11))?1:0;
    compare[12]<=((str_mem[12]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[12]==8'h20))&&(star_index<=12))?1:0;
	compare[13]<=((str_mem[13]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[13]==8'h20))&&(star_index<=13))?1:0;
	compare[14]<=((str_mem[14]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[14]==8'h20))&&(star_index<=14))?1:0;
	compare[15]<=((str_mem[15]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[15]==8'h20))&&(star_index<=15))?1:0;
	compare[16]<=((str_mem[16]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[16]==8'h20))&&(star_index<=16))?1:0;
	compare[17]<=((str_mem[17]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[17]==8'h20))&&(star_index<=17))?1:0;
	compare[18]<=((str_mem[18]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[18]==8'h20))&&(star_index<=18))?1:0;
	compare[19]<=((str_mem[19]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[19]==8'h20))&&(star_index<=19))?1:0;
	compare[20]<=((str_mem[20]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[20]==8'h20))&&(star_index<=20))?1:0;
    compare[21]<=((str_mem[21]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[21]==8'h20))&&(star_index<=21))?1:0;
    compare[22]<=((str_mem[22]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[22]==8'h20))&&(star_index<=22))?1:0;
	compare[23]<=((str_mem[23]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[23]==8'h20))&&(star_index<=23))?1:0;
	compare[24]<=((str_mem[24]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[24]==8'h20))&&(star_index<=24))?1:0;
	compare[25]<=((str_mem[25]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[25]==8'h20))&&(star_index<=25))?1:0;
	compare[26]<=((str_mem[26]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[26]==8'h20))&&(star_index<=26))?1:0;
	compare[27]<=((str_mem[27]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[27]==8'h20))&&(star_index<=27))?1:0;
	compare[28]<=((str_mem[28]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[28]==8'h20))&&(star_index<=28))?1:0;
	compare[29]<=((str_mem[29]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[29]==8'h20))&&(star_index<=29))?1:0;
	compare[30]<=((str_mem[30]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[30]==8'h20))&&(star_index<=30))?1:0;
    compare[31]<=((str_mem[31]==chardata||chardata==8'h2e||chardata==8'h2a||((chardata==8'h5e||chardata==8'h24)&&str_mem[31]==8'h20))&&(star_index<=31))?1:0;
    compare[32]<=((chardata==8'h5e||chardata==8'h24||chardata==8'h2a))?1:0;
    end
	
		
always@(negedge clk or posedge reset)  //count_pat and yn_match
  begin
    if(reset)
	  begin
	  count_pat<=0;
      yn_match<=34'd0;
      end
    else if(ispattern)
	begin
    if((chardata==8'h2a)&&(|yn_match_and))
	begin
    count_pat<=0;	///+1?
	end
	else
	begin
	count_pat<=count_pat+1;
	end
	yn_match<=yn_match_and;
	end
	else 
	begin
	count_pat<=0;  
	yn_match<=0;
	end
	end
	
assign compare_shift=compare>>(count_pat-1);
assign yn_match_and=(((count_pat)==1))?compare:(((chardata==8'h2a)&&(count_pat==0))?yn_match&compare:yn_match&compare_shift);	
//assign valid=1'b1; //valid always 1

always@(negedge clk or posedge reset)
begin
if(reset)
valid<=1'b0;
else if(ispattern==0)
valid<=1'b1;
else
valid<=1'b0;
end

always@(negedge clk or posedge reset)    //store string
  begin
    if(reset)
	  begin
	  str_index<=0;
	  str_mem[0]<=0;
	  str_mem[1]<=0;
      str_mem[2]<=0;
	  str_mem[3]<=0;
	  str_mem[4]<=0;
	  str_mem[5]<=0;
	  str_mem[6]<=0;
	  str_mem[7]<=0;
	  str_mem[8]<=0;
	  str_mem[9]<=0;
      str_mem[10]<=0;
	  str_mem[11]<=0;
	  str_mem[12]<=0;
	  str_mem[13]<=0;
	  str_mem[14]<=0;
      str_mem[15]<=0;
	  str_mem[16]<=0;
	  str_mem[17]<=0;
	  str_mem[18]<=0;
	  str_mem[19]<=0;
	  str_mem[20]<=0;
	  str_mem[21]<=0;
	  str_mem[22]<=0;
	  str_mem[23]<=0;
	  str_mem[24]<=0;
	  str_mem[25]<=0;
	  str_mem[26]<=0;
	  str_mem[27]<=0;
	  str_mem[28]<=0;
	  str_mem[29]<=0;
	  str_mem[30]<=0;
	  str_mem[31]<=0;
	  end
    else if(isstring)
	  begin
	  str_index<=str_index+1;
	  str_mem[str_index]<=chardata;
	  str_mem[str_index+1]<=8'h20;
	  string_length<=str_index;
	  end
	else 
	  begin
	  str_index<=0;
	  end
  end	
endmodule