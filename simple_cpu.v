module simple_cpu(
    input clk,
    input reset,
    input [7:0] instruction,  // 명령어를 외부에서 입력받음
    output reg [7:0] acc  // 누산기의 값
);

// 상태 및 명령어 코드 정의 (LDI, ADD, SUB 등)
parameter FETCH = 0, DECODE = 1, EXECUTE = 2;
parameter LDI = 4'b0001, ADD = 4'b0010, SUB = 4'b0011;

reg [1:0] state = FETCH;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= FETCH;
        acc <= 0;
    end else begin
        case (state)
            FETCH: begin
                state <= DECODE;
            end
            DECODE: begin
                state <= EXECUTE;
            end
            EXECUTE: begin
                case (instruction[7:4])
                    LDI: acc <= instruction[3:0];
                    ADD: acc <= acc + instruction[3:0];
                    SUB: acc <= acc - instruction[3:0];
                endcase
                state <= FETCH;  // 명령어 실행 후 FETCH 상태로 복귀
            end
        endcase
    end
end

endmodule