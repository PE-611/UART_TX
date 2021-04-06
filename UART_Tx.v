///////////////////////////////////////////////////////////
// Name File : UART_Tx.v 											//
// Autor : Dyomkin Pavel Mikhailovich 							//
// Company : GSC RF TRINITI										//
// Description : UART Tx module								  	//
// Start design : 01.04.2021 										//
// Last revision : 01.04.2021 									//
///////////////////////////////////////////////////////////
module UART_Tx (input clk_Tx, TX_LAUNCH, 
					 output reg [7:0] data, 
					 output reg UART_clk,		
					 output reg	Tx_out, start_tx_flag, tx_launch

					 );
					 
parameter Fclk = 100 * 1000000;			
parameter Fuart = 115200;								 	
parameter divider	= (Fclk / ((Fuart * 2) - 1)); 


initial Tx_out <= 1'b1;

initial UART_clk <= 1'b0;

reg [12:0]	cnt;
initial cnt <= 1'b0;	

reg [20:0] ltb_cnt;
initial ltb_cnt <= 1'b0;


reg [4:0] bit_cnt;
initial bit_cnt <= 4'd0;


initial data <= 8'd165;

//reg start_tx_flag;
initial start_tx_flag <= 1'b0;


reg ltb;
initial ltb <= 1'b0;

always @(posedge clk_Tx) begin
	
	cnt <= cnt + 1'b1;
	
	if (cnt == divider) begin
		UART_clk <= ~UART_clk;
		cnt <= 1'b0;
	end

	
	
		
end	
					

always @(posedge UART_clk) begin				 
	
	if (TX_LAUNCH == 1'b0 && ltb == 1'b0) begin
		tx_launch <= 1'b1;
		ltb = 1'b1;
	end
	
	if (tx_launch == 1'b1) begin
		tx_launch <= 1'b0;
	end
	
	if (ltb == 1'b1) begin
		ltb_cnt <= ltb_cnt + 1'b1;
	end
	
	if (ltb_cnt == 20'd25000) begin
		ltb <= 1'b0;
		ltb_cnt <= 1'b0;
	end
	
		
	
	if (tx_launch == 1'b1) begin
		Tx_out <= 1'b0;					//start bit
		start_tx_flag <= 1'b1;
	end
	
	if (start_tx_flag == 1'b1) begin 
		Tx_out <= data[bit_cnt];
		bit_cnt <= bit_cnt + 1'b1;
	end
	
	if (bit_cnt == 4'd7) begin
		Tx_out <= 1'b1;					// stop_bit
		start_tx_flag <= 1'b0;
		bit_cnt <= 4'd0;
	end
	


end
		
endmodule


//data_out <=  {data_out[7:0], Rx_in}; shift reg