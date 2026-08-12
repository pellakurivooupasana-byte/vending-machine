module vending_machine_tb;

reg clk;
reg reset;
reg [3:0] coin;
reg select;
reg [1:0] item_code;

wire dispense;
wire [3:0] change;

// DUT Instantiation
vending_machine dut (
    .clk(clk),
    .reset(reset),
    .coin(coin),
    .select(select),
    .item_code(item_code),
    .dispense(dispense),
    .change(change)
);

// Clock Generation
initial
    clk = 0;

always #5 clk = ~clk;

// Test Sequence
initial begin

    reset = 1;
    select = 0;
    coin = 0;
    item_code = 2'd0;

    #10 reset = 0;

    // Select Item 1 (Price = 50)
    #10 select = 1;
        item_code = 2'd1;

    #10 select = 0;
        coin = 4'd10;

    #10 coin = 4'd25;

    #10 coin = 4'd10;

    #10 coin = 4'd5;   // Total = 50

    #10 coin = 4'd0;

    #20;

    // Select Item 2 (Price = 70)
    #10 select = 1;
        item_code = 2'd2;

    #10 select = 0;
        coin = 4'd25;

    #10 coin = 4'd25;

    #10 coin = 4'd25;  // Total = 75

    #10 coin = 4'd0;

    #20;

    $stop;
end

// Monitor Signals
initial begin
    $monitor("Time=%0t Item=%0d Coin=%0d Total=%0d Dispense=%b Change=%0d",
              $time,
              item_code,
              coin,
              dut.total_amount,
              dispense,
              change);
end

endmodule
