module Simple_CPU_4bit(
    input wire clk, 
    input wire reset,  
    input wire [3:0] memory_address, 
    output reg [3:0] data_out
);

// 메모리
reg [3:0] memory[15:0];

// 메모리에 초기값 설정
integer i;
initial begin
    for (i = 0; i < 16; i = i + 1) begin
        memory[i] = i^2;
    end
end

// CPU 레지스터 정의
reg [3:0] PC;   // 프로그램 카운터
reg [3:0] instruction; // 현재 명령어
reg [3:0] operand; // 현재 명령어의 피연산자

// Fetch 단계: 메모리에서 명령어를 가져옴
always @(posedge clk or posedge reset) begin
    if (reset) begin
        PC <= 4'b0000; // 리셋 시 PC를 0으로 설정
    end else begin
        PC <= PC + 1;  // PC를 다음 주소로 증가
    end
    instruction <= memory[PC]; // 현재 PC의 명령어를 가져옴
    operand <= memory[PC + 1]; // 현재 PC의 다음 위치에 있는 값을 피연산자로 가져옴
end

// Decode & Execute 단계
always @(posedge clk or posedge reset) begin
    if (reset) begin
        data_out <= 4'b0000; // 리셋 시 출력 초기화
    end else begin
        case (instruction[3:2]) // 명령어의 상위 2비트로 명령어를 분류
            2'b00: data_out <= operand; // Load 명령어: operand 값을 출력
            2'b01: memory[memory_address] <= operand; // Store 명령어: operand 값을 메모리에 저장
            2'b10: data_out <= data_out + operand; // Add 명령어: operand를 더해서 출력
            2'b11: data_out <= data_out - operand; // Subtract 명령어: operand를 빼서 출력
            default: data_out <= 4'b0000; // 기본적으로 결과를 초기화
        endcase
    end
end
endmodule