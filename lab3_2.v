`timescale 1ns / 1ps 
module lab3_2(
			input[3:0] command,
			input CLK, 
			input mode,
			output reg [7:0] total_time1,
			output reg [7:0] total_time0,
			output reg [7:0] total_cost1,
			output reg [7:0] total_cost0,
			output reg [3:2] coord_x,
			output reg [1:0] coord_y,
			output reg warning
    );

   //Modify the lines below to implement your design .
initial begin
	coord_x = 1;
	coord_y = 1;
	total_time1 = 0;
	total_time0 = 0;
	total_cost1 = 0;
	total_cost0 = 0;
end

always@(posedge CLK)
	if(mode == 0)
	begin
		warning = 0;
		total_time0 = total_time0 + 1;
		if(total_time1 == 1 && total_time0 == 10)
		begin
			total_time1 = 0;
			total_time0 = 0;
		end
		if(total_time1 == 0 && total_time0 == 10)
		begin
			total_time1 = 1;
			total_time0 = 0;
		end
		
		if(command == 0)
		begin
			total_cost0 = total_cost0 + 1;
			if(total_cost1 == 1 && total_cost0 > 9)
			begin
				total_cost1 = 0;
				total_cost0 = (total_cost0  - 10);
			end
			if(total_cost1 == 0 && total_cost0 > 9)
			begin
				total_cost1 = 1;
				total_cost0 = (total_cost0 - 10);
			end
		end
		
		if(command == 1)
		begin
			if((coord_x == 1 && coord_y == 0) || (coord_x == 1 && coord_y == 1) || (coord_x == 2 && coord_y == 0) || (coord_x == 2 && coord_y == 1))
			begin
				coord_x = coord_x - 1;
				coord_y = coord_y + 1;
				total_cost0 = total_cost0 + 3;
				if(total_cost1 == 1 && total_cost0 > 9)
				begin
					total_cost1 = 0;
					total_cost0 = (total_cost0  - 10);
				end
				if(total_cost1 == 0 && total_cost0 > 9)
				begin
					total_cost1 = 1;
					total_cost0 = (total_cost0 - 10);
				end
 			end
			else
			begin
				total_cost0 = total_cost0 + 1;
				if(total_cost1 == 1 && total_cost0 > 9)
				begin
					total_cost1 = 0;
					total_cost0 = (total_cost0  - 10);
				end
				if(total_cost1 == 0 && total_cost0 > 9)
				begin
					total_cost1 = 1;
					total_cost0 = (total_cost0 - 10);
				end
			end
		end
		 
		if(command == 2)
		begin
			total_cost0 = total_cost0 + 2;
			if(total_cost1 == 1 && total_cost0 > 9)
			begin
				total_cost1 = 0;
				total_cost0 = (total_cost0  - 10);
			end
			if(total_cost1 == 0 && total_cost0 > 9)
			begin
				total_cost1 = 1;
				total_cost0 = (total_cost0 - 10);
			end
			if(coord_y == 2)
			begin
				coord_y = 0;
			end
			else
			begin
				coord_y = coord_y + 1;
			end
		end
		
		if(command == 3)
		begin
			if((coord_x == 0 && coord_y == 0) || (coord_x == 0 && coord_y == 1) || (coord_x == 1 && coord_y == 0) || (coord_x == 1 && coord_y == 1))
			begin
				coord_x = coord_x + 1;
				coord_y = coord_y +1;
				total_cost0 = total_cost0 + 3;
				if(total_cost1 == 1 && total_cost0 > 9)
				begin
					total_cost1 = 0;
					total_cost0 = (total_cost0  - 10);
				end
				if(total_cost1 == 0 && total_cost0 > 9)
				begin
					total_cost1 = 1;
					total_cost0 = (total_cost0 - 10);
				end
			end
			else
			begin
				total_cost0 = total_cost0 + 1;
				if(total_cost1 == 1 && total_cost0 > 9)
				begin
					total_cost1 = 0;
					total_cost0 = (total_cost0  - 10);
				end
				if(total_cost1 == 0 && total_cost0 > 9)
				begin
					total_cost1 = 1;
					total_cost0 = (total_cost0 - 10);
				end
			end
		end
		
		if(command == 4)
		begin
			total_cost0 = total_cost0 + 2;
			if(total_cost1 == 1 && total_cost0 > 9)
			begin
				total_cost1 = 0;
				total_cost0 = (total_cost0  - 10);
			end
			if(total_cost1 == 0 && total_cost0 > 9)
			begin
				total_cost1 = 1;
				total_cost0 = (total_cost0 - 10);
			end
			if(coord_x == 2)
			begin
				coord_x = 0;
			end
			else
			begin
				coord_x = coord_x +1;
			end
		end
		
		if(command == 5)
		begin
			if((coord_x == 0 && coord_y == 1) || (coord_x == 0 && coord_y == 2) || (coord_x == 1 && coord_y == 1) || (coord_x == 1 && coord_y == 2))
			begin
				coord_x = coord_x + 1;
				coord_y = coord_y - 1;
				total_cost0 = total_cost0 + 3;
				if(total_cost1 == 1 && total_cost0 > 9)
				begin
					total_cost1 = 0;
					total_cost0 = (total_cost0  - 10);
				end
				if(total_cost1 == 0 && total_cost0 > 9)
				begin
					total_cost1 = 1;
					total_cost0 = (total_cost0 - 10);
				end
			end
			else
			begin
				total_cost0 = total_cost0 + 1;
				if(total_cost1 == 1 && total_cost0 > 9)
				begin
					total_cost1 = 0;
					total_cost0 = (total_cost0  - 10);
				end
				if(total_cost1 == 0 && total_cost0 > 9)
				begin
					total_cost1 = 1;
					total_cost0 = (total_cost0 - 10);
				end
			end
		end
		
		if(command == 6)
		begin
		total_cost0 = total_cost0 + 2;
			if(total_cost1 == 1 && total_cost0 > 9)
			begin
				total_cost1 = 0;
				total_cost0 = (total_cost0  - 10);
			end
			if(total_cost1 == 0 && total_cost0 > 9)
			begin
				total_cost1 = 1;
				total_cost0 = (total_cost0 - 10);
			end
			if(coord_y == 0)
			begin
				coord_y = 2;
			end
			else
			begin
				coord_y = coord_y - 1;
			end
		end
		
		if(command == 7)
		begin
			if((coord_x == 1 && coord_y == 1) || (coord_x == 1 && coord_y == 2) || (coord_x == 2 && coord_y == 1) || (coord_x == 2 && coord_y == 2))
			begin
				total_cost0 = total_cost0 + 3;
				if(total_cost1 == 1 && total_cost0 > 9)
				begin
					total_cost1 = 0;
					total_cost0 = (total_cost0  - 10);
				end
				if(total_cost1 == 0 && total_cost0 > 9)
				begin
					total_cost1 = 1;
					total_cost0 = (total_cost0 - 10);
				end
				coord_x = coord_x - 1;
				coord_y = coord_y - 1;
			end
			else
			begin
				total_cost0 = total_cost0 + 1;
				if(total_cost1 == 1 && total_cost0 > 9)
				begin
					total_cost1 = 0;
					total_cost0 = (total_cost0  - 10);
				end
				if(total_cost1 == 0 && total_cost0 > 9)
				begin
					total_cost1 = 1;
					total_cost0 = (total_cost0 - 10);
				end
			end
		end
		
		if(command == 8)
		begin
			total_cost0 = total_cost0 + 2;
			if(total_cost1 == 1 && total_cost0 > 9)
			begin
				total_cost1 = 0;
				total_cost0 = (total_cost0  - 10);
			end
			if(total_cost1 == 0 && total_cost0 > 9)
			begin
				total_cost1 = 1;
				total_cost0 = (total_cost0 - 10);
			end
			if(coord_x == 0)
			begin
				coord_x = 2;
			end
			else
			begin
				coord_x = coord_x - 1;
			end
		end
		
	end
	
	else
		begin
			warning = 1;
			coord_x = 0;
			coord_y = 0;
			total_time1 = 0;
			total_time0 = 0;
			total_cost1 = 0;
			total_cost0 = 0;		
		end

endmodule

