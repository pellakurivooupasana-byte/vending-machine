module vending_machine (
    input clk,
    input reset,
    input [3:0] coin,          // Input coin value
    input select,              // Select signal for an item
    input [1:0] item_code,     // Code for the selected item
    output reg dispense,       // Dispense signal
    output reg [3:0] change    // Change returned
);

    parameter IDLE     = 2'b00;
    parameter COLLECT  = 2'b01;
    parameter DISPENSE = 2'b10;

    reg [1:0] current_state, next_state;
    reg [6:0] total_amount;
    reg [6:0] item_price;

    // Item price selection
    always @(*) begin
        case(item_code)
            2'd0: item_price = 7'd30;
            2'd1: item_price = 7'd50;
            2'd2: item_price = 7'd70;
            2'd3: item_price = 7'd90;
            default: item_price = 7'd0;
        endcase
    end

    // State transition and output logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= IDLE;
            total_amount  <= 7'd0;
            dispense      <= 1'b0;
            change        <= 4'd0;
        end
        else begin
            current_state <= next_state;

            if (current_state == COLLECT && coin > 0)
                total_amount <= total_amount + coin;

            if (current_state == DISPENSE) begin
                dispense <= 1'b1;
                change <= total_amount - item_price;
                total_amount <= 7'd0;
            end
            else begin
                dispense <= 1'b0;
                change <= 4'd0;
            end
        end
    end

    // Next state logic
    always @(*) begin
        case(current_state)
            IDLE:
                next_state = (select) ? COLLECT : IDLE;

            COLLECT:
                next_state = (total_amount >= item_price) ? DISPENSE : COLLECT;

            DISPENSE:
                next_state = IDLE;

            default:
                next_state = IDLE;
        endcase
    end

endmodule
